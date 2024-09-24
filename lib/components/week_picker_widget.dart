import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'week_picker_model.dart';
export 'week_picker_model.dart';

class WeekPickerWidget extends StatefulWidget {
  const WeekPickerWidget({super.key});

  @override
  State<WeekPickerWidget> createState() => _WeekPickerWidgetState();
}

class _WeekPickerWidgetState extends State<WeekPickerWidget> {
  late WeekPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekPickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final weeks = functions
                                    .weeks()
                                    ?.map((e) => e)
                                    .toList()
                                    .toList() ??
                                [];

                            return SizedBox(
                              width: 55.0,
                              height: 250.0,
                              child: CarouselSlider.builder(
                                itemCount: weeks.length,
                                itemBuilder: (context, weeksIndex, _) {
                                  final weeksItem = weeks[weeksIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        weeksIndex.toString(),
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
                                carouselController: _model.weeksController ??=
                                    CarouselController(),
                                options: CarouselOptions(
                                  initialPage: max(
                                      0,
                                      min(
                                          valueOrDefault<int>(
                                            weeks.first,
                                            0,
                                          ),
                                          weeks.length - 1)),
                                  viewportFraction: 0.2,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.4,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.vertical,
                                  autoPlay: false,
                                  onPageChanged: (index, _) =>
                                      _model.weeksCurrentIndex = index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Tuần',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final days = functions.dayOfWeeks()?.toList() ?? [];

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
                                        daysIndex.toString(),
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
                                carouselController: _model.daysController ??=
                                    CarouselController(),
                                options: CarouselOptions(
                                  initialPage: max(
                                      0,
                                      min(
                                          valueOrDefault<int>(
                                            days.first,
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
                                  onPageChanged: (index, _) =>
                                      _model.daysCurrentIndex = index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Ngày',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SizedBox(
              height: 30.0,
              child: Stack(
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color(0x19212121),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
