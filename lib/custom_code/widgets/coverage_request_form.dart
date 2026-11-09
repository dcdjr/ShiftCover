// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

/// Post an authenticated coverage request.
class CoverageRequestForm extends StatefulWidget {
  const CoverageRequestForm({super.key, this.width, this.height});
  final double? width, height;
  @override
  State<CoverageRequestForm> createState() => _CoverageRequestFormState();
}

class _CoverageRequestFormState extends State<CoverageRequestForm> {
  final _form = GlobalKey<FormState>();
  final _role = TextEditingController();
  final _note = TextEditingController();
  DateTime? _date;
  TimeOfDay? _start, _end;
  bool _saving = false;
  DocumentReference<Map<String, dynamic>>? _request;
  @override
  void dispose() {
    _role.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _post() async {
    if (_saving) return;
    try {
      unawaited(FirebaseAnalytics.instance.logEvent(
        name: 'request_coverage_clicked',
        parameters: {
          'screen_name': 'RequestCoverage',
          'button_name': 'post_shift_request',
        },
      ).catchError((Object _) {}));
    } catch (_) {
      // Analytics initialization must not prevent validation or posting.
    }
    if (!_form.currentState!.validate()) return;
    if (_date == null || _start == null || _end == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Select a date, start time and end time.')));
      return;
    }
    if (_start == _end) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Start and end times must differ.')));
      return;
    }
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please sign in to post a request.')));
      return;
    }
    final start = DateTime(
        _date!.year, _date!.month, _date!.day, _start!.hour, _start!.minute);
    if (!start.isAfter(DateTime.now())) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select a future shift start.')));
      return;
    }
    var end = DateTime(
        _date!.year, _date!.month, _date!.day, _end!.hour, _end!.minute);
    if (!end.isAfter(start))
      end = DateTime(
          _date!.year, _date!.month, _date!.day + 1, _end!.hour, _end!.minute);
    setState(() => _saving = true);
    try {
      final profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final name = (profile.data()?['displayName'] as String? ?? '').trim();
      if (name.isEmpty)
        throw StateError('Complete your profile before posting.');
      _request ??=
          FirebaseFirestore.instance.collection('coverage_requests').doc();
      final data = <String, dynamic>{
        'requesterUid': user.uid,
        'requesterName': name,
        'jobRole': _role.text.trim(),
        'startAt': Timestamp.fromDate(start),
        'endAt': Timestamp.fromDate(end),
        'note': _note.text.trim(),
        'status': 'open',
        'createdAt': FieldValue.serverTimestamp(),
      };
      await FirebaseFirestore.instance.runTransaction((tx) async {
        final existing = await tx.get(_request!);
        if (existing.exists) {
          if (existing.data()?['requesterUid'] != user.uid)
            throw StateError('Please sign in again.');
          return;
        }
        tx.set(_request!, data);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Shift request posted.')));
      context.goNamed('RequestStatus',
          queryParameters: {'requestId': _request!.id});
    } catch (_) {
      if (mounted)
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Could not post your request. Please try again.')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Form(
            key: _form,
            child: ListView(padding: const EdgeInsets.all(24), children: [
              Text('SHIFT DETAILS', style: theme.textTheme.labelLarge),
              const SizedBox(height: 16),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today),
                  title: Text(_date == null
                      ? 'Select shift date'
                      : MaterialLocalizations.of(context)
                          .formatMediumDate(_date!)),
                  onTap: _saving
                      ? null
                      : () async {
                          final d = await showDatePicker(
                              context: context,
                              initialDate: _date ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 730)));
                          if (d != null && mounted) setState(() => _date = d);
                        }),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.schedule),
                  title: Text(_start == null
                      ? 'Select start time'
                      : 'Start: ${_start!.format(context)}'),
                  onTap: _saving
                      ? null
                      : () async {
                          final t = await showTimePicker(
                              context: context,
                              initialTime: _start ?? TimeOfDay.now());
                          if (t != null && mounted) setState(() => _start = t);
                        }),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.schedule),
                  title: Text(_end == null
                      ? 'Select end time'
                      : 'End: ${_end!.format(context)}'),
                  subtitle: const Text(
                      'Earlier end times are treated as the next day.'),
                  onTap: _saving
                      ? null
                      : () async {
                          final t = await showTimePicker(
                              context: context,
                              initialTime: _end ?? TimeOfDay.now());
                          if (t != null && mounted) setState(() => _end = t);
                        }),
              const SizedBox(height: 16),
              TextFormField(
                  controller: _role,
                  enabled: !_saving,
                  decoration: const InputDecoration(
                      labelText: 'Job role', border: OutlineInputBorder()),
                  maxLength: 60,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty || v.trim().length > 60)
                          ? 'Enter a job role between 1 and 60 characters.'
                          : null),
              const SizedBox(height: 16),
              TextFormField(
                  controller: _note,
                  enabled: !_saving,
                  maxLines: 3,
                  maxLength: 1000,
                  validator: (v) => (v?.length ?? 0) > 1000
                      ? 'Keep the note within 1000 characters.'
                      : null,
                  decoration: const InputDecoration(
                      labelText: 'Note (optional)',
                      border: OutlineInputBorder())),
              const SizedBox(height: 24),
              FilledButton(
                  onPressed: _saving ? null : _post,
                  child: Text(_saving ? 'Posting...' : 'Post Shift Request')),
            ])));
  }
}
