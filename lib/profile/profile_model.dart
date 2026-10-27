import '/components/button_widget.dart';
import '/components/employee_bottom_nav_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  bool? profileRefresh = false;

  ///  State fields for stateful widgets in this page.

  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel;
  // State field(s) for profileName widget.
  FocusNode? profileNameFocusNode;
  TextEditingController? profileNameTextController;
  String? Function(BuildContext, String?)? profileNameTextControllerValidator;
  // State field(s) for profileJobRole widget.
  FocusNode? profileJobRoleFocusNode;
  TextEditingController? profileJobRoleTextController;
  String? Function(BuildContext, String?)?
      profileJobRoleTextControllerValidator;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for EmployeeBottomNav.
  late EmployeeBottomNavModel employeeBottomNavModel;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel = createModel(context, () => SectionHeaderModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    employeeBottomNavModel =
        createModel(context, () => EmployeeBottomNavModel());
  }

  @override
  void dispose() {
    sectionHeaderModel.dispose();
    profileNameFocusNode?.dispose();
    profileNameTextController?.dispose();

    profileJobRoleFocusNode?.dispose();
    profileJobRoleTextController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
    employeeBottomNavModel.dispose();
  }
}
