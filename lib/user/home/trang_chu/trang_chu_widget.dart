import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/suc_khoe/card_item/card_item_widget.dart';
import '/suc_khoe/health_size/health_size_widget.dart';
import '/suc_khoe/health_size_empty/health_size_empty_widget.dart';
import '/suc_khoe/health_weight/health_weight_widget.dart';
import '/suc_khoe/health_weight_empty/health_weight_empty_widget.dart';
import '/user/lich/hang_ngay/hang_ngay_widget.dart';
import '/user/nang_cap_tai_khoan/nang_cap_tai_khoan_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'trang_chu_model.dart';
export 'trang_chu_model.dart';

class TrangChuWidget extends StatefulWidget {
  const TrangChuWidget({
    super.key,
    String? txtWieght,
    this.newValue,
  }) : txtWieght = txtWieght ?? 'null';

  final String txtWieght;
  final dynamic newValue;

  @override
  State<TrangChuWidget> createState() => _TrangChuWidgetState();
}

class _TrangChuWidgetState extends State<TrangChuWidget> {
  late TrangChuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrangChuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getUserInfo = await PolabyGroup.apiV1AccountsidGETCall.call(
        id: currentUserUid,
      );

      if ((_model.getUserInfo?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            FFAppState().UserInfo = UserInfoStruct.maybeFromMap(
                (_model.getUserInfo?.jsonBody ?? ''))!;
            FFAppState().update(() {});
          }),
          Future(() async {
            if (UserInfoStruct.maybeFromMap(
                        (_model.getUserInfo?.jsonBody ?? ''))
                    ?.data
                    .role !=
                'Expert') {
              await Future.wait([
                Future(() async {
                  _model.healthWeight =
                      await PolabyGroup.apiV1HealthsGETCall.call(
                    order: 'date',
                    date: '0001-01-01',
                    userId: currentUserUid,
                    orderByDescending: false,
                    filterWeight: true,
                    filterHeight: false,
                    filterSize: false,
                    filterBloodPressureSys: false,
                    filterBloodPressureDia: false,
                    filterHeartbeat: false,
                    filterContractility: false,
                    pageIndex: 1,
                    pageSize: 30,
                    isDeleted: false,
                  );

                  FFAppState().healthWeight1 = PolabyGroup.apiV1HealthsGETCall
                      .healths(
                        (_model.healthWeight?.jsonBody ?? ''),
                      )!
                      .toList()
                      .cast<dynamic>();
                  FFAppState().update(() {});
                }),
                Future(() async {
                  _model.healthSize =
                      await PolabyGroup.apiV1HealthsGETCall.call(
                    order: 'date',
                    date: '0001-01-01',
                    userId: currentUserUid,
                    orderByDescending: false,
                    filterWeight: false,
                    filterHeight: false,
                    filterSize: true,
                    filterBloodPressureSys: false,
                    filterBloodPressureDia: false,
                    filterHeartbeat: false,
                    filterContractility: false,
                    pageIndex: 1,
                    pageSize: 30,
                    isDeleted: false,
                  );

                  FFAppState().healthSize = PolabyGroup.apiV1HealthsGETCall
                      .healths(
                        (_model.healthSize?.jsonBody ?? ''),
                      )!
                      .toList()
                      .cast<dynamic>();
                  FFAppState().update(() {});
                }),
              ]);
            }
          }),
          Future(() async {
            _model.checkUserExist = await queryUsersRecordOnce(
              queryBuilder: (usersRecord) => usersRecord.where(
                'userId',
                isEqualTo: currentUserUid,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if (!(_model.checkUserExist?.reference != null)) {
              var usersRecordReference = UsersRecord.collection.doc();
              await usersRecordReference.set(createUsersRecordData(
                firstName: FFAppState().UserInfo.data.firstName,
                lastName: FFAppState().UserInfo.data.lastName,
                userId: FFAppState().UserInfo.data.id,
                role: FFAppState().UserInfo.data.role,
                createDate: FFAppState().UserInfo.data.creationDate,
              ));
              _model.userDocument = UsersRecord.getDocumentFromData(
                  createUsersRecordData(
                    firstName: FFAppState().UserInfo.data.firstName,
                    lastName: FFAppState().UserInfo.data.lastName,
                    userId: FFAppState().UserInfo.data.id,
                    role: FFAppState().UserInfo.data.role,
                    createDate: FFAppState().UserInfo.data.creationDate,
                  ),
                  usersRecordReference);
            }
          }),
        ]);
      }
    });

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tuần thai hiện tại',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ngày sinh dự kiến:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.changeFormatDatime(
                                                FFAppState()
                                                    .UserInfo
                                                    .data
                                                    .dueDate),
                                            '26',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ],
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 24.0,
                                  borderWidth: 1.0,
                                  buttonSize: 48.0,
                                  fillColor: FlutterFlowTheme.of(context).info,
                                  icon: Icon(
                                    Icons.notifications_none_rounded,
                                    color: FlutterFlowTheme.of(context).accent4,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().weekPost = ((String var1) {
                                  return int.tryParse(var1.split(' ')[0]);
                                }(valueOrDefault<String>(
                                  functions.calculatePregnantWeekV3(
                                      FFAppState().UserInfo.data.dueDate),
                                  '20',
                                )))!;
                                FFAppState().update(() {});

                                context.pushNamed(
                                  'bai_viet_tuan',
                                  queryParameters: {
                                    'week': serializeParam(
                                      (String var1) {
                                        return int.tryParse(var1.split(' ')[0]);
                                      }(valueOrDefault<String>(
                                        functions.calculatePregnantWeekV3(
                                            FFAppState().UserInfo.data.dueDate),
                                        '20',
                                      )),
                                      ParamType.int,
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
                              child: wrapWithModel(
                                model: _model.cardItemModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CardItemWidget(
                                  txtTitle: 'Sự phát triển của thai nhi',
                                  txtSubTitle: 'Thai kỳ',
                                  txtMainTitle: valueOrDefault<String>(
                                    functions.calculatePregnantWeekV3(
                                        FFAppState().UserInfo.data.dueDate),
                                    '20',
                                  ),
                                  txtSubtitleV1: 'Xem thêm',
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: SafeArea(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFCE4EC),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.daily =
                                            await queryDailyRecordOnce(
                                          queryBuilder: (dailyRecord) =>
                                              dailyRecord
                                                  .where(
                                                    'userId',
                                                    isEqualTo: currentUserUid,
                                                  )
                                                  .where(
                                                    'date',
                                                    isEqualTo: functions
                                                        .convertToApiDateFormatDate(
                                                            functions.dateTimeParse(
                                                                functions
                                                                    .convertToApiDateFormatDate(
                                                                        getCurrentTimestamp))!),
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.daily?.reference == null) {
                                          var dailyRecordReference =
                                              DailyRecord.collection.doc();
                                          await dailyRecordReference
                                              .set(createDailyRecordData(
                                            date: functions
                                                .convertToApiDateFormatDate(
                                                    getCurrentTimestamp),
                                            userId: currentUserUid,
                                          ));
                                          _model.dailyCollection =
                                              DailyRecord.getDocumentFromData(
                                                  createDailyRecordData(
                                                    date: functions
                                                        .convertToApiDateFormatDate(
                                                            getCurrentTimestamp),
                                                    userId: currentUserUid,
                                                  ),
                                                  dailyRecordReference);
                                        }
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.95,
                                                  child: HangNgayWidget(
                                                    datePicked: functions
                                                        .dateTimeParse(functions
                                                            .convertToApiDateFormatDate(
                                                                getCurrentTimestamp))!,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        safeSetState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor: const Color(0xFFFDEBF1),
                                                  icon: Icon(
                                                    Icons.add_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: 202.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Hôm nay bạn cảm thấy thế nào?',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Ghi lại hành trình của bản thân',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: const Color(
                                                                0xFFF48FB1),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                          Flexible(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Frame_11.svg',
                                                height: 112.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (FFAppState().healthWeight1.isNotEmpty) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'can_nang_hang_ngay',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 200),
                                              ),
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.healthWeightModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: HealthWeightWidget(
                                            newValue: getJsonField(
                                              FFAppState().healthWeight1.last,
                                              r'''$.value''',
                                            ),
                                            oldValue: FFAppState()
                                                .UserInfo
                                                .data
                                                .initialWeight,
                                            creationDate: getJsonField(
                                              FFAppState().healthWeight1.last,
                                              r'''$.creationDate''',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  );
                                } else {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'can_nang_hang_ngay',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.healthWeightEmptyModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const HealthWeightEmptyWidget(),
                                    ),
                                  );
                                }
                              },
                            ),
                            Builder(
                              builder: (context) {
                                if (FFAppState().healthSize.isNotEmpty) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState()
                                                  .UserInfo
                                                  .data
                                                  .isSubscriptionActive ==
                                              true) {
                                            context.pushNamed(
                                              'vong_bung_hang_ngay',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                ),
                                              },
                                            );
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.9,
                                                      child:
                                                          const NangCapTaiKhoanWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        },
                                        child: wrapWithModel(
                                          model: _model.healthSizeModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: HealthSizeWidget(
                                            value: getJsonField(
                                              FFAppState().healthSize.first,
                                              r'''$.value''',
                                            ),
                                            oldValue: getJsonField(
                                              FFAppState().healthSize[
                                                  FFAppState()
                                                              .healthSize
                                                              .length <=
                                                          1
                                                      ? 0
                                                      : 1],
                                              r'''$.value''',
                                            ),
                                            newValue: getJsonField(
                                              FFAppState().healthSize.last,
                                              r'''$.value''',
                                            ),
                                            creationDate: getJsonField(
                                              FFAppState().healthSize.last,
                                              r'''$.creationDate''',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  );
                                } else {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState()
                                              .UserInfo
                                              .data
                                              .isSubscriptionActive ==
                                          true) {
                                        context.pushNamed(
                                          'vong_bung_hang_ngay',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 200),
                                            ),
                                          },
                                        );
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child:
                                                      const NangCapTaiKhoanWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    child: wrapWithModel(
                                      model: _model.healthSizeEmptyModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const HealthSizeEmptyWidget(),
                                    ),
                                  );
                                }
                              },
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'cong_dong',
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
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).success,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xFF5CBCB3),
                                                icon: Icon(
                                                  Icons.people_alt_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 170.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Cộng đồng',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Cùng xem các bà mẹ khác đang nghĩ gì',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Motherhood-rafiki_1.svg',
                                              height: 112.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'tham_khao_thuc_don',
                                  queryParameters: {
                                    'weight': serializeParam(
                                      FFAppState().healthWeight1.isNotEmpty
                                          ? getJsonField(
                                              FFAppState().healthWeight1.first,
                                              r'''$.value''',
                                            )
                                          : FFAppState()
                                              .UserInfo
                                              .data
                                              .initialWeight,
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
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xFF71BCF8),
                                                icon: Icon(
                                                  Icons.lightbulb_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 170.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tham khảo thực đơn',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Dựa trên chỉ số BMI của bạn',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Eating_healthy_food-amico_1.svg',
                                              height: 112.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'tra_cuu_dinh_duong',
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
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xFF9E81D1),
                                                icon: Icon(
                                                  Icons.blender,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 170.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tra cứu dinh dưỡng',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Cùng xem các bà mẹ khác đang nghĩ gì',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Choice-pana_1.svg',
                                              height: 112.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState()
                                        .UserInfo
                                        .data
                                        .isSubscriptionActive ==
                                    true) {
                                  context.pushNamed(
                                    'an_toan_thuc_pham',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    },
                                  );
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () =>
                                            FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.9,
                                            child: const NangCapTaiKhoanWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).warning,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xFFFFD75E),
                                                icon: Icon(
                                                  Icons.fastfood_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 170.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'An toàn thực phẩm',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Tra cứu độ an toàn của thực phẩm',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Eating_healthy_food-rafiki_1.svg',
                                              height: 112.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .addToEnd(const SizedBox(height: 64.0)),
                  ),
                ),
                Container(
                  height: 48.0,
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavbarWidget(
                      page: 'home',
                      role: valueOrDefault<String>(
                        FFAppState().UserInfo.data.role,
                        'User',
                      ),
                      currentPage: valueOrDefault<String>(
                        _model.currentPage,
                        '1',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
