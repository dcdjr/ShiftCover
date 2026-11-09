import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'top_bar_model.dart';
export 'top_bar_model.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({
    super.key,
    this.leadingIcon,
    bool? leadingIconPresent,
    this.trailingIcon,
    bool? trailingIconPresent,
    String? subtitle,
    bool? subtitlePresent,
    String? title,
  })  : this.leadingIconPresent = leadingIconPresent ?? true,
        this.trailingIconPresent = trailingIconPresent ?? false,
        this.subtitle = subtitle ?? '',
        this.subtitlePresent = subtitlePresent ?? false,
        this.title = title ?? 'Profile Setup';

  final Widget? leadingIcon;
  final bool leadingIconPresent;
  final Widget? trailingIcon;
  final bool trailingIconPresent;
  final String subtitle;
  final bool subtitlePresent;
  final String title;

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  late TopBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopBarModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Container(
          child: Container(
            height: 56.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (valueOrDefault<bool>(
                  widget.leadingIconPresent,
                  true,
                ))
                  widget.leadingIcon!,
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.title,
                          'Profile Setup',
                        ),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                      if (valueOrDefault<bool>(
                        widget.subtitlePresent,
                        false,
                      ))
                        Text(
                          widget.subtitle,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                                lineHeight: 1.33,
                              ),
                        ),
                    ].divide(SizedBox(height: 2.0)),
                  ),
                ),
                if (valueOrDefault<bool>(
                  widget.trailingIconPresent,
                  false,
                ))
                  widget.trailingIcon!,
              ].divide(SizedBox(width: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
