import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'week_post_picker_model.dart';
export 'week_post_picker_model.dart';

class WeekPostPickerWidget extends StatefulWidget {
  const WeekPostPickerWidget({
    super.key,
    this.weekSelected,
    required this.index,
    this.type,
  });

  final String? weekSelected;
  final int? index;
  final int? type;

  @override
  State<WeekPostPickerWidget> createState() => _WeekPostPickerWidgetState();
}

class _WeekPostPickerWidgetState extends State<WeekPostPickerWidget> {
  late WeekPostPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekPostPickerModel());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
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
            Builder(
              builder: (context) {
                final eachWeekPost = functions.weekPostPicker().toList();

                return SizedBox(
                  height: 250.0,
                  child: CarouselSlider.builder(
                    itemCount: eachWeekPost.length,
                    itemBuilder: (context, eachWeekPostIndex, _) {
                      final eachWeekPostItem = eachWeekPost[eachWeekPostIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            eachWeekPostItem,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      );
                    },
                    carouselController: _model.weekPostController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: max(
                          0,
                          min(
                              valueOrDefault<int>(
                                (widget.index!) - 1,
                                0,
                              ),
                              eachWeekPost.length - 1)),
                      viewportFraction: 0.2,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      onPageChanged: (index, _) async {
                        _model.weekPostCurrentIndex = index;
                        FFAppState().weekPost = _model.weekPostCurrentIndex + 1;
                        FFAppState().update(() {});
                      },
                    ),
                  ),
                );
              },
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
