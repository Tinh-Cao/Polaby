import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'tuan_thu_che_do_an_nao_model.dart';
export 'tuan_thu_che_do_an_nao_model.dart';

class TuanThuCheDoAnNaoWidget extends StatefulWidget {
  const TuanThuCheDoAnNaoWidget({
    super.key,
    required this.firstName,
    this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.lastName,
    required this.dueDate,
    required this.pregnantWeek,
    required this.pregnantTime,
  });

  final String? firstName;
  final DateTime? dateOfBirth;
  final double? height;
  final double? weight;
  final String? lastName;
  final String? dueDate;
  final String? pregnantWeek;
  final String? pregnantTime;

  @override
  State<TuanThuCheDoAnNaoWidget> createState() =>
      _TuanThuCheDoAnNaoWidgetState();
}

class _TuanThuCheDoAnNaoWidgetState extends State<TuanThuCheDoAnNaoWidget> {
  late TuanThuCheDoAnNaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TuanThuCheDoAnNaoModel());

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
                      'chuc_mung',
                      queryParameters: {
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
                        'firstName': serializeParam(
                          widget.firstName,
                          ParamType.String,
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
                    'Bạn tuân thủ chế độ ăn nào?',
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
                          'hoat_dong_the_chat',
                          queryParameters: {
                            'diet': serializeParam(
                              2,
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
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Ăn nhiều thịt và thực phẩm động vật',
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
                          'hoat_dong_the_chat',
                          queryParameters: {
                            'diet': serializeParam(
                              1,
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
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Ăn vừa phải thực phẩm động vật',
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
                          'hoat_dong_the_chat',
                          queryParameters: {
                            'diet': serializeParam(
                              1,
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
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Ăn bình thường',
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
                          'hoat_dong_the_chat',
                          queryParameters: {
                            'diet': serializeParam(
                              0,
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
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      text: 'Ăn chay',
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
