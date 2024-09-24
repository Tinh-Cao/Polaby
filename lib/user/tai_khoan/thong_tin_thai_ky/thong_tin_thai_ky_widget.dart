import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'thong_tin_thai_ky_model.dart';
export 'thong_tin_thai_ky_model.dart';

class ThongTinThaiKyWidget extends StatefulWidget {
  const ThongTinThaiKyWidget({
    super.key,
    String? txtEmail,
    String? txtUserName,
    String? txtYearOfBirth,
    String? txtHeight,
    String? txtWeight,
    String? txtPassword,
    String? txtBabyName,
    String? txtBabySex,
  })  : txtEmail = txtEmail ?? 'null',
        txtUserName = txtUserName ?? 'null',
        txtYearOfBirth = txtYearOfBirth ?? 'null',
        txtHeight = txtHeight ?? 'null',
        txtWeight = txtWeight ?? 'null',
        txtPassword = txtPassword ?? 'null',
        txtBabyName = txtBabyName ?? 'null',
        txtBabySex = txtBabySex ?? 'null';

  final String txtEmail;
  final String txtUserName;
  final String txtYearOfBirth;
  final String txtHeight;
  final String txtWeight;
  final String txtPassword;
  final String txtBabyName;
  final String txtBabySex;

  @override
  State<ThongTinThaiKyWidget> createState() => _ThongTinThaiKyWidgetState();
}

class _ThongTinThaiKyWidgetState extends State<ThongTinThaiKyWidget> {
  late ThongTinThaiKyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThongTinThaiKyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
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
                      frequencyOfStress:
                          FFAppState().UserInfo.data.frequencyOfStress,
                    );

                    context.pop();
                  },
                ),
                title: Text(
                  'Thông tin thai kỳ',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
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
                                'chinh_sua_thong_tin_thai_ky',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Tên bé',
                                    ParamType.String,
                                  ),
                                  'babyName': serializeParam(
                                    FFAppState().UserInfo.data.babyName,
                                    ParamType.String,
                                  ),
                                  'isName': serializeParam(
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
                                  'Tên em bé',
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
                                      FFAppState().UserInfo.data.babyName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFFC5C5C7),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFC5C5C7),
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
                                'chinh_sua_thong_tin_thai_ky',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Giới tính',
                                    ParamType.String,
                                  ),
                                  'sex': serializeParam(
                                    () {
                                      if (FFAppState().UserInfo.data.gender ==
                                          0) {
                                        return 'Không biết';
                                      } else if (FFAppState()
                                              .UserInfo
                                              .data
                                              .gender ==
                                          1) {
                                        return 'Trai';
                                      } else {
                                        return 'Gái';
                                      }
                                    }(),
                                    ParamType.String,
                                  ),
                                  'isGender': serializeParam(
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
                                  'Giới tính',
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
                                        () {
                                          if (FFAppState()
                                                  .UserInfo
                                                  .data
                                                  .babyGender ==
                                              0) {
                                            return 'Không biết';
                                          } else if (FFAppState()
                                                  .UserInfo
                                                  .data
                                                  .babyGender ==
                                              1) {
                                            return 'Trai';
                                          } else {
                                            return 'Gái';
                                          }
                                        }(),
                                        'null',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFFC5C5C7),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFC5C5C7),
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
                                'chinh_sua_thong_tin_thai_ky',
                                queryParameters: {
                                  'txtTitle': serializeParam(
                                    'Năm sinh',
                                    ParamType.String,
                                  ),
                                  'isYearOfBirth': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'yearOfBirth': serializeParam(
                                    valueOrDefault<String>(
                                      functions.changeFormatDatime(
                                          FFAppState().UserInfo.data.dueDate),
                                      '26',
                                    ),
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
                                            FFAppState().UserInfo.data.dueDate),
                                        '26',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFFC5C5C7),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFC5C5C7),
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
                          .around(const SizedBox(height: 8.0)),
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
                                'Tuổi thai',
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
                                      functions.calculatePregnantWeekV3(
                                          valueOrDefault<String>(
                                        FFAppState().UserInfo.data.dueDate,
                                        '26',
                                      )),
                                      '27',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFFC5C5C7),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const Opacity(
                                    opacity: 0.0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFC5C5C7),
                                      size: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ngày dự sinh',
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
                                          FFAppState().UserInfo.data.dueDate),
                                      '26',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFFC5C5C7),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const Opacity(
                                    opacity: 0.0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFC5C5C7),
                                      size: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tính toán tự động',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 8.0))
                          .around(const SizedBox(height: 8.0)),
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
