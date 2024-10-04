import '/backend/api_requests/api_calls.dart';
import '/components/filter_ingredient_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import '/tra_cuu_thuc_don/chi_tiet_dinh_duong/chi_tiet_dinh_duong_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'tra_cuu_dinh_duong_model.dart';
export 'tra_cuu_dinh_duong_model.dart';

class TraCuuDinhDuongWidget extends StatefulWidget {
  const TraCuuDinhDuongWidget({
    super.key,
    String? txtText,
  }) : txtText = txtText ?? 'null';

  final String txtText;

  @override
  State<TraCuuDinhDuongWidget> createState() => _TraCuuDinhDuongWidgetState();
}

class _TraCuuDinhDuongWidgetState extends State<TraCuuDinhDuongWidget> {
  late TraCuuDinhDuongModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TraCuuDinhDuongModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFAFAFA),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  FFAppState().filterState = 0;
                  safeSetState(() {});
                  context.pop();
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.4,
                              child: FilterIngredientPickerWidget(
                                index: FFAppState().filterState,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Text(
                    'Bộ lọc',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Tra cứu dinh dưỡng',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      wrapWithModel(
                        model: _model.displayItemSearchModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const DisplayItemSearchWidget(),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if ((FFAppState().search != '') ||
                                  (FFAppState().filterState > 0)) {
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: PolabyGroup.ingredientSearchGETCall
                                        .call(
                                      order: ' aaaaaaaaaaa',
                                      orderByDescending: false,
                                      isDeleted: false,
                                      search: FFAppState().search,
                                      pageIndex: 1,
                                      pageSize: 100,
                                      foodGroup: FFAppState().filterState >= 1
                                          ? (FFAppState().filterState - 1)
                                              .toString()
                                          : ' ',
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 32.0,
                                            height: 32.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewIngredientSearchGETResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final eachIngredientSearch =
                                              PolabyGroup
                                                      .ingredientSearchGETCall
                                                      .ingredientSearchs(
                                                        listViewIngredientSearchGETResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];

                                          return ListView.separated(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              8.0,
                                              0,
                                              0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                eachIngredientSearch.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder: (context,
                                                eachIngredientSearchIndex) {
                                              final eachIngredientSearchItem =
                                                  eachIngredientSearch[
                                                      eachIngredientSearchIndex];
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.95,
                                                              child:
                                                                  ChiTietDinhDuongWidget(
                                                                kcal: double
                                                                    .tryParse(
                                                                        getJsonField(
                                                                  eachIngredientSearchItem,
                                                                  r'''$.kcal''',
                                                                ).toString()),
                                                                fat: double
                                                                    .tryParse(
                                                                        getJsonField(
                                                                  eachIngredientSearchItem,
                                                                  r'''$.fat''',
                                                                ).toString()),
                                                                protein: double
                                                                    .tryParse(
                                                                        getJsonField(
                                                                  eachIngredientSearchItem,
                                                                  r'''$.protein''',
                                                                ).toString()),
                                                                carbohydrates:
                                                                    double.tryParse(
                                                                        getJsonField(
                                                                  eachIngredientSearchItem,
                                                                  r'''$.carbohydrates''',
                                                                ).toString()),
                                                                nutrients:
                                                                    getJsonField(
                                                                  eachIngredientSearchItem,
                                                                  r'''$.nutrients''',
                                                                  true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    height: 172.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0xFFDBDBDB),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    getJsonField(
                                                                  eachIngredientSearchItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                width: 120.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.foodGroup''',
                                                                  ).toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Năng lượng: ${getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.kcal''',
                                                                  ).toString()}Kcal',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Nước: ${getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.water''',
                                                                  ).toString()}g',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Chất đạm: ${getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.protein''',
                                                                  ).toString()}g',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Chất béo: ${getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.fat''',
                                                                  ).toString()}g',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Chất đường bột: ${getJsonField(
                                                                    eachIngredientSearchItem,
                                                                    r'''$.carbohydrates''',
                                                                  ).toString()}g',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: RefreshIndicator(
                                    key: const Key('RefreshIndicator_0h4p5kaq'),
                                    color: FlutterFlowTheme.of(context).primary,
                                    onRefresh: () async {
                                      safeSetState(() => _model
                                          .listViewPagingController2
                                          ?.refresh());
                                      await _model.waitForOnePageForListView2();
                                    },
                                    child: PagedListView<ApiPagingParams,
                                        dynamic>.separated(
                                      pagingController:
                                          _model.setListViewController2(
                                        (nextPageMarker) => PolabyGroup
                                            .ingredientSearchGETCall
                                            .call(
                                          order: ' aaaaaaaaaaa',
                                          orderByDescending: false,
                                          isDeleted: false,
                                          search: FFAppState().search,
                                          pageIndex: FFAppState()
                                                      .UserInfo
                                                      .data
                                                      .isSubscriptionActive ==
                                                  true
                                              ? (nextPageMarker.nextPageNumber +
                                                  1)
                                              : 1,
                                          pageSize: FFAppState()
                                                      .UserInfo
                                                      .data
                                                      .isSubscriptionActive ==
                                                  true
                                              ? 20
                                              : 100,
                                          foodGroup: FFAppState().filterState >=
                                                  1
                                              ? (FFAppState().filterState - 1)
                                                  .toString()
                                              : ' ',
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        8.0,
                                        0,
                                        0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 8.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<dynamic>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 32.0,
                                            height: 32.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 32.0,
                                            height: 32.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),

                                        itemBuilder: (context, _,
                                            eachIngredientSearchIndex) {
                                          final eachIngredientSearchItem =
                                              _model.listViewPagingController2!
                                                      .itemList![
                                                  eachIngredientSearchIndex];
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.95,
                                                          child:
                                                              ChiTietDinhDuongWidget(
                                                            kcal:
                                                                double.tryParse(
                                                                    getJsonField(
                                                              eachIngredientSearchItem,
                                                              r'''$.kcal''',
                                                            ).toString()),
                                                            fat: double.tryParse(
                                                                getJsonField(
                                                              eachIngredientSearchItem,
                                                              r'''$.fat''',
                                                            ).toString()),
                                                            protein:
                                                                double.tryParse(
                                                                    getJsonField(
                                                              eachIngredientSearchItem,
                                                              r'''$.protein''',
                                                            ).toString()),
                                                            carbohydrates:
                                                                double.tryParse(
                                                                    getJsonField(
                                                              eachIngredientSearchItem,
                                                              r'''$.carbohydrates''',
                                                            ).toString()),
                                                            nutrients:
                                                                getJsonField(
                                                              eachIngredientSearchItem,
                                                              r'''$.nutrients''',
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                height: 180.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  border: Border.all(
                                                    color: const Color(0xFFDBDBDB),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0, 8.0,
                                                          16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                getJsonField(
                                                              eachIngredientSearchItem,
                                                              r'''$.image''',
                                                            ).toString(),
                                                            width: 120.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.foodGroup''',
                                                              ).toString(),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        8.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Năng lượng: ${getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.kcal''',
                                                              ).toString()}Kcal',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Nước: ${getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.water''',
                                                              ).toString()}g',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Chất đạm: ${getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.protein''',
                                                              ).toString()}g',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Chất béo: ${getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.fat''',
                                                              ).toString()}g',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Chất đường bột: ${getJsonField(
                                                                eachIngredientSearchItem,
                                                                r'''$.carbohydrates''',
                                                              ).toString()}g',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 8.0))
                        .addToEnd(const SizedBox(height: 32.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
