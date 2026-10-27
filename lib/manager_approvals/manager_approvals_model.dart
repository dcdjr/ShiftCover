import '/components/approval_card_widget.dart';
import '/components/manager_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_approvals_widget.dart' show ManagerApprovalsWidget;
import 'package:flutter/material.dart';

class ManagerApprovalsModel extends FlutterFlowModel<ManagerApprovalsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ApprovalCard.
  late ApprovalCardModel approvalCardModel1;
  // Model for ApprovalCard.
  late ApprovalCardModel approvalCardModel2;
  // Model for ApprovalCard.
  late ApprovalCardModel approvalCardModel3;
  // Model for ManagerBottomNav.
  late ManagerBottomNavModel managerBottomNavModel;

  @override
  void initState(BuildContext context) {
    approvalCardModel1 = createModel(context, () => ApprovalCardModel());
    approvalCardModel2 = createModel(context, () => ApprovalCardModel());
    approvalCardModel3 = createModel(context, () => ApprovalCardModel());
    managerBottomNavModel = createModel(context, () => ManagerBottomNavModel());
  }

  @override
  void dispose() {
    approvalCardModel1.dispose();
    approvalCardModel2.dispose();
    approvalCardModel3.dispose();
    managerBottomNavModel.dispose();
  }
}
