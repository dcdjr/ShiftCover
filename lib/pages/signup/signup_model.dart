import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for signupEmail widget.
  FocusNode? signupEmailFocusNode;
  TextEditingController? signupEmailTextController;
  String? Function(BuildContext, String?)? signupEmailTextControllerValidator;
  String? _signupEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email Address is required.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  // State field(s) for signupPassword widget.
  late FocusNode signupPasswordPasswordVisibilityFocusNode;
  FocusNode? signupPasswordFocusNode;
  TextEditingController? signupPasswordTextController;
  late bool signupPasswordVisibility;
  String? Function(BuildContext, String?)?
      signupPasswordTextControllerValidator;
  String? _signupPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  // State field(s) for signupConfirm widget.
  late FocusNode signupConfirmPasswordVisibilityFocusNode;
  FocusNode? signupConfirmFocusNode;
  TextEditingController? signupConfirmTextController;
  late bool signupConfirmVisibility;
  String? Function(BuildContext, String?)? signupConfirmTextControllerValidator;
  String? _signupConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required.';
    }

    return null;
  }

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    signupEmailTextControllerValidator = _signupEmailTextControllerValidator;
    signupPasswordPasswordVisibilityFocusNode = FocusNode();
    signupPasswordVisibility = false;
    signupPasswordTextControllerValidator =
        _signupPasswordTextControllerValidator;
    signupConfirmPasswordVisibilityFocusNode = FocusNode();
    signupConfirmVisibility = false;
    signupConfirmTextControllerValidator =
        _signupConfirmTextControllerValidator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    signupEmailFocusNode?.dispose();
    signupEmailTextController?.dispose();

    signupPasswordFocusNode?.dispose();
    signupPasswordTextController?.dispose();
    signupPasswordPasswordVisibilityFocusNode.dispose();
    signupConfirmFocusNode?.dispose();
    signupConfirmTextController?.dispose();
    signupConfirmPasswordVisibilityFocusNode.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
