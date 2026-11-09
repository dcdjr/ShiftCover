import '/components/employee_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'request_status_model.dart';
export 'request_status_model.dart';

class RequestStatusWidget extends StatefulWidget {
  const RequestStatusWidget({super.key});

  static String routeName = 'RequestStatus';
  static String routePath = '/requestStatus';

  @override
  State<RequestStatusWidget> createState() => _RequestStatusWidgetState();
}

class _RequestStatusWidgetState extends State<RequestStatusWidget> {
  late RequestStatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestStatusModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RequestStatus'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'REQUEST_STATUS_PAGE_IconButton_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(MyShiftsWidget.routeName);
                                },
                              ),
                              Text(
                                'Request Tracker',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: custom_widgets.CoverageRequestFeed(
                  mode: 'status',
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                child: wrapWithModel(
                  model: _model.employeeBottomNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: EmployeeBottomNavWidget(
                    activeTab: 'MyShifts',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
