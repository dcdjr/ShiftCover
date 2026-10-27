import '/components/button_widget.dart';
import '/components/employee_bottom_nav_widget.dart';
import '/components/step_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_status_widget.dart' show RequestStatusWidget;
import 'package:flutter/material.dart';

class RequestStatusModel extends FlutterFlowModel<RequestStatusWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel1;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel2;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel3;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel4;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for EmployeeBottomNav.
  late EmployeeBottomNavModel employeeBottomNavModel;

  @override
  void initState(BuildContext context) {
    stepIndicatorModel1 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel2 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel3 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel4 = createModel(context, () => StepIndicatorModel());
    buttonModel = createModel(context, () => ButtonModel());
    employeeBottomNavModel =
        createModel(context, () => EmployeeBottomNavModel());
  }

  @override
  void dispose() {
    stepIndicatorModel1.dispose();
    stepIndicatorModel2.dispose();
    stepIndicatorModel3.dispose();
    stepIndicatorModel4.dispose();
    buttonModel.dispose();
    employeeBottomNavModel.dispose();
  }
}
