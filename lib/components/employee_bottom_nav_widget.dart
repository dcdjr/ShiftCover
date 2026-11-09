import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'employee_bottom_nav_model.dart';
export 'employee_bottom_nav_model.dart';

class EmployeeBottomNavWidget extends StatefulWidget {
  const EmployeeBottomNavWidget({
    super.key,
    String? activeTab,
  }) : this.activeTab = activeTab ?? 'availability';

  final String activeTab;

  @override
  State<EmployeeBottomNavWidget> createState() =>
      _EmployeeBottomNavWidgetState();
}

class _EmployeeBottomNavWidgetState extends State<EmployeeBottomNavWidget> {
  late EmployeeBottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeBottomNavModel());

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
