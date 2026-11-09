import '/components/employee_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_coverage_widget.dart' show RequestCoverageWidget;
import 'package:flutter/material.dart';

class RequestCoverageModel extends FlutterFlowModel<RequestCoverageWidget> {
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
