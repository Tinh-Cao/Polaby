import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_picker_model.dart';
export 'filter_picker_model.dart';

class FilterPickerWidget extends StatefulWidget {
  const FilterPickerWidget({
    super.key,
    required this.index,
  });

  final int? index;

  @override
  State<FilterPickerWidget> createState() => _FilterPickerWidgetState();
}

class _FilterPickerWidgetState extends State<FilterPickerWidget> {
  late FilterPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterPickerModel());

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.filter_list_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 32.0,
                  ),
                  Text(
                    'Bộ lọc',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (_model.filterCurrentIndex != FFAppState().filterState) {
                    FFAppState().filterState = _model.filterCurrentIndex;
                    safeSetState(() {});
                  }
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
                final eachFilter = functions.generateFilterList().toList();

                return SizedBox(
                  height: 250.0,
                  child: CarouselSlider.builder(
                    itemCount: eachFilter.length,
                    itemBuilder: (context, eachFilterIndex, _) {
                      final eachFilterItem = eachFilter[eachFilterIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            eachFilterItem,
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
                    carouselController: _model.filterController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: max(
                          0,
                          min(
                              valueOrDefault<int>(
                                widget.index,
                                0,
                              ),
                              eachFilter.length - 1)),
                      viewportFraction: 0.2,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      onPageChanged: (index, _) =>
                          _model.filterCurrentIndex = index,
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
