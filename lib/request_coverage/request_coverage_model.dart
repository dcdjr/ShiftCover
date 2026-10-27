import '/components/audience_option_widget.dart';
import '/components/button_widget.dart';
import '/components/email_text_field_widget.dart';
import '/components/employee_bottom_nav_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_coverage_widget.dart' show RequestCoverageWidget;
import 'package:flutter/material.dart';

class RequestCoverageModel extends FlutterFlowModel<RequestCoverageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for AudienceOption.
  late AudienceOptionModel audienceOptionModel1;
  // Model for AudienceOption.
  late AudienceOptionModel audienceOptionModel2;
  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel3;
  // Model for TextField.
  late EmailTextFieldModel textFieldModel;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for EmployeeBottomNav.
  late EmployeeBottomNavModel employeeBottomNavModel;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    audienceOptionModel1 = createModel(context, () => AudienceOptionModel());
    audienceOptionModel2 = createModel(context, () => AudienceOptionModel());
    sectionHeaderModel3 = createModel(context, () => SectionHeaderModel());
    textFieldModel = createModel(context, () => EmailTextFieldModel());
    buttonModel = createModel(context, () => ButtonModel());
    employeeBottomNavModel =
        createModel(context, () => EmployeeBottomNavModel());
  }

  @override
  void dispose() {
    sectionHeaderModel1.dispose();
    sectionHeaderModel2.dispose();
    audienceOptionModel1.dispose();
    audienceOptionModel2.dispose();
    sectionHeaderModel3.dispose();
    textFieldModel.dispose();
    buttonModel.dispose();
    employeeBottomNavModel.dispose();
  }
}
