import '/components/employee_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'request_status_widget.dart' show RequestStatusWidget;
import 'package:flutter/material.dart';

class RequestStatusModel extends FlutterFlowModel<RequestStatusWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EmployeeBottomNav.
  late EmployeeBottomNavModel employeeBottomNavModel;

  @override
  void initState(BuildContext context) {
    employeeBottomNavModel =
        createModel(context, () => EmployeeBottomNavModel());
  }

  @override
  void dispose() {
    employeeBottomNavModel.dispose();
  }
}
