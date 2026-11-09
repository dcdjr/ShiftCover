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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class NpsSurveyButton extends StatefulWidget {
  const NpsSurveyButton({super.key, this.width, this.height});
  final double? width, height;
  @override
  State<NpsSurveyButton> createState() => _NpsSurveyButtonState();
}

class _NpsSurveyButtonState extends State<NpsSurveyButton> {
  bool _dialogOpen = false;

  Future<void> _open() async {
    if (_dialogOpen) return;
    if (FirebaseAuth.instance.currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please sign in to rate ShiftCover.')));
      return;
    }
    _dialogOpen = true;
    try {
      await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => const _NpsDialog());
    } finally {
      _dialogOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: InkWell(
            onTap: _open,
            child: ButtonWidget(
              content: 'Rate ShiftCover',
              variant: 'primary',
              size: 'medium',
              fullWidth: true,
              iconPresent: false,
              iconEndPresent: false,
              loading: false,
              disabled: false,
            )),
      );
}

class _NpsDialog extends StatefulWidget {
  const _NpsDialog();
  @override
  State<_NpsDialog> createState() => _NpsDialogState();
}

class _NpsDialogState extends State<_NpsDialog> {
  int? _score;
  bool _saving = false;
  String? _error;

  Future<void> _submit() async {
    if (_saving || _score == null) return;
    final score = _score!;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      setState(() => _error = 'Please sign in again.');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final token = await user.getIdTokenResult();
      if (FirebaseAuth.instance.currentUser?.uid != user.uid) {
        throw StateError('Your sign-in changed.');
      }
      await FirebaseFirestore.instance
          .collection('nps_responses')
          .doc(user.uid)
          .set({
        'user_id': user.uid,
        'score': score,
        'role': token.claims?['manager'] == true ? 'manager' : 'employee',
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (_) {
      if (mounted) {
        setState(() {
          _saving = false;
          _error =
              'Could not save your rating. Check your connection and try again.';
        });
      }
      return;
    }
    // A confirmed Firestore save is the success boundary; Analytics failure
    // must not turn an already-saved response into a retry/duplicate event.
    try {
      await FirebaseAnalytics.instance
          .logEvent(name: 'nps_submitted', parameters: {'score': score});
    } catch (_) {
      debugPrint('NPS saved; Analytics logging was not confirmed.');
    }
    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    Navigator.of(context).pop();
    messenger.showSnackBar(
        const SnackBar(content: Text('Thank you. Your rating was saved.')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return PopScope(
        canPop: !_saving,
        child: AlertDialog(
          backgroundColor: theme.secondaryBackground,
          title: Text('Rate ShiftCover', style: theme.titleMedium),
          content: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('How likely are you to recommend ShiftCover to a coworker?',
                style: theme.bodyMedium),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              initialValue: _score,
              decoration: const InputDecoration(labelText: 'Score (0–10)'),
              items: List.generate(
                  11,
                  (score) =>
                      DropdownMenuItem(value: score, child: Text('$score'))),
              onChanged:
                  _saving ? null : (score) => setState(() => _score = score),
            ),
            if (_error != null)
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(_error!,
                      style: theme.bodyMedium.copyWith(color: theme.error))),
          ])),
          actions: [
            TextButton(
                onPressed: _saving ? null : () => Navigator.of(context).pop(),
                child: const Text('Not now')),
            FilledButton(
                onPressed: _saving || _score == null ? null : _submit,
                style: FilledButton.styleFrom(
                    backgroundColor: theme.primary,
                    foregroundColor: theme.info),
                child: Text(_saving ? 'Saving…' : 'Submit')),
          ],
        ));
  }
}
