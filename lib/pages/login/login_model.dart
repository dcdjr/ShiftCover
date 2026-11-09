import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for loginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  String? _loginEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email Address is required.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  // State field(s) for loginPassword widget.
  late FocusNode loginPasswordPasswordVisibilityFocusNode;
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  String? _loginPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  // Model for confirmLoginEmail.
  late ButtonModel confirmLoginEmailModel;
  // Model for signupNav.
  late ButtonModel signupNavModel;

  @override
  void initState(BuildContext context) {
    loginEmailTextControllerValidator = _loginEmailTextControllerValidator;
    loginPasswordPasswordVisibilityFocusNode = FocusNode();
    loginPasswordVisibility = false;
    loginPasswordTextControllerValidator =
        _loginPasswordTextControllerValidator;
    confirmLoginEmailModel = createModel(context, () => ButtonModel());
    signupNavModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordTextController?.dispose();
    loginPasswordPasswordVisibilityFocusNode.dispose();
    confirmLoginEmailModel.dispose();
    signupNavModel.dispose();
  }
}
