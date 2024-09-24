import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_v2_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/ghi_chu/them_ghi_chu/them_ghi_chu_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'ghi_chu_model.dart';
export 'ghi_chu_model.dart';

class GhiChuWidget extends StatefulWidget {
  const GhiChuWidget({super.key});

  @override
  State<GhiChuWidget> createState() => _GhiChuWidgetState();
}

class _GhiChuWidgetState extends State<GhiChuWidget> {
  late GhiChuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GhiChuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.noteCollection = await queryNoteRecordOnce(
        queryBuilder: (noteRecord) => noteRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!(_model.noteCollection?.reference != null)) {
        var noteRecordReference = NoteRecord.collection.doc();
        await noteRecordReference.set(createNoteRecordData(
          userId: currentUserUid,
        ));
        _model.noteCreated = NoteRecord.getDocumentFromData(
            createNoteRecordData(
              userId: currentUserUid,
            ),
            noteRecordReference);
      }
      _model.noteDocument = await queryNoteRecordOnce(
        queryBuilder: (noteRecord) => noteRecord.where(
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            if (responsiveVisibility(
              context: context,
              desktop: false,
            ))
              SliverAppBar(
                pinned: false,
                floating: true,
                snap: true,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'Ghi chú',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.numberOfNoteDetail =
                            await queryNoteDetailRecordCount(
                          parent: _model.noteDocument?.reference,
                        );

                        await NoteDetailRecord.createDoc(
                                _model.noteDocument!.reference)
                            .set(createNoteDetailRecordData(
                          isSelected: false,
                          index: _model.numberOfNoteDetail! + 1,
                          type: 1,
                        ));
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.9,
                                  child: ThemGhiChuWidget(
                                    isAdd: true,
                                    isCalendar: false,
                                    index: _model.numberOfNoteDetail! + 1,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        safeSetState(() {});
                      },
                      child: Text(
                        'Thêm',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ],
                centerTitle: true,
              )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  children: [
                    StreamBuilder<List<NoteRecord>>(
                      stream: queryNoteRecord(
                        queryBuilder: (noteRecord) => noteRecord.where(
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
                        List<NoteRecord> containerNoteRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerNoteRecord =
                            containerNoteRecordList.isNotEmpty
                                ? containerNoteRecordList.first
                                : null;

                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
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
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Cần làm',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pink50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tam cá nguyệt',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: const Color(
                                                                        0xFFE385A5),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Đầu tiên',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Pregnancy_stages-amico_1_1.svg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<NoteDetailRecord>>(
                                                    stream:
                                                        queryNoteDetailRecord(
                                                      parent:
                                                          containerNoteRecord
                                                              ?.reference,
                                                      queryBuilder:
                                                          (noteDetailRecord) =>
                                                              noteDetailRecord
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        1,
                                                                  )
                                                                  .orderBy(
                                                                      'index'),
                                                    ),
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
                                                      List<NoteDetailRecord>
                                                          listViewNoteDetailRecordList =
                                                          snapshot.data!;
                                                      if (listViewNoteDetailRecordList
                                                          .isEmpty) {
                                                        return const SizedBox(
                                                          height: 50.0,
                                                          child:
                                                              EmptyV2Widget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          8.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewNoteDetailRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewNoteDetailRecord =
                                                              listViewNoteDetailRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            await listViewNoteDetailRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'isSelected': !listViewNoteDetailRecord.isSelected,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value:
                                                                              listViewNoteDetailRecord.isSelected,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.circle_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewNoteDetailRecord.description,
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (listViewNoteDetailRecord.date ==
                                                                            '') {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.9,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                      index: listViewNoteDetailRecord.index,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarMinus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: true,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                      index: listViewNoteDetailRecord.index,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarPlus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(const SizedBox(
                                                                      width:
                                                                          8.0))
                                                                  .addToEnd(
                                                                      const SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 16.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .deepPurple50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tam cá nguyệt',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: const Color(
                                                                        0xFFA691CB),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Thứ 2',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Pregnancy_stages-amico_2_1.svg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<NoteDetailRecord>>(
                                                    stream:
                                                        queryNoteDetailRecord(
                                                      parent:
                                                          containerNoteRecord
                                                              ?.reference,
                                                      queryBuilder:
                                                          (noteDetailRecord) =>
                                                              noteDetailRecord
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        2,
                                                                  )
                                                                  .orderBy(
                                                                      'index'),
                                                    ),
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
                                                      List<NoteDetailRecord>
                                                          listViewNoteDetailRecordList =
                                                          snapshot.data!;
                                                      if (listViewNoteDetailRecordList
                                                          .isEmpty) {
                                                        return const SizedBox(
                                                          height: 50.0,
                                                          child:
                                                              EmptyV2Widget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          8.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewNoteDetailRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewNoteDetailRecord =
                                                              listViewNoteDetailRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            await listViewNoteDetailRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'isSelected': !listViewNoteDetailRecord.isSelected,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value:
                                                                              listViewNoteDetailRecord.isSelected,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.circle_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewNoteDetailRecord.description,
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (listViewNoteDetailRecord.date ==
                                                                            '') {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                      index: listViewNoteDetailRecord.index,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarMinus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarPlus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(const SizedBox(
                                                                      width:
                                                                          8.0))
                                                                  .addToEnd(
                                                                      const SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 16.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .blue50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tam cá nguyệt',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: const Color(
                                                                        0xFF90CAF9),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Thứ 3',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Pregnancy_stages-amico_3_2.svg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<NoteDetailRecord>>(
                                                    stream:
                                                        queryNoteDetailRecord(
                                                      parent:
                                                          containerNoteRecord
                                                              ?.reference,
                                                      queryBuilder:
                                                          (noteDetailRecord) =>
                                                              noteDetailRecord
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        3,
                                                                  )
                                                                  .orderBy(
                                                                      'index'),
                                                    ),
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
                                                      List<NoteDetailRecord>
                                                          listViewNoteDetailRecordList =
                                                          snapshot.data!;
                                                      if (listViewNoteDetailRecordList
                                                          .isEmpty) {
                                                        return const SizedBox(
                                                          height: 50.0,
                                                          child:
                                                              EmptyV2Widget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          8.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewNoteDetailRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewNoteDetailRecord =
                                                              listViewNoteDetailRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            await listViewNoteDetailRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'isSelected': !listViewNoteDetailRecord.isSelected,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value:
                                                                              listViewNoteDetailRecord.isSelected,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.circle_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewNoteDetailRecord.description,
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (listViewNoteDetailRecord.date ==
                                                                            '') {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                      index: listViewNoteDetailRecord.index,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarMinus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarPlus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(const SizedBox(
                                                                      width:
                                                                          8.0))
                                                                  .addToEnd(
                                                                      const SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 16.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFE0F2F1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Trước',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: const Color(
                                                                        0xFF80CBC4),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Khi sinh',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Pregnancy_stages-amico_3_1.svg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<NoteDetailRecord>>(
                                                    stream:
                                                        queryNoteDetailRecord(
                                                      parent:
                                                          containerNoteRecord
                                                              ?.reference,
                                                      queryBuilder:
                                                          (noteDetailRecord) =>
                                                              noteDetailRecord
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        4,
                                                                  )
                                                                  .orderBy(
                                                                      'index'),
                                                    ),
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
                                                      List<NoteDetailRecord>
                                                          listViewNoteDetailRecordList =
                                                          snapshot.data!;
                                                      if (listViewNoteDetailRecordList
                                                          .isEmpty) {
                                                        return const SizedBox(
                                                          height: 50.0,
                                                          child:
                                                              EmptyV2Widget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          8.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewNoteDetailRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewNoteDetailRecord =
                                                              listViewNoteDetailRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            await listViewNoteDetailRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'isSelected': !listViewNoteDetailRecord.isSelected,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value:
                                                                              listViewNoteDetailRecord.isSelected,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.circle_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewNoteDetailRecord.description,
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (listViewNoteDetailRecord.date ==
                                                                            '') {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                      index: listViewNoteDetailRecord.index,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarMinus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarPlus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(const SizedBox(
                                                                      width:
                                                                          8.0))
                                                                  .addToEnd(
                                                                      const SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 16.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFFFF8E1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Sau',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: const Color(
                                                                        0xFFFFE082),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Khi sinh',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: const Color(
                                                                        0xFFFFCA28),
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Pregnancy_stages-amico_5_1.svg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<NoteDetailRecord>>(
                                                    stream:
                                                        queryNoteDetailRecord(
                                                      parent:
                                                          containerNoteRecord
                                                              ?.reference,
                                                      queryBuilder:
                                                          (noteDetailRecord) =>
                                                              noteDetailRecord
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        5,
                                                                  )
                                                                  .orderBy(
                                                                      'index'),
                                                    ),
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
                                                      List<NoteDetailRecord>
                                                          listViewNoteDetailRecordList =
                                                          snapshot.data!;
                                                      if (listViewNoteDetailRecordList
                                                          .isEmpty) {
                                                        return const SizedBox(
                                                          height: 50.0,
                                                          child:
                                                              EmptyV2Widget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          8.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewNoteDetailRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewNoteDetailRecord =
                                                              listViewNoteDetailRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            await listViewNoteDetailRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'isSelected': !listViewNoteDetailRecord.isSelected,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value:
                                                                              listViewNoteDetailRecord.isSelected,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.circle_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewNoteDetailRecord.description,
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (listViewNoteDetailRecord.date ==
                                                                            '') {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                      index: listViewNoteDetailRecord.index,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarMinus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.95,
                                                                                    child: ThemGhiChuWidget(
                                                                                      isAdd: false,
                                                                                      title: listViewNoteDetailRecord.description,
                                                                                      trimester: listViewNoteDetailRecord.type,
                                                                                      isCalendar: listViewNoteDetailRecord.date != '' ? true : false,
                                                                                      date: listViewNoteDetailRecord.date,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .calendarPlus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(const SizedBox(
                                                                      width:
                                                                          8.0))
                                                                  .addToEnd(
                                                                      const SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 16.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 8.0)),
                                              ),
                                            ].divide(const SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(height: 8.0))
                                        .addToEnd(const SizedBox(height: 80.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
                          page: 'note',
                          role: FFAppState().UserInfo.data.role,
                          currentPage: _model.currentPage,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
