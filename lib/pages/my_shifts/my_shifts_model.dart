import '/components/employee_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_shifts_widget.dart' show MyShiftsWidget;
import 'package:flutter/material.dart';

class MyShiftsModel extends FlutterFlowModel<MyShiftsWidget> {
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
