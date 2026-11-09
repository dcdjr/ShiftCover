import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'approval_card_widget.dart' show ApprovalCardWidget;
import 'package:flutter/material.dart';

class ApprovalCardModel extends FlutterFlowModel<ApprovalCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
