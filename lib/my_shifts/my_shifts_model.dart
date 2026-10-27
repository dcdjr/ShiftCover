import '/components/button_widget.dart';
import '/components/employee_bottom_nav_widget.dart';
import '/components/request_tracker_widget.dart';
import '/components/shift_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_shifts_widget.dart' show MyShiftsWidget;
import 'package:flutter/material.dart';

class MyShiftsModel extends FlutterFlowModel<MyShiftsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ShiftItem.
  late ShiftItemModel shiftItemModel1;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for RequestTracker.
  late RequestTrackerModel requestTrackerModel;
  // Model for ShiftItem.
  late ShiftItemModel shiftItemModel2;
  // Model for ShiftItem.
  late ShiftItemModel shiftItemModel3;
  // Model for ShiftItem.
  late ShiftItemModel shiftItemModel4;
  // Model for EmployeeBottomNav.
  late EmployeeBottomNavModel employeeBottomNavModel;

  @override
  void initState(BuildContext context) {
    shiftItemModel1 = createModel(context, () => ShiftItemModel());
    buttonModel = createModel(context, () => ButtonModel());
    requestTrackerModel = createModel(context, () => RequestTrackerModel());
    shiftItemModel2 = createModel(context, () => ShiftItemModel());
    shiftItemModel3 = createModel(context, () => ShiftItemModel());
    shiftItemModel4 = createModel(context, () => ShiftItemModel());
    employeeBottomNavModel =
        createModel(context, () => EmployeeBottomNavModel());
  }

  @override
  void dispose() {
    shiftItemModel1.dispose();
    buttonModel.dispose();
    requestTrackerModel.dispose();
    shiftItemModel2.dispose();
    shiftItemModel3.dispose();
    shiftItemModel4.dispose();
    employeeBottomNavModel.dispose();
  }
}
