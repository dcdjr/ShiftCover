import '/components/employee_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'open_shifts_widget.dart' show OpenShiftsWidget;
import 'package:flutter/material.dart';

class OpenShiftsModel extends FlutterFlowModel<OpenShiftsWidget> {
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
