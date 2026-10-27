import '/flutter_flow/flutter_flow_util.dart';
import 'password_text_field_widget.dart' show PasswordTextFieldWidget;
import 'package:flutter/material.dart';

class PasswordTextFieldModel extends FlutterFlowModel<PasswordTextFieldWidget> {
  ///  Local state fields for this component.

  String? input;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Input widget.
  late FocusNode inputPasswordVisibilityFocusNode;
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  late bool inputVisibility;
  String? Function(BuildContext, String?)? inputTextControllerValidator;

  @override
  void initState(BuildContext context) {
    inputPasswordVisibilityFocusNode = FocusNode();
    inputVisibility = false;
  }

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
    inputPasswordVisibilityFocusNode.dispose();
  }
}
