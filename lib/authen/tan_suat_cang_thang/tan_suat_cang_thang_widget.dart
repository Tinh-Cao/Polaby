import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'tan_suat_cang_thang_model.dart';
export 'tan_suat_cang_thang_model.dart';

class TanSuatCangThangWidget extends StatefulWidget {
  const TanSuatCangThangWidget({
    super.key,
    this.lastName,
    this.firstName,
    this.diet,
    this.height,
    this.weight,
    this.dueDate,
    this.pregnantTime,
    this.pregnantWeek,
    this.activity,
    this.dateOfBirth,
  });

  final String? lastName;
  final String? firstName;
  final int? diet;
  final double? height;
  final double? weight;
  final String? dueDate;
  final String? pregnantTime;
  final String? pregnantWeek;
  final int? activity;
  final DateTime? dateOfBirth;

  @override
  State<TanSuatCangThangWidget> createState() => _TanSuatCangThangWidgetState();
}

class _TanSuatCangThangWidgetState extends State<TanSuatCangThangWidget> {
  late TanSuatCangThangModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TanSuatCangThangModel());

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: const Color(0x00FFFFFF),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'hoat_dong_the_chat',
                      queryParameters: {
                        'diet': serializeParam(
                          widget.diet,
                          ParamType.int,
                        ),
                        'lastName': serializeParam(
                          widget.lastName,
                          ParamType.String,
                        ),
                        'dateOfBirth': serializeParam(
                          widget.dateOfBirth,
                          ParamType.DateTime,
                        ),
                        'height': serializeParam(
                          widget.height,
                          ParamType.double,
                        ),
                        'weight': serializeParam(
                          widget.weight,
                          ParamType.double,
                        ),
                        'firstName': serializeParam(
                          widget.firstName,
                          ParamType.String,
                        ),
                        'dueDate': serializeParam(
                          widget.dueDate,
                          ParamType.String,
                        ),
                        'pregnantTime': serializeParam(
                          widget.pregnantTime,
                          ParamType.String,
                        ),
                        'pregnantWeek': serializeParam(
                          widget.pregnantWeek,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                ),
                actions: const [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Tần suất bạn cảm thấy căng thẳng như thế nào?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'buoc_cuoi_cung_ten_be',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'activity': serializeParam(
                              widget.activity,
                              ParamType.int,
                            ),
                            'stress': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'dueDate': serializeParam(
                              widget.dueDate,
                              ParamType.String,
                            ),
                            'pregnantTime': serializeParam(
                              widget.pregnantTime,
                              ParamType.String,
                            ),
                            'pregnantWeek': serializeParam(
                              widget.pregnantWeek,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Hiếm khi',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pink50,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'buoc_cuoi_cung_ten_be',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'activity': serializeParam(
                              widget.activity,
                              ParamType.int,
                            ),
                            'stress': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'dueDate': serializeParam(
                              widget.dueDate,
                              ParamType.String,
                            ),
                            'pregnantTime': serializeParam(
                              widget.pregnantTime,
                              ParamType.String,
                            ),
                            'pregnantWeek': serializeParam(
                              widget.pregnantWeek,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Vài tháng một lần',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pink50,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'buoc_cuoi_cung_ten_be',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'activity': serializeParam(
                              widget.activity,
                              ParamType.int,
                            ),
                            'stress': serializeParam(
                              1,
                              ParamType.int,
                            ),
                            'dueDate': serializeParam(
                              widget.dueDate,
                              ParamType.String,
                            ),
                            'pregnantTime': serializeParam(
                              widget.pregnantTime,
                              ParamType.String,
                            ),
                            'pregnantWeek': serializeParam(
                              widget.pregnantWeek,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Vài lần một tuần',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pink50,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'buoc_cuoi_cung_ten_be',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'activity': serializeParam(
                              widget.activity,
                              ParamType.int,
                            ),
                            'stress': serializeParam(
                              2,
                              ParamType.int,
                            ),
                            'dueDate': serializeParam(
                              widget.dueDate,
                              ParamType.String,
                            ),
                            'pregnantTime': serializeParam(
                              widget.pregnantTime,
                              ParamType.String,
                            ),
                            'pregnantWeek': serializeParam(
                              widget.pregnantWeek,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Gần như mỗi ngày',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pink50,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ].divide(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
