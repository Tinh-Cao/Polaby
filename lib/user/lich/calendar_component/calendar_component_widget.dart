import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/lich/day_label_component/day_label_component_widget.dart';
import '/user/lich/hang_ngay/hang_ngay_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'calendar_component_model.dart';
export 'calendar_component_model.dart';

class CalendarComponentWidget extends StatefulWidget {
  const CalendarComponentWidget({
    super.key,
    required this.inputDate,
    this.initialSelectedDate,
    this.onSelectDateAction,
  });

  final DateTime? inputDate;
  final DateTime? initialSelectedDate;
  final Future Function(DateTime selectedDate)? onSelectDateAction;

  @override
  State<CalendarComponentWidget> createState() =>
      _CalendarComponentWidgetState();
}

class _CalendarComponentWidgetState extends State<CalendarComponentWidget> {
  late CalendarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.inputDate = widget.inputDate;
      safeSetState(() {});
      if (widget.initialSelectedDate != null) {
        _model.selectedDate = widget.initialSelectedDate;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DailyRecord>>(
      stream: queryDailyRecord(
        queryBuilder: (dailyRecord) => dailyRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
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
        List<DailyRecord> containerDailyRecordList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    wrapWithModel(
                      model: _model.dayLabelComponentModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'T2',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dayLabelComponentModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'T3',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dayLabelComponentModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'T4',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dayLabelComponentModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'T5',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dayLabelComponentModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'T6',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dayLabelComponentModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'T7',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dayLabelComponentModel7,
                      updateCallback: () => safeSetState(() {}),
                      child: const DayLabelComponentWidget(
                        day: 'CN',
                      ),
                    ),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tháng',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          dateTimeFormat(
                            "M",
                            _model.inputDate,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ]
                          .divide(const SizedBox(width: 4.0))
                          .addToStart(const SizedBox(width: 8.0)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final calendar = functions
                                .getCalendarForMonth(_model.inputDate!)
                                .toList();

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 8.0,
                                childAspectRatio: 1.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: calendar.length,
                              itemBuilder: (context, calendarIndex) {
                                final calendarItem = calendar[calendarIndex];
                                return Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Future.wait([
                                        Future(() async {
                                          _model.selectedDate =
                                              calendarItem.calendarDate;
                                          safeSetState(() {});
                                        }),
                                        Future(() async {
                                          FFAppState().updateWeight = 0.0;
                                          FFAppState().updateSize = 0.0;
                                          FFAppState().updateBloodSys = 0.0;
                                          FFAppState().updateBloodDia = 0.0;
                                          safeSetState(() {});
                                        }),
                                      ]);
                                      await widget.onSelectDateAction?.call(
                                        _model.selectedDate!,
                                      );
                                      _model.apiResultyx5 = await PolabyGroup
                                          .apiV1SchedulesGETCall
                                          .call(
                                        userId: currentUserUid,
                                        date: (String datePicked) {
                                          return datePicked.split(' ')[0];
                                        }(_model.selectedDate!.toString()),
                                        pageIndex: 1,
                                        pageSize: 20,
                                        orderByDescending: false,
                                        isDeleted: false,
                                        order: 'date',
                                      );

                                      if ((_model.apiResultyx5?.succeeded ??
                                          true)) {
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
                                                            _model
                                                                .selectedDate!),
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
                                                    _model.selectedDate!),
                                            userId: currentUserUid,
                                          ));
                                          _model.dailyCollection =
                                              DailyRecord.getDocumentFromData(
                                                  createDailyRecordData(
                                                    date: functions
                                                        .convertToApiDateFormatDate(
                                                            _model
                                                                .selectedDate!),
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
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.95,
                                                child: HangNgayWidget(
                                                  datePicked:
                                                      _model.selectedDate!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                () {
                                                  if (dateTimeFormat(
                                                        "d/M/y",
                                                        calendarItem
                                                            .calendarDate,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) ==
                                                      dateTimeFormat(
                                                        "d/M/y",
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else if (dateTimeFormat(
                                                        "d/M/y",
                                                        calendarItem
                                                            .calendarDate,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) ==
                                                      dateTimeFormat(
                                                        "d/M/y",
                                                        _model.selectedDate,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .pink50;
                                                  } else if (calendarItem
                                                          .isPreviousMonth ||
                                                      calendarItem
                                                          .isNextMonth) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground;
                                                  }
                                                }(),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                "d",
                                                dateTimeFromSecondsSinceEpoch(
                                                    valueOrDefault<int>(
                                                  calendarItem.calendarDate
                                                      ?.secondsSinceEpoch,
                                                  0,
                                                )),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: () {
                                                          if (dateTimeFormat(
                                                                "d/M/y",
                                                                calendarItem
                                                                    .calendarDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                "d/M/y",
                                                                getCurrentTimestamp,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground;
                                                          } else if (dateTimeFormat(
                                                                "d/M/y",
                                                                calendarItem
                                                                    .calendarDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                "d/M/y",
                                                                _model
                                                                    .selectedDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primary;
                                                          } else if (calendarItem
                                                                  .isPreviousMonth ||
                                                              calendarItem
                                                                  .isNextMonth) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          }
                                                        }(),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          if (valueOrDefault<bool>(
                                            functions.checkElementInList(
                                                    containerDailyRecordList
                                                        .toList(),
                                                    functions
                                                        .convertDateToFormattedString(
                                                            dateTimeFormat(
                                                      "d/M/y",
                                                      calendarItem
                                                          .calendarDate!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))) ==
                                                true,
                                            false,
                                          ))
                                            Container(
                                              width: 6.0,
                                              height: 6.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            functions.checkElementInList(
                                                    containerDailyRecordList
                                                        .toList(),
                                                    functions
                                                        .convertDateToFormattedString(
                                                            dateTimeFormat(
                                                      "d/M/y",
                                                      calendarItem
                                                          .calendarDate!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))) ==
                                                false,
                                            false,
                                          ))
                                            Container(
                                              width: 4.0,
                                              height: 4.0,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                        ].divide(const SizedBox(height: 2.0)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: 180.0 * (math.pi / 180),
                      child: FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.play_arrow,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.inputDate =
                              functions.getLastMonthDateTime(_model.inputDate!);
                          safeSetState(() {});
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.play_arrow,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        _model.inputDate =
                            functions.getNextMonthDateTime(_model.inputDate!);
                        safeSetState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 8.0)).addToStart(const SizedBox(height: 16.0)),
          ),
        );
      },
    );
  }
}
