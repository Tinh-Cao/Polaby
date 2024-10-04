import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'thong_tin_ca_nhan_model.dart';
export 'thong_tin_ca_nhan_model.dart';

class ThongTinCaNhanWidget extends StatefulWidget {
  const ThongTinCaNhanWidget({super.key});

  @override
  State<ThongTinCaNhanWidget> createState() => _ThongTinCaNhanWidgetState();
}

class _ThongTinCaNhanWidgetState extends State<ThongTinCaNhanWidget> {
  late ThongTinCaNhanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThongTinCaNhanModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController?.text = '***********';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              await PolabyGroup.apiV1AccountsidUserPUTCall.call(
                id: currentUserUid,
                firstName: FFAppState().UserInfo.data.firstName,
                lastName: FFAppState().UserInfo.data.lastName,
                dateOfBirth: FFAppState().UserInfo.data.dateOfBirth,
                height: FFAppState().UserInfo.data.height,
                initialWeight: FFAppState().UserInfo.data.initialWeight,
                diet: FFAppState().UserInfo.data.diet,
                frequencyOfActivity:
                    FFAppState().UserInfo.data.frequencyOfActivity,
                image: FFAppState().UserInfo.data.image,
                babyName: FFAppState().UserInfo.data.babyName,
                dueDate: FFAppState().UserInfo.data.dueDate,
                babyGender: FFAppState().UserInfo.data.babyGender,
                frequencyOfStress: FFAppState().UserInfo.data.frequencyOfStress,
              );

              context.pop();
            },
          ),
          title: Text(
            'Thông tin cá nhân',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Họ và tên',
                                    ParamType.String,
                                  ),
                                  'value': serializeParam(
                                    '${FFAppState().UserInfo.data.lastName} ${FFAppState().UserInfo.data.firstName}',
                                    ParamType.String,
                                  ),
                                  'lastName': serializeParam(
                                    FFAppState().UserInfo.data.lastName,
                                    ParamType.String,
                                  ),
                                  'isFirstName': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'isLastName': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'firstName': serializeParam(
                                    FFAppState().UserInfo.data.firstName,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Họ và tên',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '${FFAppState().UserInfo.data.lastName} ${FFAppState().UserInfo.data.firstName}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Email',
                                    ParamType.String,
                                  ),
                                  'value': serializeParam(
                                    FFAppState().UserInfo.data.email,
                                    ParamType.String,
                                  ),
                                  'isMail': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Email',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFAppState().UserInfo.data.email,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Năm sinh',
                                    ParamType.String,
                                  ),
                                  'value': serializeParam(
                                    valueOrDefault<String>(
                                      functions.changeFormatDatime(FFAppState()
                                          .UserInfo
                                          .data
                                          .dateOfBirth),
                                      '26',
                                    ),
                                    ParamType.String,
                                  ),
                                  'isDate': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );

                              FFAppState().day = functions.getDay(
                                  FFAppState().UserInfo.data.dateOfBirth);
                              FFAppState().month = functions.getMonth(
                                  FFAppState().UserInfo.data.dateOfBirth);
                              FFAppState().year = functions.getYear(
                                  FFAppState().UserInfo.data.dateOfBirth);
                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Năm sinh',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        functions.changeFormatDatime(
                                            FFAppState()
                                                .UserInfo
                                                .data
                                                .dateOfBirth),
                                        '26',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 8.0))
                          .addToStart(const SizedBox(height: 8.0))
                          .addToEnd(const SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Chiều cao',
                                    ParamType.String,
                                  ),
                                  'height': serializeParam(
                                    FFAppState().UserInfo.data.height,
                                    ParamType.double,
                                  ),
                                  'isHeight': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chiều cao',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        FFAppState()
                                            .UserInfo
                                            .data
                                            .height
                                            .toString(),
                                        '160',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Cân nặng trước sinh',
                                    ParamType.String,
                                  ),
                                  'isWeight': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'weight': serializeParam(
                                    FFAppState().UserInfo.data.initialWeight,
                                    ParamType.double,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cân nặng trước sinh',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        FFAppState()
                                            .UserInfo
                                            .data
                                            .initialWeight
                                            .toString(),
                                        '60',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Chế độ vận động',
                                    ParamType.String,
                                  ),
                                  'value': serializeParam(
                                    () {
                                      if (FFAppState()
                                              .UserInfo
                                              .data
                                              .frequencyOfActivity ==
                                          0) {
                                        return 'Nhẹ nhàng';
                                      } else if (FFAppState()
                                              .UserInfo
                                              .data
                                              .frequencyOfActivity ==
                                          1) {
                                        return 'Trung bình';
                                      } else {
                                        return 'Nặng';
                                      }
                                    }(),
                                    ParamType.String,
                                  ),
                                  'isActivity': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chế độ vận động thể chất',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      () {
                                        if (FFAppState()
                                                .UserInfo
                                                .data
                                                .frequencyOfActivity ==
                                            0) {
                                          return 'Nhẹ nhàng';
                                        } else if (FFAppState()
                                                .UserInfo
                                                .data
                                                .frequencyOfActivity ==
                                            1) {
                                          return 'Trung bình';
                                        } else {
                                          return 'Nặng';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'chinh_sua_thong_tin_tai_khoan',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Chế độ ăn',
                                    ParamType.String,
                                  ),
                                  'value': serializeParam(
                                    () {
                                      if (FFAppState().UserInfo.data.diet ==
                                          0) {
                                        return 'Ăn chay';
                                      } else if (FFAppState()
                                              .UserInfo
                                              .data
                                              .diet ==
                                          1) {
                                        return 'Ăn 30-90g thịt,../ngày';
                                      } else {
                                        return 'Ăn > 90g thịt,../ngày';
                                      }
                                    }(),
                                    ParamType.String,
                                  ),
                                  'isDiet': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chế độ ăn',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      () {
                                        if (FFAppState().UserInfo.data.diet ==
                                            0) {
                                          return 'Ăn chay';
                                        } else if (FFAppState()
                                                .UserInfo
                                                .data
                                                .diet ==
                                            1) {
                                          return 'Ăn 30-90g thịt,../ngày';
                                        } else {
                                          return 'Ăn > 90g thịt,../ngày';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 8.0))
                          .addToStart(const SizedBox(height: 8.0))
                          .addToEnd(const SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mật khẩu',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: true,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            letterSpacing: 0.0,
                                          ),
                                      textAlign: TextAlign.end,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context).accent4,
                                    size: 14.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                          .addToStart(const SizedBox(height: 8.0))
                          .addToEnd(const SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 16.0))
                  .addToStart(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
