import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'tao_bai_post_model.dart';
export 'tao_bai_post_model.dart';

class TaoBaiPostWidget extends StatefulWidget {
  const TaoBaiPostWidget({super.key});

  @override
  State<TaoBaiPostWidget> createState() => _TaoBaiPostWidgetState();
}

class _TaoBaiPostWidgetState extends State<TaoBaiPostWidget> {
  late TaoBaiPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaoBaiPostModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isOpen = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 36.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent4,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Thêm chia sẻ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.userID = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'userId',
                              isEqualTo: currentUserUid,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.userID?.role == 'Expert') {
                            await PostsRecord.collection
                                .doc()
                                .set(createPostsRecordData(
                                  content: _model.textController.text,
                                  createDate: functions.getDateNow(),
                                  isProfessional: true,
                                  tilte: '',
                                  postUser: _model.userID?.reference,
                                ));
                          } else {
                            await PostsRecord.collection
                                .doc()
                                .set(createPostsRecordData(
                                  content: _model.textController.text,
                                  createDate: functions.getDateNow(),
                                  isProfessional: false,
                                  tilte: '',
                                  postUser: _model.userID?.reference,
                                ));
                          }

                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        child: Text(
                          'Đăng',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(width: 8.0))
                    .addToEnd(const SizedBox(width: 8.0)),
              ),
            ].divide(const SizedBox(height: 8.0)).addToStart(const SizedBox(height: 4.0)),
          ),
          Container(
            height: 273.0,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if (_model.isOpen == true)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://picsum.photos/seed/776/600',
                            height: 175.0,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.svg',
                              height: 175.0,
                              fit: BoxFit.fill,
                            ),
                            cacheWidth: 300,
                            cacheHeight: 175,
                          ),
                        ),
                      if (_model.isOpen == false)
                        Align(
                          alignment: const AlignmentDirectional(0.2, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/563d0201e4359c2e890569e254ea14790eb370b71d08b6de5052511cc0352313.jpg',
                              width: 154.0,
                              height: 163.0,
                              fit: BoxFit.cover,
                              alignment: const Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Bạn muốn chia sẻ điều gì?',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
