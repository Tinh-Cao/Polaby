import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bai_viet_cua_ban_model.dart';
export 'bai_viet_cua_ban_model.dart';

class BaiVietCuaBanWidget extends StatefulWidget {
  const BaiVietCuaBanWidget({
    super.key,
    this.txtUserName,
    this.txtCreationDate,
    this.txtContent,
    this.txtLikeCount,
    this.txtCommentCount,
  });

  final String? txtUserName;
  final String? txtCreationDate;
  final String? txtContent;
  final String? txtLikeCount;
  final String? txtCommentCount;

  @override
  State<BaiVietCuaBanWidget> createState() => _BaiVietCuaBanWidgetState();
}

class _BaiVietCuaBanWidgetState extends State<BaiVietCuaBanWidget> {
  late BaiVietCuaBanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaiVietCuaBanModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkMyUser = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
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
                  context.pop();
                },
              ),
              title: Text(
                'Bài viết của bạn',
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
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<List<UsersRecord>>(
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
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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

                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<PostsRecord>>(
                                      stream: queryPostsRecord(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord
                                                .where(
                                                  'postUser',
                                                  isEqualTo: _model
                                                      .checkMyUser?.reference,
                                                )
                                                .orderBy('createDate',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 32.0,
                                              height: 32.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .pink50,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<PostsRecord>
                                            listViewPostsRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewPostsRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewPostsRecord =
                                                listViewPostsRecordList[
                                                    listViewIndex];
                                            return Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    listViewPostsRecord
                                                        .postUser!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final containerUsersRecord =
                                                      snapshot.data!;

                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(50.0),
                                                                        bottomRight:
                                                                            Radius.circular(50.0),
                                                                        topLeft:
                                                                            Radius.circular(50.0),
                                                                        topRight:
                                                                            Radius.circular(50.0),
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        'https://picsum.photos/seed/194/600',
                                                                        width:
                                                                            35.0,
                                                                        height:
                                                                            35.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'chi_tiet',
                                                                                    queryParameters: {
                                                                                      'postUserID': serializeParam(
                                                                                        listViewPostsRecord.postUser,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'userId': serializeParam(
                                                                                        containerUsersRecord.userId,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  containerUsersRecord.firstName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (containerUsersRecord.role == 'Expert')
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/briefcase-medical.svg',
                                                                                      width: 16.0,
                                                                                      height: 16.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              listViewPostsRecord.createDate?.toString(),
                                                                              '2024/02/2032',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  listViewPostsRecord
                                                                      .imageUrl,
                                                                  width: 334.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                listViewPostsRecord
                                                                    .content,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ToggleIcon(
                                                                      onPressed:
                                                                          () async {
                                                                        final liekCountElement =
                                                                            columnUsersRecord?.reference;
                                                                        final liekCountUpdate = listViewPostsRecord.liekCount.contains(liekCountElement)
                                                                            ? FieldValue.arrayRemove([
                                                                                liekCountElement
                                                                              ])
                                                                            : FieldValue.arrayUnion([
                                                                                liekCountElement
                                                                              ]);
                                                                        await listViewPostsRecord
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'liekCount': liekCountUpdate,
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      value: listViewPostsRecord
                                                                          .liekCount
                                                                          .contains(
                                                                              columnUsersRecord?.reference),
                                                                      onIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                      offIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      listViewPostsRecord
                                                                          .liekCount
                                                                          .length
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/Button.svg',
                                                                          width:
                                                                              24.0,
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
                                                              ].divide(const SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  height: 16.0))
                                                              .addToStart(
                                                                  const SizedBox(
                                                                      height:
                                                                          16.0))
                                                              .addToEnd(const SizedBox(
                                                                  height:
                                                                      16.0)),
                                                        ),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 16.0))
                          .addToEnd(const SizedBox(height: 56.0)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
