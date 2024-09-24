import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'chi_tiet_mon_an_model.dart';
export 'chi_tiet_mon_an_model.dart';

class ChiTietMonAnWidget extends StatefulWidget {
  const ChiTietMonAnWidget({
    super.key,
    required this.dishId,
    required this.dishName,
    required this.dishImage,
    required this.kcal,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
  });

  final String? dishId;
  final String? dishName;
  final String? dishImage;
  final double? kcal;
  final double? protein;
  final double? carbohydrates;
  final double? fat;

  @override
  State<ChiTietMonAnWidget> createState() => _ChiTietMonAnWidgetState();
}

class _ChiTietMonAnWidgetState extends State<ChiTietMonAnWidget> {
  late ChiTietMonAnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChiTietMonAnModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                            context.pop();
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
                      'Món ăn',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Expanded(
                      child: Opacity(
                        opacity: 0.0,
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Text(
                            'Lưu trữ',
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
              ].divide(const SizedBox(height: 8.0)).addToStart(const SizedBox(height: 4.0)),
            ),
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.dishImage!,
                        height: 192.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${valueOrDefault<String>(
                            widget.kcal?.toString(),
                            '560',
                          )} Kcal',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.dishName,
                            'Bún riêu',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.0,
                                          child: VerticalDivider(
                                            width: 8.0,
                                            thickness: 4.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Chất đạm: ${functions.caculatePercentageNutrient(widget.protein!, functions.totalNutrient(widget.protein, widget.carbohydrates, widget.fat)!).toString()}%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.0,
                                          child: VerticalDivider(
                                            width: 8.0,
                                            thickness: 4.0,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Chất đường bột: ${functions.caculatePercentageNutrient(widget.carbohydrates!, functions.totalNutrient(widget.protein, widget.carbohydrates, widget.fat)!).toString()}%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.0,
                                          child: VerticalDivider(
                                            width: 8.0,
                                            thickness: 4.0,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Chất béo: ${functions.caculatePercentageNutrient(widget.fat!, functions.totalNutrient(widget.protein, widget.carbohydrates, widget.fat)!).toString()}%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        SizedBox(
                                          width: 100.0,
                                          height: 100.0,
                                          child: FlutterFlowPieChart(
                                            data: FFPieChartData(
                                              values: [
                                                functions
                                                    .caculatePercentageNutrient(
                                                        widget.fat!,
                                                        functions.totalNutrient(
                                                            widget.protein,
                                                            widget
                                                                .carbohydrates,
                                                            widget.fat)!)
                                                    .toString(),
                                                functions
                                                    .caculatePercentageNutrient(
                                                        widget.carbohydrates!,
                                                        functions.totalNutrient(
                                                            widget.protein,
                                                            widget
                                                                .carbohydrates,
                                                            widget.fat)!)
                                                    .toString(),
                                                functions
                                                    .caculatePercentageNutrient(
                                                        widget.protein!,
                                                        functions.totalNutrient(
                                                            widget.protein,
                                                            widget
                                                                .carbohydrates,
                                                            widget.fat)!)
                                                    .toString()
                                              ],
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .warning,
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                                FlutterFlowTheme.of(context)
                                                    .primary
                                              ],
                                              radius: [24.0, 24.0, 24.0],
                                              borderColor: [
                                                const Color(0x00000000),
                                                Colors.transparent,
                                                Colors.transparent
                                              ],
                                            ),
                                            donutHoleRadius: 24.0,
                                            donutHoleColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            sectionLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Thực phẩm',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.5, 0.0),
                                    child: Text(
                                      'Khối lượng',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                            Divider(
                              height: 6.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: FFAppState().nutrient(
                        uniqueQueryKey: valueOrDefault<String>(
                          widget.dishId,
                          '0',
                        ),
                        requestFn: () =>
                            PolabyGroup.apiV1IngredientsGETCall.call(
                          dishId: widget.dishId,
                          isDeleted: false,
                          order: 'kcal',
                          pageIndex: 1,
                          pageSize: 100,
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
                        final listViewApiV1IngredientsGETResponse =
                            snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final ingredients =
                                PolabyGroup.apiV1IngredientsGETCall
                                        .ingredients(
                                          listViewApiV1IngredientsGETResponse
                                              .jsonBody,
                                        )
                                        ?.toList() ??
                                    [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: ingredients.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8.0),
                              itemBuilder: (context, ingredientsIndex) {
                                final ingredientsItem =
                                    ingredients[ingredientsIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        getJsonField(
                                          ingredientsItem,
                                          r'''$.name''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.5, 0.0),
                                        child: Text(
                                          '${getJsonField(
                                            ingredientsItem,
                                            r'''$.weight''',
                                          ).toString()}g',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ]
                      .divide(const SizedBox(height: 16.0))
                      .addToStart(const SizedBox(height: 8.0))
                      .addToEnd(const SizedBox(height: 8.0)),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
