import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'chi_tiet_dinh_duong_model.dart';
export 'chi_tiet_dinh_duong_model.dart';

class ChiTietDinhDuongWidget extends StatefulWidget {
  const ChiTietDinhDuongWidget({
    super.key,
    this.kcal,
    this.fat,
    this.protein,
    this.carbohydrates,
    this.nutrients,
  });

  final double? kcal;
  final double? fat;
  final double? protein;
  final double? carbohydrates;
  final List<dynamic>? nutrients;

  @override
  State<ChiTietDinhDuongWidget> createState() => _ChiTietDinhDuongWidgetState();
}

class _ChiTietDinhDuongWidgetState extends State<ChiTietDinhDuongWidget> {
  late ChiTietDinhDuongModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChiTietDinhDuongModel());

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
      children: [
        Stack(
          alignment: const AlignmentDirectional(0.0, -1.0),
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Image.network(
                'https://picsum.photos/seed/721/600',
                width: double.infinity,
                height: 240.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  width: 36.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent4,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Giá trị dinh dưỡng của 100g',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              '${widget.kcal?.toString()} Kcal',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                                            widget.fat)!),
                                                functions
                                                    .caculatePercentageNutrient(
                                                        widget.carbohydrates!,
                                                        functions.totalNutrient(
                                                            widget.protein,
                                                            widget
                                                                .carbohydrates,
                                                            widget.fat)!),
                                                functions
                                                    .caculatePercentageNutrient(
                                                        widget.protein!,
                                                        functions.totalNutrient(
                                                            widget.protein,
                                                            widget
                                                                .carbohydrates,
                                                            widget.fat)!)
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
                      ),
                      Container(
                        width: double.infinity,
                        height: 380.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Builder(
                          builder: (context) {
                            final nutrients = functions
                                .mapJson(widget.nutrients!.toList(), 1, 7,
                                    widget.kcal!, true)
                                .toList();

                            return FlutterFlowDataTable<dynamic>(
                              controller: _model.paginatedDataTableController1,
                              data: nutrients,
                              numRows: nutrients.length,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Thành phần',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Đơn vị',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Hàm lượng',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                              dataRowBuilder: (nutrientsItem, nutrientsIndex,
                                      selected, onSelectChanged) =>
                                  DataRow(
                                color: WidgetStateProperty.all(
                                  nutrientsIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                                cells: [
                                  Text(
                                    getJsonField(
                                      nutrientsItem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      nutrientsItem,
                                      r'''$.unitCode''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    (getJsonField(
                                      nutrientsItem,
                                      r'''$.amount''',
                                    )).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              paginated: false,
                              selectable: false,
                              headingRowHeight: 56.0,
                              dataRowHeight: 48.0,
                              columnSpacing: 32.0,
                              headingRowColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: false,
                              addTopAndBottomDivider: false,
                              hideDefaultHorizontalDivider: true,
                              addVerticalDivider: false,
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 420.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Builder(
                          builder: (context) {
                            final minerals = functions
                                .mapJson(widget.nutrients!.toList(), 14, 23,
                                    widget.kcal!, false)
                                .toList();

                            return FlutterFlowDataTable<dynamic>(
                              controller: _model.paginatedDataTableController2,
                              data: minerals,
                              numRows: minerals.length,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Khoáng chất',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Đơn vị',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Hàm lượng',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                              dataRowBuilder: (mineralsItem, mineralsIndex,
                                      selected, onSelectChanged) =>
                                  DataRow(
                                color: WidgetStateProperty.all(
                                  mineralsIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                                cells: [
                                  Text(
                                    getJsonField(
                                      mineralsItem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      mineralsItem,
                                      r'''$.unitCode''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      mineralsItem,
                                      r'''$.amount''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              paginated: false,
                              selectable: false,
                              width: double.infinity,
                              height: double.infinity,
                              headingRowHeight: 56.0,
                              dataRowHeight: 48.0,
                              columnSpacing: 32.0,
                              headingRowColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: false,
                              addTopAndBottomDivider: false,
                              hideDefaultHorizontalDivider: true,
                              addVerticalDivider: false,
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 500.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final vitamins = functions
                                .mapJson(widget.nutrients!.toList(), 24, 42,
                                    widget.kcal!, false)
                                .toList();

                            return FlutterFlowDataTable<dynamic>(
                              controller: _model.paginatedDataTableController3,
                              data: vitamins,
                              numRows: vitamins.length,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Vitamin',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Đơn vị',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Hàm lượng',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                              dataRowBuilder: (vitaminsItem, vitaminsIndex,
                                      selected, onSelectChanged) =>
                                  DataRow(
                                color: WidgetStateProperty.all(
                                  vitaminsIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                                cells: [
                                  Text(
                                    getJsonField(
                                      vitaminsItem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      vitaminsItem,
                                      r'''$.unitCode''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      vitaminsItem,
                                      r'''$.amount''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              paginated: false,
                              selectable: false,
                              width: double.infinity,
                              height: double.infinity,
                              headingRowHeight: 56.0,
                              dataRowHeight: 48.0,
                              columnSpacing: 32.0,
                              headingRowColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: false,
                              addTopAndBottomDivider: false,
                              hideDefaultHorizontalDivider: true,
                              addVerticalDivider: false,
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 500.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final purins = functions
                                .mapJson(widget.nutrients!.toList(), 43, 80,
                                    widget.kcal!, false)
                                .toList();

                            return FlutterFlowDataTable<dynamic>(
                              controller: _model.paginatedDataTableController4,
                              data: purins,
                              numRows: purins.length,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Purin',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Đơn vị',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Hàm lượng',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                              dataRowBuilder: (purinsItem, purinsIndex,
                                      selected, onSelectChanged) =>
                                  DataRow(
                                color: WidgetStateProperty.all(
                                  purinsIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                                cells: [
                                  Text(
                                    getJsonField(
                                      purinsItem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      purinsItem,
                                      r'''$.unitCode''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      purinsItem,
                                      r'''$.amount''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              paginated: false,
                              selectable: false,
                              width: double.infinity,
                              height: double.infinity,
                              headingRowHeight: 56.0,
                              dataRowHeight: 48.0,
                              columnSpacing: 32.0,
                              headingRowColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: false,
                              addTopAndBottomDivider: false,
                              hideDefaultHorizontalDivider: true,
                              addVerticalDivider: false,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Tài liệu tham khảo: Bộ Y tế Việt Nam (2015).Thành phần Thực phẩm Việt Nam.NXB Y học.Hà Nội.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .addToStart(const SizedBox(height: 8.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ].divide(const SizedBox(height: 8.0)).addToEnd(const SizedBox(height: 16.0)),
    );
  }
}
