import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'manager_bottom_nav_model.dart';
export 'manager_bottom_nav_model.dart';

class ManagerBottomNavWidget extends StatefulWidget {
  const ManagerBottomNavWidget({
    super.key,
    String? activeTab,
  }) : this.activeTab = activeTab ?? 'approvals';

  final String activeTab;

  @override
  State<ManagerBottomNavWidget> createState() => _ManagerBottomNavWidgetState();
}

class _ManagerBottomNavWidgetState extends State<ManagerBottomNavWidget> {
  late ManagerBottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerBottomNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: custom_widgets.CoverageNavigation(
          activeTab: widget.activeTab,
        ),
      ),
    );
  }
}
