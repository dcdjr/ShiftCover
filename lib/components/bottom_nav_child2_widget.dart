import '/components/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_child2_model.dart';
export 'bottom_nav_child2_model.dart';

class BottomNavChild2Widget extends StatefulWidget {
  const BottomNavChild2Widget({
    super.key,
    String? activeTab,
  }) : this.activeTab = activeTab ?? 'approvals';

  final String activeTab;

  @override
  State<BottomNavChild2Widget> createState() => _BottomNavChild2WidgetState();
}

class _BottomNavChild2WidgetState extends State<BottomNavChild2Widget> {
  late BottomNavChild2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavChild2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        wrapWithModel(
          model: _model.navItemModel1,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Dashboard',
            icon: Icon(
              Icons.dashboard_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'dashboard',
            selected: valueOrDefault<bool>(
              valueOrDefault<String>(
                        widget.activeTab,
                        'approvals',
                      ) ==
                      'dashboard'
                  ? true
                  : false,
              false,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel2,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Approvals',
            icon: Icon(
              Icons.rule_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'approvals',
            selected: valueOrDefault<bool>(
              () {
                if (valueOrDefault<String>(
                      widget.activeTab,
                      'approvals',
                    ) ==
                    'dashboard') {
                  return false;
                } else if (valueOrDefault<String>(
                      widget.activeTab,
                      'approvals',
                    ) ==
                    'settings') {
                  return false;
                } else if (valueOrDefault<String>(
                      widget.activeTab,
                      'approvals',
                    ) ==
                    'staff') {
                  return false;
                } else {
                  return true;
                }
              }(),
              true,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel3,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Staff',
            icon: Icon(
              Icons.badge_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'staff',
            selected: valueOrDefault<bool>(
              valueOrDefault<String>(
                        widget.activeTab,
                        'approvals',
                      ) ==
                      'staff'
                  ? true
                  : false,
              false,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel4,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Settings',
            icon: Icon(
              Icons.settings_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'settings',
            selected: valueOrDefault<bool>(
              valueOrDefault<String>(
                        widget.activeTab,
                        'approvals',
                      ) ==
                      'settings'
                  ? true
                  : false,
              false,
            ),
          ),
        ),
      ],
    );
  }
}
