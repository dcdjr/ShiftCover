import '/components/employee_bottom_nav_widget.dart';
import '/components/filter_chip_widget.dart';
import '/components/shift_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'open_shifts_model.dart';
export 'open_shifts_model.dart';

class OpenShiftsWidget extends StatefulWidget {
  const OpenShiftsWidget({super.key});

  static String routeName = 'OpenShifts';
  static String routePath = '/openShifts';

  @override
  State<OpenShiftsWidget> createState() => _OpenShiftsWidgetState();
}

class _OpenShiftsWidgetState extends State<OpenShiftsWidget> {
  late OpenShiftsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenShiftsModel());

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
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Open Shifts',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                      lineHeight: 1.33,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.tune_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                wrapWithModel(
                                  model: _model.filterChipModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FilterChipWidget(
                                    label: 'All',
                                    selected: true,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filterChipModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FilterChipWidget(
                                    label: 'Days I\'m free',
                                    selected: true,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filterChipModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FilterChipWidget(
                                    label: 'My roles',
                                    selected: true,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filterChipModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FilterChipWidget(
                                    label: 'Morning',
                                    selected: true,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filterChipModel5,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FilterChipWidget(
                                    label: 'Evening',
                                    selected: true,
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 24.0)),
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
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.flash_on_rounded,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Urgent · Tonight',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.45,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              wrapWithModel(
                                model: _model.shiftCardModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ShiftCardWidget(
                                  date: 'Tuesday, Oct 22',
                                  role: 'Server',
                                  time: '5:00 PM - 10:00 PM',
                                  urgency: 'Tonight',
                                  urgent: true,
                                  initials: 'AR',
                                  poster: 'Alex Rivera',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Divider(
                                  height: 16.0,
                                  thickness: 1.0,
                                  indent: 0.0,
                                  endIndent: 0.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              Text(
                                'Available this week',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.45,
                                    ),
                              ),
                              wrapWithModel(
                                model: _model.shiftCardModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ShiftCardWidget(
                                  date: 'Friday, Oct 25',
                                  role: 'Bartender',
                                  time: '6:00 PM - 2:00 AM',
                                  urgency: 'Tonight',
                                  urgent: true,
                                  initials: 'PK',
                                  poster: 'Priya Kapoor',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.shiftCardModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ShiftCardWidget(
                                  date: 'Saturday, Oct 26',
                                  role: 'Server',
                                  time: '11:00 AM - 4:00 PM',
                                  urgency: 'Tonight',
                                  urgent: true,
                                  initials: 'LV',
                                  poster: 'Leo Vargas',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.shiftCardModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ShiftCardWidget(
                                  date: 'Saturday, Oct 26',
                                  role: 'Host',
                                  time: '5:00 PM - 11:00 PM',
                                  urgency: 'Tonight',
                                  urgent: true,
                                  initials: 'TJ',
                                  poster: 'Taylor Jones',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.shiftCardModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ShiftCardWidget(
                                  date: 'Sunday, Oct 27',
                                  role: 'Server',
                                  time: '4:00 PM - 10:00 PM',
                                  urgency: 'Tonight',
                                  urgent: true,
                                  initials: 'SM',
                                  poster: 'Sarah Miller',
                                ),
                              ),
                              Container(
                                height: 100.0,
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    activeTab: 'availability',
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
