import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import '/user/cong_dong/binh_luan/binh_luan_widget.dart';
import '/user/cong_dong/tao_bai_post/tao_bai_post_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'cong_dong_chuyen_gia_model.dart';
export 'cong_dong_chuyen_gia_model.dart';

class CongDongChuyenGiaWidget extends StatefulWidget {
  const CongDongChuyenGiaWidget({
    super.key,
    String? txtUserName,
    String? txtCreationDate,
    String? txtContent,
    String? txtLikeCount,
    String? txtCommentCount,
  })  : txtUserName = txtUserName ?? 'null',
        txtCreationDate = txtCreationDate ?? 'null',
        txtContent = txtContent ?? 'null',
        txtLikeCount = txtLikeCount ?? 'null',
        txtCommentCount = txtCommentCount ?? 'null';

  final String txtUserName;
  final String txtCreationDate;
  final String txtContent;
  final String txtLikeCount;
  final String txtCommentCount;

  @override
  State<CongDongChuyenGiaWidget> createState() =>
      _CongDongChuyenGiaWidgetState();
}

class _CongDongChuyenGiaWidgetState extends State<CongDongChuyenGiaWidget> {
  late CongDongChuyenGiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CongDongChuyenGiaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getUserInfo = await PolabyGroup.apiV1AccountsidGETCall.call(
        id: currentUserUid,
      );

      if ((_model.getUserInfo?.succeeded ?? true)) {
        await Future.wait([
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cộng đồng',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          wrapWithModel(
                            model: _model.displayItemSearchModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const DisplayItemSearchWidget(),
                          ),
                        ]
                            .divide(const SizedBox(height: 8.0))
                            .addToEnd(const SizedBox(height: 8.0)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.7,
                                        child: const TaoBaiPostWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 266.0,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Viết bài mới',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        'Đặt câu hỏi cho cộng đồng hoặc đơn giản là ghi lại hành trình của bản thân',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFFBDBDBD),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Frame_1.svg',
                                    width: 35.0,
                                    height: 35.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(width: 8.0))
                                  .addToStart(const SizedBox(width: 8.0))
                                  .addToEnd(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Bài viết mới nhất',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'userId',
                            isEqualTo: currentUserUid,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 32.0,
                                height: 32.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> columnUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnUsersRecord =
                              columnUsersRecordList.isNotEmpty
                                  ? columnUsersRecordList.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<PostsRecord>>(
                                stream: queryPostsRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 32.0,
                                        height: 32.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostsRecord> listViewPostsRecordList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      32.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewPostsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 16.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewPostsRecord =
                                          listViewPostsRecordList[
                                              listViewIndex];
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              listViewPostsRecord.postUser!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final containerUsersRecord =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        50.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        50.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        50.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                'https://picsum.photos/seed/194/600',
                                                                width: 35.0,
                                                                height: 35.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        containerUsersRecord
                                                                            .firstName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/briefcase-medical.svg',
                                                                            width:
                                                                                16.0,
                                                                            height:
                                                                                16.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewPostsRecord
                                                                          .createDate
                                                                          ?.toString(),
                                                                      '2024/10/10',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              11.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Icon(
                                                          Icons.more_vert,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 17.0,
                                                        ),
                                                      ],
                                                    ),
                                                    if (listViewPostsRecord
                                                                .imageUrl !=
                                                            '')
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/766/600',
                                                          width: 334.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        listViewPostsRecord
                                                            .content,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final liekCountElement =
                                                                    columnUsersRecord
                                                                        ?.reference;
                                                                final liekCountUpdate = listViewPostsRecord
                                                                        .liekCount
                                                                        .contains(
                                                                            liekCountElement)
                                                                    ? FieldValue
                                                                        .arrayRemove([
                                                                        liekCountElement
                                                                      ])
                                                                    : FieldValue
                                                                        .arrayUnion([
                                                                        liekCountElement
                                                                      ]);
                                                                await listViewPostsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'liekCount':
                                                                          liekCountUpdate,
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              value: listViewPostsRecord
                                                                  .liekCount
                                                                  .contains(
                                                                      columnUsersRecord
                                                                          ?.reference),
                                                              onIcon: Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              listViewPostsRecord
                                                                  .liekCount
                                                                  .length
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () =>
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.9,
                                                                      child:
                                                                          BinhLuanWidget(
                                                                        postID:
                                                                            listViewPostsRecord.reference,
                                                                        userID:
                                                                            listViewPostsRecord.postUser!,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/Button.svg',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                listViewPostsRecord
                                                                    .comments
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 16.0)),
                                                    ),
                                                  ]
                                                      .divide(const SizedBox(
                                                          height: 16.0))
                                                      .addToStart(const SizedBox(
                                                          height: 16.0))
                                                      .addToEnd(const SizedBox(
                                                          height: 16.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .addToEnd(const SizedBox(height: 56.0)),
                  ),
                ),
              ),
              Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    page: 'home',
                    role: FFAppState().UserInfo.data.role,
                    currentPage: _model.currentPage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
