import '/components/manager_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'manager_approvals_widget.dart' show ManagerApprovalsWidget;
import 'package:flutter/material.dart';

class ManagerApprovalsModel extends FlutterFlowModel<ManagerApprovalsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ManagerBottomNav.
  late ManagerBottomNavModel managerBottomNavModel;

  @override
  void initState(BuildContext context) {
    managerBottomNavModel = createModel(context, () => ManagerBottomNavModel());
  }

  @override
  void dispose() {
    managerBottomNavModel.dispose();
  }
}
