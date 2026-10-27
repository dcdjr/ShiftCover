import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audience_option_model.dart';
export 'audience_option_model.dart';

class AudienceOptionWidget extends StatefulWidget {
  const AudienceOptionWidget({
    super.key,
    this.icon,
    String? label,
    String? sub,
    bool? active,
  })  : this.label = label ?? 'Eligible Coworkers',
        this.sub = sub ?? 'Pings only free staff',
        this.active = active ?? true;

  final Widget? icon;
  final String label;
  final String sub;
  final bool active;

  @override
  State<AudienceOptionWidget> createState() => _AudienceOptionWidgetState();
}

class _AudienceOptionWidgetState extends State<AudienceOptionWidget> {
  late AudienceOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudienceOptionModel());

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
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          valueOrDefault<bool>(
            widget.active,
            true,
          )
              ? FlutterFlowTheme.of(context).primary10
              : FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).primary10,
        ),
        borderRadius: BorderRadius.circular(6.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: valueOrDefault<Color>(
            valueOrDefault<bool>(
              widget.active,
              true,
            )
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).alternate,
            FlutterFlowTheme.of(context).primary,
          ),
          width: valueOrDefault<double>(
            valueOrDefault<bool>(
              widget.active,
              true,
            )
                ? 1.0
                : 1.0,
            1.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget.active,
                      true,
                    )
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: BorderRadius.circular(9999.0),
                  shape: BoxShape.rectangle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: widget.icon!,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.label,
                        'Eligible Coworkers',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.sub,
                        'Pings only free staff',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.33,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
              if (valueOrDefault<bool>(
                widget.active,
                true,
              ))
                Container(
                  width: 24.0,
                  height: 24.0,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      if (valueOrDefault<bool>(
                        valueOrDefault<bool>(
                          widget.active,
                          true,
                        )
                            ? true
                            : false,
                        true,
                      ))
                        Icon(
                          Icons.check_circle_rounded,
                          color: valueOrDefault<Color>(
                            valueOrDefault<bool>(
                              widget.active,
                              true,
                            )
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          size: 24.0,
                        ),
                      if (valueOrDefault<bool>(
                        valueOrDefault<bool>(
                          widget.active,
                          true,
                        )
                            ? false
                            : true,
                        false,
                      ))
                        Icon(
                          Icons.radio_button_unchecked_rounded,
                          color: valueOrDefault<Color>(
                            valueOrDefault<bool>(
                              widget.active,
                              true,
                            )
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          size: 24.0,
                        ),
                    ],
                  ),
                ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}
