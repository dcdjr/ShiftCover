import '/components/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_bottom_nav_widget.dart' show ManagerBottomNavWidget;
import 'package:flutter/material.dart';

class ManagerBottomNavModel extends FlutterFlowModel<ManagerBottomNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
