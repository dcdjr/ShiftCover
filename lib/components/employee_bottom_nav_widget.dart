import '/components/bottom_nav_child_widget.dart';
import '/components/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'employee_bottom_nav_model.dart';
export 'employee_bottom_nav_model.dart';

class EmployeeBottomNavWidget extends StatefulWidget {
  const EmployeeBottomNavWidget({
    super.key,
    String? activeTab,
  }) : this.activeTab = activeTab ?? 'availability';

  final String activeTab;

  @override
  State<EmployeeBottomNavWidget> createState() =>
      _EmployeeBottomNavWidgetState();
}

class _EmployeeBottomNavWidgetState extends State<EmployeeBottomNavWidget> {
  late EmployeeBottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeBottomNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              shape: BoxShape.rectangle,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Container(
              child: wrapWithModel(
                model: _model.bottomNavModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavWidget(
                  child: () => BottomNavChildWidget(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
