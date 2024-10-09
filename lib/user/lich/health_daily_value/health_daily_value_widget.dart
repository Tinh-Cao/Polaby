import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/lich/input_health/input_health_widget.dart';
import '/user/nang_cap_tai_khoan/nang_cap_tai_khoan_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'health_daily_value_model.dart';
export 'health_daily_value_model.dart';

class HealthDailyValueWidget extends StatefulWidget {
  const HealthDailyValueWidget({
    super.key,
    this.healths,
    required this.date,
  });

  final List<dynamic>? healths;
  final DateTime? date;

  @override
  State<HealthDailyValueWidget> createState() => _HealthDailyValueWidgetState();
}

class _HealthDailyValueWidgetState extends State<HealthDailyValueWidget> {
  late HealthDailyValueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthDailyValueModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: InputHealthWidget(
                            date: widget.date,
                            isWeight: true,
                            value: double.tryParse(valueOrDefault<String>(
                              getJsonField(
                                functions
                                    .getItemsWithType(
                                        widget.healths?.toList(), 0)
                                    ?.first,
                                r'''$.value''',
                              )?.toString(),
                              '0',
                            )),
                            id: valueOrDefault<String>(
                              getJsonField(
                                functions
                                    .getItemsWithType(
                                        widget.healths?.toList(), 0)
                                    ?.first,
                                r'''$.id''',
                              )?.toString(),
                              '0',
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cân nặng',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            '${FFAppState().updateWeight == 0.0 ? valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 0)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              ) : FFAppState().updateWeight.toString()} kg',
                            '0 kg',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/chevrons-down-up.svg',
                            width: 14.0,
                            height: 14.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
              child: VerticalDivider(
                width: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().UserInfo.data.isSubscriptionActive == true) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            child: InputHealthWidget(
                              date: widget.date,
                              isSize: true,
                              value: double.tryParse(valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 2)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              )),
                              id: valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 2)
                                      ?.first,
                                  r'''$.id''',
                                )?.toString(),
                                '0',
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            child: const NangCapTaiKhoanWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vòng bụng',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            '${FFAppState().updateSize == 0.0 ? valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 2)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              ) : FFAppState().updateSize.toString()} cm',
                            '0 cm',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/chevrons-down-up.svg',
                            width: 14.0,
                            height: 14.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
              child: VerticalDivider(
                width: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().UserInfo.data.isSubscriptionActive == true) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            child: InputHealthWidget(
                              date: widget.date,
                              isBloodSys: true,
                              isBloodDia: true,
                              isSize: false,
                              bloodSys: double.tryParse(valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 3)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              )),
                              bloodDia: double.tryParse(valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 4)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              )),
                              id: valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 3)
                                      ?.first,
                                  r'''$.id''',
                                )?.toString(),
                                '0',
                              ),
                              id2: valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 4)
                                      ?.first,
                                  r'''$.id''',
                                )?.toString(),
                                '0',
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            child: const NangCapTaiKhoanWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Huyết áp',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            '${FFAppState().updateBloodSys == 0.0 ? valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 3)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              ) : FFAppState().updateBloodSys.toString()}/${FFAppState().updateBloodDia == 0.0 ? valueOrDefault<String>(
                                getJsonField(
                                  functions
                                      .getItemsWithType(
                                          widget.healths?.toList(), 4)
                                      ?.first,
                                  r'''$.value''',
                                )?.toString(),
                                '0',
                              ) : FFAppState().updateBloodDia.toString()}',
                            '0/0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/chevrons-down-up.svg',
                            width: 14.0,
                            height: 14.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ].divide(const SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
