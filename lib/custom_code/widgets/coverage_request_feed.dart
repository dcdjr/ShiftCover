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
import 'package:go_router/go_router.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class CoverageRequestFeed extends StatefulWidget {
  const CoverageRequestFeed(
      {super.key, this.width, this.height, this.mode = 'open'});
  final double? width, height;
  final String mode;
  @override
  State<CoverageRequestFeed> createState() => _CoverageRequestFeedState();
}

class _CoverageRequestFeedState extends State<CoverageRequestFeed> {
  late Future<bool> _manager;
  final Set<String> _busy = {};
  int _retry = 0;
  @override
  void initState() {
    super.initState();
    _manager = _isManager();
  }

  Future<bool> _isManager() async =>
      (await FirebaseAuth.instance.currentUser?.getIdTokenResult(true))
          ?.claims?['manager'] ==
      true;

  void _message(String text) {
    if (mounted)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _transition(
      DocumentReference<Map<String, dynamic>> ref, String status) async {
    if (_busy.contains(ref.id)) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _message('Please sign in again.');
      return;
    }
    setState(() => _busy.add(ref.id));
    try {
      final db = FirebaseFirestore.instance;
      await db.runTransaction((tx) async {
        final snapshot = await tx.get(ref);
        final person = await tx.get(db.collection('users').doc(user.uid));
        final data = snapshot.data();
        final name = (person.data()?['displayName'] as String? ?? '').trim();
        if (name.isEmpty)
          throw StateError('Complete your profile before continuing.');
        if (data == null) throw StateError('This request no longer exists.');
        if (status == 'pending_approval') {
          if (data['requesterUid'] == user.uid)
            throw StateError('You cannot claim your own request.');
          if (data['status'] != 'open')
            throw StateError('This shift has already been claimed.');
          if (!(data['startAt'] as Timestamp)
              .toDate()
              .isAfter(DateTime.now())) {
            throw StateError('This shift has already started.');
          }
          tx.update(ref, {
            'status': status,
            'claimedByUid': user.uid,
            'claimedByName': name,
            'claimedAt': FieldValue.serverTimestamp()
          });
        } else {
          if (data['status'] != 'pending_approval')
            throw StateError('This request has already been reviewed.');
          tx.update(ref, {
            'status': status,
            'reviewedByUid': user.uid,
            'reviewedByName': name,
            'reviewedAt': FieldValue.serverTimestamp()
          });
        }
      });
      _message(status == 'pending_approval'
          ? 'Shift claimed. Pending manager approval.'
          : status == 'approved'
              ? 'Coverage approved.'
              : 'Coverage rejected. The original employee remains responsible.');
    } on StateError catch (e) {
      _message(e.message);
    } on FirebaseException catch (e) {
      _message(e.code == 'permission-denied'
          ? 'This request is no longer available or you do not have permission. Refresh and try again.'
          : 'The change was not confirmed. Check your connection and retry.');
    } catch (_) {
      _message('The change could not be completed. Please try again.');
    } finally {
      if (mounted) setState(() => _busy.remove(ref.id));
    }
  }

  Widget _notice(String message, {bool retry = false}) => Center(
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(message, textAlign: TextAlign.center),
            if (retry)
              TextButton(
                  onPressed: () => setState(() {
                        _retry++;
                        _manager = _isManager();
                      }),
                  child: const Text('Retry')),
          ])));

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return _notice('Sign in to view coverage requests.');
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: widget.mode == 'manager'
            ? FutureBuilder<bool>(
                future: _manager,
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return _notice('Could not verify manager access.',
                        retry: true);
                  if (!snapshot.hasData)
                    return const Center(child: CircularProgressIndicator());
                  if (snapshot.data != true)
                    return _notice(
                        'Manager access is required to review requests.');
                  return _feed(uid);
                })
            : _feed(uid));
  }

  Widget _feed(String uid) {
    final requests = FirebaseFirestore.instance.collection('coverage_requests');
    final id = widget.mode == 'status'
        ? GoRouterState.of(context).uri.queryParameters['requestId']
        : null;
    if (id != null && id.isNotEmpty) {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          key: ValueKey('detail-$id-$_retry'),
          stream: requests.doc(id).snapshots(),
          builder: (context, s) {
            if (s.hasError)
              return _notice(
                  'Could not load this request. Check your connection and access.',
                  retry: true);
            if (!s.hasData)
              return const Center(child: CircularProgressIndicator());
            if (!s.data!.exists)
              return _notice('This request no longer exists.');
            final request = s.data!;
            return ListView(
                padding: const EdgeInsets.all(24),
                children: [_card(request, uid, detail: true)]);
          });
    }
    Query<Map<String, dynamic>> query = requests;
    if (widget.mode == 'open' || widget.mode == 'manager') {
      query = query.where('status',
          isEqualTo: widget.mode == 'open' ? 'open' : 'pending_approval');
    } else {
      query = query.where(Filter.or(Filter('requesterUid', isEqualTo: uid),
          Filter('claimedByUid', isEqualTo: uid)));
    }
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        key: ValueKey('${widget.mode}-$_retry'),
        stream: query.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, s) {
          if (s.hasError)
            return _notice(
                'Could not load requests. Check your connection and try again.',
                retry: true);
          if (!s.hasData)
            return const Center(child: CircularProgressIndicator());
          final docs = s.data!.docs;
          if (docs.isEmpty)
            return _notice(widget.mode == 'open'
                ? 'No open shift requests yet.'
                : widget.mode == 'manager'
                    ? 'No requests awaiting approval.'
                    : 'You have not posted or claimed any requests yet.');
          return ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: docs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) => _card(docs[i], uid));
        });
  }

  Widget _card(DocumentSnapshot<Map<String, dynamic>> doc, String uid,
      {bool detail = false}) {
    final d = doc.data()!;
    final theme = FlutterFlowTheme.of(context);
    final local = MaterialLocalizations.of(context);
    String date(dynamic value) {
      if (value is! Timestamp) return 'Awaiting confirmation';
      final t = value.toDate();
      return '${local.formatMediumDate(t)} · ${local.formatTimeOfDay(TimeOfDay.fromDateTime(t))}';
    }

    final status = d['status'] as String? ?? 'open';
    final label = {
          'open': 'Open',
          'pending_approval': 'Pending Approval',
          'approved': 'Approved',
          'rejected': 'Rejected'
        }[status] ??
        status;
    final busy = _busy.contains(doc.id);
    final own = d['requesterUid'] == uid;
    final canClaim = status == 'open' && !own && widget.mode != 'manager';
    final responsible =
        status == 'approved' ? d['claimedByName'] : d['requesterName'];
    return Card(
        color: theme.secondaryBackground,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.alternate)),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(
                    child: Text(d['jobRole'] as String? ?? 'Shift',
                        style: theme.titleMedium)),
                const SizedBox(width: 8),
                Flexible(
                    child: Text(label,
                        style: theme.labelMedium.copyWith(
                            color: status == 'rejected'
                                ? theme.error
                                : theme.primary)))
              ]),
              const SizedBox(height: 10),
              Text(
                  'Requested by ${d['requesterName'] ?? 'Employee'}${own ? ' (you)' : ''}',
                  style: theme.bodyMedium),
              const SizedBox(height: 6),
              Text('${date(d['startAt'])}\nto ${date(d['endAt'])}',
                  style: theme.bodyMedium),
              if ((d['note'] as String? ?? '').isNotEmpty)
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(d['note'], style: theme.bodyMedium)),
              if (d['claimedByUid'] != null)
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                        '${status == 'approved' ? 'Covering employee' : 'Claimed by'}: ${d['claimedByName']}${d['claimedByUid'] == uid ? ' (you)' : ''}',
                        style: theme.bodyMedium)),
              if (d['reviewedByUid'] != null)
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                        '$label by ${d['reviewedByName'] ?? d['reviewedByUid']}\n${date(d['reviewedAt'])}',
                        style: theme.bodyMedium)),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Responsible for this shift: $responsible',
                      style: theme.bodyMedium)),
              if (status == 'pending_approval')
                Text(
                    'The original employee remains responsible until approval.',
                    style: theme.labelMedium),
              if (status == 'rejected')
                Text(
                    'Coverage was not approved. The original employee remains responsible.',
                    style: theme.labelMedium),
              const SizedBox(height: 12),
              Wrap(spacing: 8, runSpacing: 8, children: [
                if (canClaim)
                  FilledButton(
                      onPressed: busy
                          ? null
                          : () =>
                              _transition(doc.reference, 'pending_approval'),
                      style: FilledButton.styleFrom(
                          backgroundColor: theme.primary),
                      child: Text(busy ? 'Claiming...' : 'Claim Shift')),
                if (widget.mode == 'manager' &&
                    status == 'pending_approval') ...[
                  FilledButton(
                      onPressed: busy
                          ? null
                          : () => _transition(doc.reference, 'approved'),
                      style: FilledButton.styleFrom(
                          backgroundColor: theme.primary),
                      child: Text(busy ? 'Saving...' : 'Approve')),
                  OutlinedButton(
                      onPressed: busy
                          ? null
                          : () => _transition(doc.reference, 'rejected'),
                      child: const Text('Reject')),
                ],
                if (!detail)
                  TextButton(
                      onPressed: () => context.pushNamed('RequestStatus',
                          queryParameters: {'requestId': doc.id}),
                      child: const Text('View Status')),
              ]),
            ])));
  }
}
