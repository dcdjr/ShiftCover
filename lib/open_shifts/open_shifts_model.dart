import '/components/employee_bottom_nav_widget.dart';
import '/components/filter_chip_widget.dart';
import '/components/shift_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'open_shifts_widget.dart' show OpenShiftsWidget;
import 'package:flutter/material.dart';

class OpenShiftsModel extends FlutterFlowModel<OpenShiftsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FilterChip.
  late FilterChipModel filterChipModel1;
  // Model for FilterChip.
  late FilterChipModel filterChipModel2;
  // Model for FilterChip.
  late FilterChipModel filterChipModel3;
  // Model for FilterChip.
  late FilterChipModel filterChipModel4;
  // Model for FilterChip.
  late FilterChipModel filterChipModel5;
  // Model for ShiftCard.
  late ShiftCardModel shiftCardModel1;
  // Model for ShiftCard.
  late ShiftCardModel shiftCardModel2;
  // Model for ShiftCard.
  late ShiftCardModel shiftCardModel3;
  // Model for ShiftCard.
  late ShiftCardModel shiftCardModel4;
  // Model for ShiftCard.
  late ShiftCardModel shiftCardModel5;
  // Model for EmployeeBottomNav.
  late EmployeeBottomNavModel employeeBottomNavModel;

  @override
  void initState(BuildContext context) {
    filterChipModel1 = createModel(context, () => FilterChipModel());
    filterChipModel2 = createModel(context, () => FilterChipModel());
    filterChipModel3 = createModel(context, () => FilterChipModel());
    filterChipModel4 = createModel(context, () => FilterChipModel());
    filterChipModel5 = createModel(context, () => FilterChipModel());
    shiftCardModel1 = createModel(context, () => ShiftCardModel());
    shiftCardModel2 = createModel(context, () => ShiftCardModel());
    shiftCardModel3 = createModel(context, () => ShiftCardModel());
    shiftCardModel4 = createModel(context, () => ShiftCardModel());
    shiftCardModel5 = createModel(context, () => ShiftCardModel());
    employeeBottomNavModel =
        createModel(context, () => EmployeeBottomNavModel());
  }

  @override
  void dispose() {
    filterChipModel1.dispose();
    filterChipModel2.dispose();
    filterChipModel3.dispose();
    filterChipModel4.dispose();
    filterChipModel5.dispose();
    shiftCardModel1.dispose();
    shiftCardModel2.dispose();
    shiftCardModel3.dispose();
    shiftCardModel4.dispose();
    shiftCardModel5.dispose();
    employeeBottomNavModel.dispose();
  }
}
