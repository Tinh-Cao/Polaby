import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'trimester_picker_model.dart';
export 'trimester_picker_model.dart';

class TrimesterPickerWidget extends StatefulWidget {
  const TrimesterPickerWidget({
    super.key,
    this.datePicked,
    required this.index,
    required this.type,
  });

  final String? datePicked;
  final int? index;
  final int? type;

  @override
  State<TrimesterPickerWidget> createState() => _TrimesterPickerWidgetState();
}

class _TrimesterPickerWidgetState extends State<TrimesterPickerWidget> {
  late TrimesterPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrimesterPickerModel());

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
                  _model.type = _model.trimesterCurrentIndex;
                  safeSetState(() {});
                  Navigator.pop(context, _model.type);
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
                final eachTrimester = functions.trimesterPicker().toList();

                return SizedBox(
                  height: 250.0,
                  child: CarouselSlider.builder(
                    itemCount: eachTrimester.length,
                    itemBuilder: (context, eachTrimesterIndex, _) {
                      final eachTrimesterItem =
                          eachTrimester[eachTrimesterIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            () {
                              if (eachTrimesterIndex == 1) {
                                return 'Tam cá nguyệt đầu tiên';
                              } else if (eachTrimesterIndex == 2) {
                                return 'Tam cá nguyệt thứ 2';
                              } else if (eachTrimesterIndex == 3) {
                                return 'Tam cá nguyệt thứ 3';
                              } else if (eachTrimesterIndex == 4) {
                                return 'Trước khi sinh';
                              } else {
                                return 'Sau khi sinh';
                              }
                            }(),
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
                    carouselController: _model.trimesterController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: max(
                          0,
                          min(
                              valueOrDefault<int>(
                                widget.type,
                                1,
                              ),
                              eachTrimester.length - 1)),
                      viewportFraction: 0.2,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      onPageChanged: (index, _) =>
                          _model.trimesterCurrentIndex = index,
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
