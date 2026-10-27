import '/components/button_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_setup_widget.dart' show ProfileSetupWidget;
import 'package:flutter/material.dart';

class ProfileSetupModel extends FlutterFlowModel<ProfileSetupWidget> {
  ///  Local state fields for this page.

  bool? profileRefresh = false;

  ///  State fields for stateful widgets in this page.

  // Model for TopBar.
  late TopBarModel topBarModel;
  // State field(s) for setupName widget.
  FocusNode? setupNameFocusNode;
  TextEditingController? setupNameTextController;
  String? Function(BuildContext, String?)? setupNameTextControllerValidator;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    setupNameFocusNode?.dispose();
    setupNameTextController?.dispose();

    buttonModel.dispose();
  }
}
