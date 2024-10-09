import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'buoc_cuoi_cung_ten_be_model.dart';
export 'buoc_cuoi_cung_ten_be_model.dart';

class BuocCuoiCungTenBeWidget extends StatefulWidget {
  const BuocCuoiCungTenBeWidget({
    super.key,
    this.lastName,
    this.firstName,
    this.dateOfBirth,
    this.height,
    this.weight,
    this.diet,
    this.activity,
    this.stress,
    this.dueDate,
    this.pregnantTime,
    this.pregnantWeek,
  });

  final String? lastName;
  final String? firstName;
  final DateTime? dateOfBirth;
  final double? height;
  final double? weight;
  final int? diet;
  final int? activity;
  final int? stress;
  final String? dueDate;
  final String? pregnantTime;
  final String? pregnantWeek;

  @override
  State<BuocCuoiCungTenBeWidget> createState() =>
      _BuocCuoiCungTenBeWidgetState();
}

class _BuocCuoiCungTenBeWidgetState extends State<BuocCuoiCungTenBeWidget> {
  late BuocCuoiCungTenBeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuocCuoiCungTenBeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
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
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/happy-earth.svg',
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Bước cuối cùng',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          'Chọn một cái tên thật đẹp cho thiên thần bé nhỏ',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Tên của bé',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            'Để trống nếu bạn chưa đặt tên cho con',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFFBDBDBD),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().selectedIndex == 1) {
                          return FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectedIndex = 1;
                            },
                            text: 'Bé trai',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).blue400,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
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
                            showLoadingIndicator: false,
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectedIndex = 1;
                              safeSetState(() {});
                            },
                            text: 'Bé trai',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).blue50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).blue400,
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
                            showLoadingIndicator: false,
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().selectedIndex == 2) {
                          return FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectedIndex = 2;
                            },
                            text: 'Bé gái',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
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
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectedIndex = 2;
                              safeSetState(() {});
                            },
                            text: 'Bé gái',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).pink50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().selectedIndex == 0) {
                          return FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectedIndex = 0;
                            },
                            text: 'Tôi chưa biết',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).deepPurple400,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
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
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectedIndex = 0;
                              safeSetState(() {});
                            },
                            text: 'Tôi chưa biết',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).deepPurple50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                          );
                        }
                      },
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Future.wait([
                                  Future(() async {
                                    _model.loginResult = await PolabyGroup
                                        .apiV1AuthenticationLoginPOSTCall
                                        .call(
                                      httpOnly: true,
                                      email: FFAppState().loginInfo.username,
                                      password: FFAppState().loginInfo.password,
                                    );

                                    if ((_model.loginResult?.succeeded ??
                                        true)) {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signIn(
                                        authenticationToken: PolabyGroup
                                            .apiV1AuthenticationLoginPOSTCall
                                            .accessToken(
                                          (_model.loginResult?.jsonBody ?? ''),
                                        ),
                                        refreshToken: PolabyGroup
                                            .apiV1AuthenticationLoginPOSTCall
                                            .refreshToken(
                                          (_model.loginResult?.jsonBody ?? ''),
                                        ),
                                        authUid: PolabyGroup
                                            .apiV1AuthenticationLoginPOSTCall
                                            .userId(
                                          (_model.loginResult?.jsonBody ?? ''),
                                        ),
                                      );
                                      _model.updateUserResponse =
                                          await PolabyGroup
                                              .apiV1AccountsidUserPUTCall
                                              .call(
                                        id: currentUserUid,
                                        firstName: widget.firstName,
                                        lastName: widget.lastName,
                                        dateOfBirth: functions
                                            .convertToApiDateFormatDate(
                                                widget.dateOfBirth!),
                                        height: widget.height,
                                        initialWeight: widget.weight,
                                        diet: widget.diet,
                                        frequencyOfActivity: widget.activity,
                                        frequencyOfStress: widget.stress,
                                        dueDate: functions
                                            .convertToApiDateFormatString(
                                                widget.dueDate!),
                                        babyName: _model.textController.text,
                                        babyGender: FFAppState().selectedIndex,
                                        image: 'hai',
                                      );

                                      if ((_model
                                              .updateUserResponse?.succeeded ??
                                          true)) {
                                        await Future.wait([
                                          Future(() async {
                                            FFAppState().pregnantWeek =
                                                widget.pregnantWeek!;
                                            FFAppState().pregnantTime =
                                                widget.pregnantTime!;
                                            safeSetState(() {});
                                          }),
                                          Future(() async {
                                            var noteRecordReference =
                                                NoteRecord.collection.doc();
                                            await noteRecordReference
                                                .set(createNoteRecordData(
                                              userId: currentUserUid,
                                            ));
                                            _model.noteDocument =
                                                NoteRecord.getDocumentFromData(
                                                    createNoteRecordData(
                                                      userId: currentUserUid,
                                                    ),
                                                    noteRecordReference);
                                            await actions
                                                .createNoteDetailsForUser(
                                              currentUserUid,
                                            );
                                          }),
                                        ]);

                                        context.goNamedAuth(
                                            'Intermediate', context.mounted);
                                      }
                                    }
                                  }),
                                ]);

                                safeSetState(() {});
                              },
                              text: 'Hoàn thành',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                          ),
                        ].addToStart(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
