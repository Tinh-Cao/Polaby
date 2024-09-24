import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'hoat_dong_the_chat_model.dart';
export 'hoat_dong_the_chat_model.dart';

class HoatDongTheChatWidget extends StatefulWidget {
  const HoatDongTheChatWidget({
    super.key,
    this.diet,
    this.lastName,
    this.dateOfBirth,
    this.height,
    required this.weight,
    this.firstName,
    this.dueDate,
    this.pregnantTime,
    this.pregnantWeek,
  });

  final int? diet;
  final String? lastName;
  final DateTime? dateOfBirth;
  final double? height;
  final double? weight;
  final String? firstName;
  final String? dueDate;
  final String? pregnantTime;
  final String? pregnantWeek;

  @override
  State<HoatDongTheChatWidget> createState() => _HoatDongTheChatWidgetState();
}

class _HoatDongTheChatWidgetState extends State<HoatDongTheChatWidget> {
  late HoatDongTheChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoatDongTheChatModel());

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
                      'tuan_thu_che_do_an_nao',
                      queryParameters: {
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
                        'lastName': serializeParam(
                          widget.lastName,
                          ParamType.String,
                        ),
                        'dueDate': serializeParam(
                          widget.dueDate,
                          ParamType.String,
                        ),
                        'pregnantWeek': serializeParam(
                          widget.pregnantWeek,
                          ParamType.String,
                        ),
                        'pregnantTime': serializeParam(
                          widget.pregnantTime,
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
                    'Bạn có thường hoạt động thể chất không?',
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
                          'tan_suat_cang_thang',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
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
                            'activity': serializeParam(
                              2,
                              ParamType.int,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
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

                        FFAppState().updateUserInfoUpdateStruct(
                          (e) => e,
                        );
                        safeSetState(() {});

                        context.pushNamed('tan_suat_cang_thang');
                      },
                      text: 'Thường xuyên',
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
                          'tan_suat_cang_thang',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
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
                            'activity': serializeParam(
                              1,
                              ParamType.int,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
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
                      text: 'Đôi khi',
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
                          'tan_suat_cang_thang',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
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
                            'activity': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
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
                          'tan_suat_cang_thang',
                          queryParameters: {
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'diet': serializeParam(
                              widget.diet,
                              ParamType.int,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
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
                            'activity': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'dateOfBirth': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
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
                      text: 'Không bao giờ',
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
