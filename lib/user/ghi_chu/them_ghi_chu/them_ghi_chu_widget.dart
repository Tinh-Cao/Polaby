import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/time_date_picker_widget.dart';
import '/components/trimester_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'them_ghi_chu_model.dart';
export 'them_ghi_chu_model.dart';

class ThemGhiChuWidget extends StatefulWidget {
  const ThemGhiChuWidget({
    super.key,
    bool? isAdd,
    this.title,
    this.trimester,
    bool? isCalendar,
    this.date,
    this.index,
  })  : isAdd = isAdd ?? false,
        isCalendar = isCalendar ?? false;

  final bool isAdd;
  final String? title;
  final int? trimester;
  final bool isCalendar;
  final String? date;
  final int? index;

  @override
  State<ThemGhiChuWidget> createState() => _ThemGhiChuWidgetState();
}

class _ThemGhiChuWidgetState extends State<ThemGhiChuWidget> {
  late ThemGhiChuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThemGhiChuModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          FFAppState().dateNote = widget.date!;
          safeSetState(() {});
        }),
        Future(() async {
          _model.date = widget.date;
          _model.trimester = widget.trimester;
          _model.description = widget.title;
          _model.isCalendar = widget.isCalendar;
          safeSetState(() {});
        }),
      ]);
      _model.noteDocument = await queryNoteRecordOnce(
        queryBuilder: (noteRecord) => noteRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    _model.textController ??= TextEditingController(text: widget.title);
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = widget.isCalendar;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<NoteDetailRecord>>(
      stream: queryNoteDetailRecord(
        parent: _model.noteDocument?.reference,
        queryBuilder: (noteDetailRecord) => noteDetailRecord.where(
          'index',
          isEqualTo: widget.index,
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
        List<NoteDetailRecord> containerNoteDetailRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerNoteDetailRecord =
            containerNoteDetailRecordList.isNotEmpty
                ? containerNoteDetailRecordList.first
                : null;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              if (widget.isAdd == true) {
                                await containerNoteDetailRecord!.reference
                                    .delete();
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                              }
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
                        'Thêm ghi chú',
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
                              if (widget.isAdd == false) {
                                await containerNoteDetailRecord!.reference
                                    .update(createNoteDetailRecordData(
                                  description: _model.description,
                                  date: FFAppState().dateNote,
                                  type: _model.trimester == 0
                                      ? 5
                                      : _model.trimester,
                                ));
                              } else {
                                await containerNoteDetailRecord!.reference
                                    .update(createNoteDetailRecordData(
                                  isSelected: false,
                                  description: _model.description,
                                  date: FFAppState().dateNote,
                                  type: _model.trimester == 0
                                      ? 5
                                      : _model.trimester,
                                ));
                              }

                              Navigator.pop(context);
                            },
                            child: Text(
                              'Lưu',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                ]
                    .divide(const SizedBox(height: 8.0))
                    .addToStart(const SizedBox(height: 4.0)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          _model.description =
                                              _model.textController.text;
                                          safeSetState(() {});
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.done,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFFC5C5C7),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Tiêu đề',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
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
                                    0.0, 0.0, 16.0, 16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      isDismissible: false,
                                      enableDrag: false,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.35,
                                            child: TrimesterPickerWidget(
                                              index: valueOrDefault<int>(
                                                widget.index,
                                                1,
                                              ),
                                              type: valueOrDefault<int>(
                                                widget.trimester,
                                                1,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.getTrimester = value));

                                    _model.trimester = valueOrDefault<int>(
                                      _model.getTrimester ?? 1,
                                      1,
                                    );
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tam cá nguyệt',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              () {
                                                if (_model.trimester == 1) {
                                                  return 'Tam cá nguyệt đầu tiên';
                                                } else if (_model.trimester ==
                                                    2) {
                                                  return 'Tam cá nguyệt thứ 2';
                                                } else if (_model.trimester ==
                                                    3) {
                                                  return 'Tam cá nguyệt thứ 3';
                                                } else if (_model.trimester ==
                                                    4) {
                                                  return 'Trước khi sinh';
                                                } else if (_model.trimester ==
                                                    5) {
                                                  return 'Sau khi sinh';
                                                } else {
                                                  return 'Tam cá nguyệt đầu tiên';
                                                }
                                              }(),
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFFC5C5C7),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xFFC5C5C7),
                                            size: 12.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lịch',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Switch.adaptive(
                                      value: _model.switchValue!,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.switchValue = newValue);
                                        if (newValue) {
                                          _model.isCalendar = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.isCalendar = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  ],
                                ),
                              ),
                              if (_model.switchValue == true)
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              if (_model.switchValue == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.4,
                                              child: const TimeDatePickerWidget(
                                                date: '',
                                                hour: 0,
                                                minute: 0,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.dateNote = value));

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ngày',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                FFAppState().dateNote,
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFFC5C5C7),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFFC5C5C7),
                                              size: 12.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ].divide(const SizedBox(height: 16.0)).addToEnd(SizedBox(
                                height:
                                    _model.switchValue == true ? 12.0 : 0.0)),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await containerNoteDetailRecord!.reference.delete();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Visibility(
                            visible: widget.isAdd == false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Xoá',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ]
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                              ]
                                  .addToStart(const SizedBox(height: 8.0))
                                  .addToEnd(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .addToStart(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
