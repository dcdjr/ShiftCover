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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class CoverageNavigation extends StatefulWidget {
  const CoverageNavigation(
      {super.key, this.width, this.height, this.activeTab = ''});
  final double? width, height;
  final String activeTab;
  @override
  State<CoverageNavigation> createState() => _CoverageNavigationState();
}

class _CoverageNavigationState extends State<CoverageNavigation> {
  bool _requestNavigating = false;
  late final Future<IdTokenResult?> token =
      FirebaseAuth.instance.currentUser?.getIdTokenResult() ??
          Future<IdTokenResult?>.value(null);
  @override
  Widget build(BuildContext context) => FutureBuilder<IdTokenResult?>(
      future: token,
      builder: (context, s) {
        final theme = FlutterFlowTheme.of(context);
        final routes = [
          'MyShifts',
          'OpenShifts',
          'RequestCoverage',
          if (s.data?.claims?['manager'] == true) 'ManagerApprovals',
          'Profile'
        ];
        final labels = [
          'My Shifts',
          'Open Shifts',
          'Request',
          if (s.data?.claims?['manager'] == true) 'Approvals',
          'Profile'
        ];
        final icons = [
          Icons.calendar_today,
          Icons.swap_horiz,
          Icons.add_circle_outline,
          if (s.data?.claims?['manager'] == true) Icons.fact_check_outlined,
          Icons.person_outline
        ];
        final aliases = {
          'availability': 'OpenShifts',
          'open_shifts': 'OpenShifts',
          'my_shifts': 'MyShifts',
          'approvals': 'ManagerApprovals',
          'profile': 'Profile',
          'request': 'RequestCoverage',
          'requests': 'MyShifts'
        };
        final selected = aliases[widget.activeTab] ?? widget.activeTab;
        return Container(
            color: theme.secondaryBackground,
            child: SafeArea(
                top: false,
                child: Row(children: [
                  for (var i = 0; i < routes.length; i++)
                    Expanded(
                        child: Semantics(
                            selected: selected == routes[i],
                            button: true,
                            child: InkWell(
                                onTap: () {
                                  if (routes[i] == 'RequestCoverage' &&
                                      selected == 'MyShifts') {
                                    if (_requestNavigating) return;
                                    _requestNavigating = true;
                                  }
                                  context.goNamed(routes[i]);
                                },
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 2),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(icons[i],
                                              size: 22,
                                              color: selected == routes[i]
                                                  ? theme.primary
                                                  : theme.secondaryText),
                                          const SizedBox(height: 4),
                                          Text(labels[i],
                                              maxLines: 1,
                                              style: theme.labelSmall.copyWith(
                                                  color: selected == routes[i]
                                                      ? theme.primary
                                                      : theme.secondaryText))
                                        ]))))),
                ])));
      });
}
