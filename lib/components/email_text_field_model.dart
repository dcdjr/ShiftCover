import '/flutter_flow/flutter_flow_util.dart';
import 'email_text_field_widget.dart' show EmailTextFieldWidget;
import 'package:flutter/material.dart';

class EmailTextFieldModel extends FlutterFlowModel<EmailTextFieldWidget> {
  ///  Local state fields for this component.

  String? input;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
