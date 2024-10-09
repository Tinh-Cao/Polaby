import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'chi_tiet_nguoidung_model.dart';
export 'chi_tiet_nguoidung_model.dart';

class ChiTietNguoidungWidget extends StatefulWidget {
  const ChiTietNguoidungWidget({
    super.key,
    required this.postUserID,
    required this.userId,
  });

  final DocumentReference? postUserID;
  final String? userId;

  @override
  State<ChiTietNguoidungWidget> createState() => _ChiTietNguoidungWidgetState();
}

class _ChiTietNguoidungWidgetState extends State<ChiTietNguoidungWidget>
    with TickerProviderStateMixin {
  late ChiTietNguoidungModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChiTietNguoidungModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult7sx = await PolabyGroup.apiV1AccountsidGETCall.call(
        id: widget.userId,
      );

      _model.apiResultmkt = await PolabyGroup.ratingsGETCall.call(
        accountId: widget.userId,
      );

      if ((_model.apiResultmkt?.succeeded ?? true)) {
        _model.numberOfPeople =
            functions.calculateNumberOfRatings(PolabyGroup.ratingsGETCall
                .stars(
                  (_model.apiResultmkt?.jsonBody ?? ''),
                )
                ?.toList());
        _model.ratingAverage =
            functions.calculateAverageRating(PolabyGroup.ratingsGETCall
                .stars(
                  (_model.apiResultmkt?.jsonBody ?? ''),
                )
                ?.toList());
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
              context.pop();
            },
          ),
          title: Text(
            'Thông tin chi tiết',
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
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
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
                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerUsersRecord =
                      containerUsersRecordList.isNotEmpty
                          ? containerUsersRecordList.first
                          : null;

                  return Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 96.0,
                                        height: 96.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://picsum.photos/seed/402/600',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (PolabyGroup.apiV1AccountsidGETCall
                                                  .role(
                                                (_model.apiResult7sx
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              'Expert')
                                            Text(
                                              valueOrDefault<String>(
                                                PolabyGroup
                                                    .apiV1AccountsidGETCall
                                                    .level(
                                                      (_model.apiResult7sx
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.toString(),
                                                'không có dữ liệu ',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          Text(
                                            '${valueOrDefault<String>(
                                              PolabyGroup.apiV1AccountsidGETCall
                                                  .lastName(
                                                (_model.apiResult7sx
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'dữ liệu',
                                            )} ${valueOrDefault<String>(
                                              PolabyGroup.apiV1AccountsidGETCall
                                                  .firstName(
                                                (_model.apiResult7sx
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'không có',
                                            )}',
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
                                            valueOrDefault<String>(
                                              PolabyGroup.apiV1AccountsidGETCall
                                                  .email(
                                                (_model.apiResult7sx
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'không có dữ liệu',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              PolabyGroup.apiV1AccountsidGETCall
                                                  .dateOfBirth(
                                                (_model.apiResult7sx
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'không có dữ liệu',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (columnUsersRecord.isFollowing.contains(
                                      containerUsersRecord?.reference)) {
                                    await columnUsersRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'isFollowing':
                                              FieldValue.arrayRemove([
                                            containerUsersRecord?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await columnUsersRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'isFollowing': FieldValue.arrayUnion([
                                            containerUsersRecord?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                  }
                                },
                                text: columnUsersRecord!.isFollowing.contains(
                                        containerUsersRecord?.reference)
                                    ? 'Đã theo dõi'
                                    : 'Theo dõi ',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: const Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        unselectedLabelStyle: const TextStyle(),
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        unselectedBackgroundColor:
                                            const Color(0xFFEAEAEB),
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        unselectedBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 3.0,
                                        borderRadius: 16.0,
                                        elevation: 0.0,
                                        buttonMargin:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        tabs: const [
                                          Tab(
                                            text: 'Bài viết',
                                          ),
                                          Tab(
                                            text: 'Thông tin',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Bài viết mới nhất',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream:
                                                        UsersRecord.getDocument(
                                                            widget
                                                                .postUserID!),
                                                    builder:
                                                        (context, snapshot) {
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

                                                      final columnUsersRecord =
                                                          snapshot.data!;

                                                      return SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    PostsRecord>>(
                                                              stream:
                                                                  queryPostsRecord(
                                                                queryBuilder:
                                                                    (postsRecord) =>
                                                                        postsRecord
                                                                            .where(
                                                                  'postUser',
                                                                  isEqualTo: widget
                                                                      .postUserID,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          32.0,
                                                                      height:
                                                                          32.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostsRecord>
                                                                    listViewPostsRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    8.0,
                                                                    0,
                                                                    0,
                                                                  ),
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewPostsRecordList
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      const SizedBox(
                                                                          height:
                                                                              16.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewPostsRecord =
                                                                        listViewPostsRecordList[
                                                                            listViewIndex];
                                                                    return Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      ClipRRect(
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(50.0),
                                                                                          bottomRight: Radius.circular(50.0),
                                                                                          topLeft: Radius.circular(50.0),
                                                                                          topRight: Radius.circular(50.0),
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://picsum.photos/seed/194/600',
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  columnUsersRecord.firstName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                ),
                                                                                                if (columnUsersRecord.role == 'Expert')
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
                                                                                                '20/10/2024',
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
                                                                                    Icons.more_vert,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 17.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (listViewPostsRecord.imageUrl != '')
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  'https://picsum.photos/seed/766/600',
                                                                                  width: 334.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  listViewPostsRecord.content,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.favorite_border_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            listViewPostsRecord.liekCount.length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: SvgPicture.asset(
                                                                                              'assets/images/Button.svg',
                                                                                              width: 24.0,
                                                                                              height: 24.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          listViewPostsRecord.comments.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].addToEnd(const SizedBox(height: 16.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ].addToEnd(const SizedBox(
                                                              height: 56.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]
                                                  .divide(const SizedBox(height: 8.0))
                                                  .addToStart(
                                                      const SizedBox(height: 16.0))
                                                  .addToEnd(
                                                      const SizedBox(height: 16.0)),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  Function() navigate = () {};
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Đăng xuất'),
                                                                content: const Text(
                                                                    'Bạn chắc chắn muốn đăng xuất tài khoản'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: const Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signOut();
                                                    GoRouter.of(context)
                                                        .clearRedirectLocation();

                                                    navigate = () =>
                                                        context.goNamedAuth(
                                                            'chao_mung',
                                                            context.mounted);
                                                  }

                                                  navigate();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(height: 8.0))
                                                .addToStart(
                                                    const SizedBox(height: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
