import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'time_picker_model.dart';
export 'time_picker_model.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({
    super.key,
    required this.datePicked,
    required this.index,
    required this.hour,
    required this.minute,
  });

  final String? datePicked;
  final int? index;
  final int? hour;
  final int? minute;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePickerModel());

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
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
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
                  safeSetState(() {});
                  _model.specificSchedule = await queryScheduleRecordOnce(
                    parent: _model.dailyScheduleCollections?.reference,
                    queryBuilder: (scheduleRecord) => scheduleRecord.where(
                      'index',
                      isEqualTo: widget.index,
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await _model.specificSchedule!.reference
                      .update(createScheduleRecordData(
                    time: _model.time,
                  ));
                  Navigator.pop(context);

                  safeSetState(() {});
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hoursIndex.toString(),
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
                Text(
                  ':',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                          carouselController: _model.minutesController ??=
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
              ],
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
