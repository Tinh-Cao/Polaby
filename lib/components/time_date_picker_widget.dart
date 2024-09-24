import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'time_date_picker_model.dart';
export 'time_date_picker_model.dart';

class TimeDatePickerWidget extends StatefulWidget {
  const TimeDatePickerWidget({
    super.key,
    this.datePicked,
    this.index,
    this.hour,
    this.minute,
    this.date,
  });

  final String? datePicked;
  final int? index;
  final int? hour;
  final int? minute;
  final String? date;

  @override
  State<TimeDatePickerWidget> createState() => _TimeDatePickerWidgetState();
}

class _TimeDatePickerWidgetState extends State<TimeDatePickerWidget> {
  late TimeDatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeDatePickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dailyScheduleCollections = await queryDailyRecordOnce(
        queryBuilder: (dailyRecord) => dailyRecord
            .where(
              'userId',
              isEqualTo: currentUserUid,
            )
            .where(
              'date',
              isEqualTo: widget.datePicked,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.specificScheduleV1 = await queryScheduleRecordOnce(
        parent: _model.dailyScheduleCollections?.reference,
        queryBuilder: (scheduleRecord) => scheduleRecord.where(
          'index',
          isEqualTo: widget.index,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.time =
                      '${_model.hoursCurrentIndex.toString()} : ${_model.minutesCurrentIndex < 10 ? '0${_model.minutesCurrentIndex.toString()}' : _model.minutesCurrentIndex.toString()}';
                  _model.dateNote = functions.getDateByIndex(
                      _model.dateCurrentIndex == 0
                          ? functions.getIndexForDate()
                          : _model.dateCurrentIndex,
                      functions.generateFormattedDateList()?.toList());
                  safeSetState(() {});
                  FFAppState().dateNote =
                      '${_model.dateNote}    ${_model.time}';
                  safeSetState(() {});
                  Navigator.pop(context, '${_model.dateNote} ${_model.time}');
                },
                child: Icon(
                  Icons.clear_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 32.0,
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: const AlignmentDirectional(0.0, 0.0),
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final hours = functions.hours().toList();

                              return SizedBox(
                                width: 55.0,
                                height: 250.0,
                                child: CarouselSlider.builder(
                                  itemCount: hours.length,
                                  itemBuilder: (context, hoursIndex, _) {
                                    final hoursItem = hours[hoursIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          hoursIndex.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    );
                                  },
                                  carouselController: _model.hoursController ??=
                                      CarouselController(),
                                  options: CarouselOptions(
                                    initialPage: max(
                                        0,
                                        min(
                                            valueOrDefault<int>(
                                              widget.hour,
                                              1,
                                            ),
                                            hours.length - 1)),
                                    viewportFraction: 0.2,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.vertical,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.hoursCurrentIndex = index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          ':',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final minutes = functions.minutes().toList();

                              return SizedBox(
                                width: 55.0,
                                height: 250.0,
                                child: CarouselSlider.builder(
                                  itemCount: minutes.length,
                                  itemBuilder: (context, minutesIndex, _) {
                                    final minutesItem = minutes[minutesIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            minutesIndex < 10
                                                ? '0${minutesIndex.toString()}'
                                                : minutesIndex.toString(),
                                            '00',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    );
                                  },
                                  carouselController:
                                      _model.minutesController ??=
                                          CarouselController(),
                                  options: CarouselOptions(
                                    initialPage: max(
                                        0,
                                        min(
                                            valueOrDefault<int>(
                                              widget.minute,
                                              1,
                                            ),
                                            minutes.length - 1)),
                                    viewportFraction: 0.2,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.vertical,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.minutesCurrentIndex = index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final date =
                            functions.generateFormattedDateList()?.toList() ??
                                [];

                        return SizedBox(
                          height: 250.0,
                          child: CarouselSlider.builder(
                            itemCount: date.length,
                            itemBuilder: (context, dateIndex, _) {
                              final dateItem = date[dateIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    dateItem,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              );
                            },
                            carouselController: _model.dateController ??=
                                CarouselController(),
                            options: CarouselOptions(
                              initialPage: max(
                                  0,
                                  min(
                                      valueOrDefault<int>(
                                        functions.getIndexForDate(),
                                        0,
                                      ),
                                      date.length - 1)),
                              viewportFraction: 0.2,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.4,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.vertical,
                              autoPlay: false,
                              onPageChanged: (index, _) =>
                                  _model.dateCurrentIndex = index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ].addToStart(const SizedBox(width: 16.0)),
            ),
            Material(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0x19212121),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
