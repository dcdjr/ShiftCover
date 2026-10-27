import '/components/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_child_model.dart';
export 'bottom_nav_child_model.dart';

class BottomNavChildWidget extends StatefulWidget {
  const BottomNavChildWidget({
    super.key,
    String? activeTab,
  }) : this.activeTab = activeTab ?? 'availability';

  final String activeTab;

  @override
  State<BottomNavChildWidget> createState() => _BottomNavChildWidgetState();
}

class _BottomNavChildWidgetState extends State<BottomNavChildWidget> {
  late BottomNavChildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavChildModel());

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
            label: 'My Shifts',
            icon: Icon(
              Icons.calendar_month_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'my_shifts',
            selected: valueOrDefault<bool>(
              valueOrDefault<String>(
                        widget.activeTab,
                        'availability',
                      ) ==
                      'shifts'
                  ? true
                  : true,
              true,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel2,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Open Shifts',
            icon: Icon(
              Icons.explore_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'shifts',
            selected: valueOrDefault<bool>(
              valueOrDefault<String>(
                        widget.activeTab,
                        'availability',
                      ) ==
                      'requests'
                  ? true
                  : false,
              false,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel3,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Profile',
            icon: Icon(
              Icons.person_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            target: 'profile',
            selected: valueOrDefault<bool>(
              () {
                if (valueOrDefault<String>(
                      widget.activeTab,
                      'availability',
                    ) ==
                    'home') {
                  return false;
                } else if (valueOrDefault<String>(
                      widget.activeTab,
                      'availability',
                    ) ==
                    'post') {
                  return false;
                } else if (valueOrDefault<String>(
                      widget.activeTab,
                      'availability',
                    ) ==
                    'requests') {
                  return false;
                } else if (valueOrDefault<String>(
                      widget.activeTab,
                      'availability',
                    ) ==
                    'shifts') {
                  return false;
                } else {
                  return false;
                }
              }(),
              false,
            ),
          ),
        ),
      ],
    );
  }
}
