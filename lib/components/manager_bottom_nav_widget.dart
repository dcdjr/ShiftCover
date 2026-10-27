import '/components/bottom_nav_child2_widget.dart';
import '/components/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'manager_bottom_nav_model.dart';
export 'manager_bottom_nav_model.dart';

class ManagerBottomNavWidget extends StatefulWidget {
  const ManagerBottomNavWidget({
    super.key,
    String? activeTab,
  }) : this.activeTab = activeTab ?? 'approvals';

  final String activeTab;

  @override
  State<ManagerBottomNavWidget> createState() => _ManagerBottomNavWidgetState();
}

class _ManagerBottomNavWidgetState extends State<ManagerBottomNavWidget> {
  late ManagerBottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerBottomNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
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
            wrapWithModel(
              model: _model.bottomNavModel,
              updateCallback: () => safeSetState(() {}),
              child: BottomNavWidget(
                child: () => BottomNavChild2Widget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
