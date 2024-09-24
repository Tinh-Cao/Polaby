import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'date_picker_model.dart';
export 'date_picker_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(0.0, 0.0),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Builder(
                builder: (context) {
                  final days = functions
                          .dayOfMonths(_model.monthsCurrentIndex,
                              _model.yearsCurrentIndex)
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
                                  functions.getCurrentDayIndex(days.toList()),
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
                          _model.curruntDayIndex = valueOrDefault<int>(
                            functions.getCurrentDayIndex(days.toList()),
                            1,
                          );
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
                                  functions
                                      .getCurrentMonthIndex(months.toList()),
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
                          _model.curruntMonthIndex = valueOrDefault<int>(
                            functions.getCurrentMonthIndex(months.toList()),
                            1,
                          );
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
                  final years = functions.years()?.toList() ?? [];

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
                                  functions.getCurrentYearIndex(years.toList()),
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
                          _model.curruntYearIndex = valueOrDefault<int>(
                            functions.getCurrentYearIndex(years.toList()),
                            1,
                          );
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
    );
  }
}
