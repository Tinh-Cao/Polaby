import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'date_picker_birthday_model.dart';
export 'date_picker_birthday_model.dart';

class DatePickerBirthdayWidget extends StatefulWidget {
  const DatePickerBirthdayWidget({
    super.key,
    this.currentDay,
    this.currentMonth,
    this.currentYear,
  });

  final int? currentDay;
  final int? currentMonth;
  final int? currentYear;

  @override
  State<DatePickerBirthdayWidget> createState() =>
      _DatePickerBirthdayWidgetState();
}

class _DatePickerBirthdayWidgetState extends State<DatePickerBirthdayWidget> {
  late DatePickerBirthdayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerBirthdayModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dayAppstate = FFAppState().day;
      _model.curruntDayIndex = FFAppState().day;
      _model.curruntMonthIndex = FFAppState().month;
      _model.monthAppstate = FFAppState().month;
      safeSetState(() {});
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 32.0,
                ),
                onPressed: () async {
                  if (!((_model.daysCurrentIndex == 0) &&
                      (_model.monthsCurrentIndex == 0) &&
                      (_model.yearsCurrentIndex == 0) &&
                      (_model.dayAppstate == FFAppState().day) &&
                      (_model.monthAppstate == FFAppState().month))) {
                    if ((_model.daysCurrentIndex != 0) &&
                        (_model.monthsCurrentIndex == 0) &&
                        (_model.yearsCurrentIndex == 0)) {
                      if ((_model.daysCurrentIndex != 0) &&
                          (_model.monthAppstate == FFAppState().month)) {
                        FFAppState().day = _model.daysCurrentIndex + 1;
                        safeSetState(() {});
                      } else {
                        FFAppState().month = _model.monthsCurrentIndex + 1;
                        FFAppState().day = _model.daysCurrentIndex + 1;
                        safeSetState(() {});
                      }
                    } else {
                      if ((_model.monthsCurrentIndex != 0) &&
                          (_model.daysCurrentIndex == 0) &&
                          (_model.yearsCurrentIndex == 0)) {
                        if ((_model.monthsCurrentIndex != 0) &&
                            (_model.dayAppstate == FFAppState().day)) {
                          FFAppState().month = _model.monthsCurrentIndex + 1;
                          safeSetState(() {});
                        } else {
                          FFAppState().month = _model.monthsCurrentIndex + 1;
                          FFAppState().day = _model.daysCurrentIndex + 1;
                          safeSetState(() {});
                        }
                      } else {
                        if ((_model.yearsCurrentIndex != 0) &&
                            (_model.daysCurrentIndex == 0) &&
                            (_model.monthsCurrentIndex == 0)) {
                          if ((_model.yearsCurrentIndex != 1) &&
                              (_model.daysCurrentIndex == 0) &&
                              (_model.monthsCurrentIndex == 0)) {
                            if ((_model.monthsCurrentIndex ==
                                    _model.monthAppstate) &&
                                (_model.daysCurrentIndex ==
                                    _model.dayAppstate) &&
                                (_model.monthsCurrentIndex == 0) &&
                                (_model.daysCurrentIndex == 0) &&
                                (_model.yearsCurrentIndex != 0)) {
                              FFAppState().year = functions.getYearFromIndexV2(
                                      _model.yearsCurrentIndex) +
                                  1;
                              safeSetState(() {});
                            } else {
                              if ((_model.dayAppstate != FFAppState().day) ||
                                  (_model.monthAppstate !=
                                      FFAppState().month)) {
                                if ((_model.daysCurrentIndex == 0) &&
                                    (_model.monthsCurrentIndex == 0) &&
                                    (_model.yearsCurrentIndex != 0) &&
                                    (_model.dayAppstate != FFAppState().day)) {
                                  FFAppState().month =
                                      _model.monthsCurrentIndex + 1;
                                  FFAppState().year =
                                      functions.getYearFromIndexV2(
                                              _model.yearsCurrentIndex) +
                                          1;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().month =
                                      _model.monthsCurrentIndex + 1;
                                  FFAppState().day =
                                      _model.daysCurrentIndex + 1;
                                  FFAppState().year =
                                      functions.getYearFromIndexV2(
                                              _model.yearsCurrentIndex) +
                                          1;
                                  safeSetState(() {});
                                }
                              } else {
                                FFAppState().year =
                                    functions.getYearFromIndexV2(
                                            _model.yearsCurrentIndex) +
                                        1;
                                safeSetState(() {});
                              }
                            }
                          }
                        } else {
                          if ((_model.daysCurrentIndex != 0) &&
                              (_model.monthsCurrentIndex != 0) &&
                              (_model.yearsCurrentIndex != 0)) {
                            FFAppState().month = _model.monthsCurrentIndex + 1;
                            FFAppState().day = _model.daysCurrentIndex + 1;
                            FFAppState().year = functions.getYearFromIndexV2(
                                    _model.yearsCurrentIndex) +
                                1;
                            safeSetState(() {});
                          } else {
                            if ((_model.daysCurrentIndex !=
                                    _model.dayAppstate) &&
                                (_model.monthAppstate == FFAppState().month)) {
                              if (_model.monthsCurrentIndex !=
                                  _model.monthAppstate) {
                                if ((_model.daysCurrentIndex != 0) &&
                                    (_model.monthsCurrentIndex != 0) &&
                                    (_model.yearsCurrentIndex == 0)) {
                                  FFAppState().month =
                                      _model.monthsCurrentIndex + 1;
                                  FFAppState().day =
                                      _model.daysCurrentIndex + 1;
                                  safeSetState(() {});
                                } else {
                                  if (_model.yearsCurrentIndex != 0) {
                                    if ((_model.daysCurrentIndex != 0) ||
                                        (_model.dayAppstate !=
                                            FFAppState().day)) {
                                      FFAppState().day =
                                          _model.daysCurrentIndex + 1;
                                      FFAppState().year =
                                          functions.getYearFromIndexV2(
                                                  _model.yearsCurrentIndex) +
                                              1;
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().month =
                                          _model.monthsCurrentIndex + 1;
                                      FFAppState().year =
                                          functions.getYearFromIndexV2(
                                                  _model.yearsCurrentIndex) +
                                              1;
                                      safeSetState(() {});
                                    }
                                  } else {
                                    FFAppState().day =
                                        _model.daysCurrentIndex + 1;
                                    safeSetState(() {});
                                  }
                                }
                              } else {
                                FFAppState().month =
                                    _model.monthsCurrentIndex + 1;
                                FFAppState().day = _model.daysCurrentIndex + 1;
                                safeSetState(() {});
                              }
                            } else {
                              if ((_model.monthsCurrentIndex !=
                                      _model.monthAppstate) &&
                                  (_model.daysCurrentIndex !=
                                      _model.dayAppstate) &&
                                  (_model.monthsCurrentIndex == 0)) {
                                if ((_model.monthsCurrentIndex !=
                                        _model.monthAppstate) &&
                                    (_model.daysCurrentIndex !=
                                        _model.dayAppstate) &&
                                    (_model.monthsCurrentIndex == 0) &&
                                    (_model.daysCurrentIndex == 0)) {
                                  if ((_model.dayAppstate !=
                                          FFAppState().day) &&
                                      (_model.monthAppstate !=
                                          FFAppState().month)) {
                                    FFAppState().month =
                                        _model.monthsCurrentIndex + 1;
                                    FFAppState().day =
                                        _model.daysCurrentIndex + 1;
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().month =
                                        _model.monthsCurrentIndex + 1;
                                    safeSetState(() {});
                                  }
                                } else {
                                  FFAppState().month =
                                      _model.monthsCurrentIndex + 1;
                                  safeSetState(() {});
                                }
                              } else {
                                if (_model.yearsCurrentIndex != 0) {
                                  FFAppState().month =
                                      _model.monthsCurrentIndex + 1;
                                  FFAppState().day =
                                      _model.daysCurrentIndex + 1;
                                  FFAppState().year =
                                      functions.getYearFromIndexV2(
                                              _model.yearsCurrentIndex) +
                                          1;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().month =
                                      _model.monthsCurrentIndex + 1;
                                  FFAppState().day =
                                      _model.daysCurrentIndex + 1;
                                  safeSetState(() {});
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Stack(
          alignment: const AlignmentDirectional(0.0, 0.0),
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final days = functions
                              .dayOfMonths(_model.monthsCurrentIndex + 1,
                                  _model.yearsCurrentIndex + 1)
                              ?.toList() ??
                          [];

                      return SizedBox(
                        width: 55.0,
                        height: 250.0,
                        child: CarouselSlider.builder(
                          itemCount: days.length,
                          itemBuilder: (context, daysIndex, _) {
                            final daysItem = days[daysIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  daysItem.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            );
                          },
                          carouselController: _model.daysController ??=
                              CarouselController(),
                          options: CarouselOptions(
                            initialPage: max(
                                0,
                                min(
                                    valueOrDefault<int>(
                                      FFAppState().day - 1,
                                      0,
                                    ),
                                    days.length - 1)),
                            viewportFraction: 0.2,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.4,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: false,
                            onPageChanged: (index, _) async {
                              _model.daysCurrentIndex = index;
                              _model.curruntDayIndex = days.first;
                              _model.dayAppstate = days.first;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final months = functions.months()?.toList() ?? [];

                      return SizedBox(
                        width: 55.0,
                        height: 250.0,
                        child: CarouselSlider.builder(
                          itemCount: months.length,
                          itemBuilder: (context, monthsIndex, _) {
                            final monthsItem = months[monthsIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  monthsItem.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            );
                          },
                          carouselController: _model.monthsController ??=
                              CarouselController(),
                          options: CarouselOptions(
                            initialPage: max(
                                0,
                                min(
                                    valueOrDefault<int>(
                                      FFAppState().month - 1,
                                      0,
                                    ),
                                    months.length - 1)),
                            viewportFraction: 0.2,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.4,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: false,
                            onPageChanged: (index, _) async {
                              _model.monthsCurrentIndex = index;
                              _model.curruntMonthIndex =
                                  functions.getMonthIndex(months.first);
                              _model.monthAppstate = months.first;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final years = functions.yearForBirthDay().toList();

                      return SizedBox(
                        width: 70.0,
                        height: 250.0,
                        child: CarouselSlider.builder(
                          itemCount: years.length,
                          itemBuilder: (context, yearsIndex, _) {
                            final yearsItem = years[yearsIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  yearsItem.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            );
                          },
                          carouselController: _model.yearsController ??=
                              CarouselController(),
                          options: CarouselOptions(
                            initialPage: max(
                                0,
                                min(
                                    valueOrDefault<int>(
                                      functions
                                              .getYearIndex(FFAppState().year) -
                                          1,
                                      0,
                                    ),
                                    years.length - 1)),
                            viewportFraction: 0.2,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.4,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: false,
                            onPageChanged: (index, _) async {
                              _model.yearsCurrentIndex = index;
                              _model.curruntYearIndex =
                                  functions.getYearIndex(years.first);
                              safeSetState(() {});
                            },
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
