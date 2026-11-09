import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_indicator_model.dart';
export 'step_indicator_model.dart';

class StepIndicatorWidget extends StatefulWidget {
  const StepIndicatorWidget({
    super.key,
    bool? completed,
    String? label,
    String? time,
    bool? isLast,
    bool? active,
  })  : this.completed = completed ?? true,
        this.label = label ?? 'Posted',
        this.time = time ?? '9:15 AM',
        this.isLast = isLast ?? false,
        this.active = active ?? true;

  final bool completed;
  final String label;
  final String time;
  final bool isLast;
  final bool active;

  @override
  State<StepIndicatorWidget> createState() => _StepIndicatorWidgetState();
}

class _StepIndicatorWidgetState extends State<StepIndicatorWidget> {
  late StepIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  () {
                    if (valueOrDefault<bool>(
                      widget.completed,
                      true,
                    )) {
                      return FlutterFlowTheme.of(context).success;
                    } else if (valueOrDefault<bool>(
                      widget.active,
                      true,
                    )) {
                      return FlutterFlowTheme.of(context).primaryBackground;
                    } else {
                      return FlutterFlowTheme.of(context).secondaryBackground;
                    }
                  }(),
                  FlutterFlowTheme.of(context).success,
                ),
                borderRadius: BorderRadius.circular(9999.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: valueOrDefault<Color>(
                    () {
                      if (valueOrDefault<bool>(
                        widget.completed,
                        true,
                      )) {
                        return FlutterFlowTheme.of(context).success;
                      } else if (valueOrDefault<bool>(
                        widget.active,
                        true,
                      )) {
                        return FlutterFlowTheme.of(context).primary;
                      } else {
                        return FlutterFlowTheme.of(context).alternate;
                      }
                    }(),
                    FlutterFlowTheme.of(context).success,
                  ),
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Visibility(
                visible: valueOrDefault<bool>(
                  widget.completed,
                  true,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: FlutterFlowTheme.of(context).onSuccess,
                  size: 12.0,
                ),
              ),
            ),
            if (valueOrDefault<bool>(
              valueOrDefault<bool>(
                widget.isLast,
                false,
              )
                  ? false
                  : true,
              true,
            ))
              Expanded(
                flex: 1,
                child: Container(
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.completed,
                        true,
                      )
                          ? FlutterFlowTheme.of(context).success
                          : FlutterFlowTheme.of(context).alternate,
                      FlutterFlowTheme.of(context).success,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.label,
                  'Posted',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        valueOrDefault<bool>(
                          widget.active,
                          true,
                        )
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.45,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.time,
                  '9:15 AM',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).accent3,
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.45,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ],
    );
  }
}
