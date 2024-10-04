import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/filter_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'an_toan_thuc_pham_model.dart';
export 'an_toan_thuc_pham_model.dart';

class AnToanThucPhamWidget extends StatefulWidget {
  const AnToanThucPhamWidget({
    super.key,
    this.txtName,
  });

  final String? txtName;

  @override
  State<AnToanThucPhamWidget> createState() => _AnToanThucPhamWidgetState();
}

class _AnToanThucPhamWidgetState extends State<AnToanThucPhamWidget> {
  late AnToanThucPhamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnToanThucPhamModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: const Color(0x00FFFFFF),
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
                  FFAppState().search = '';
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
                      backgroundColor: Colors.transparent,
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
                              child: FilterPickerWidget(
                                index: valueOrDefault<int>(
                                  FFAppState().filterState,
                                  0,
                                ),
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
                          fontWeight: FontWeight.normal,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'An toàn thực phẩm',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 29.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.displayItemSearchModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: const DisplayItemSearchWidget(),
                          ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: Builder(
                          builder: (context) {
                            if ((FFAppState().filterState > 0) ||
                                (FFAppState().search != '')) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: FFAppState().ingredient(
                                      uniqueQueryKey: currentUserUid,
                                      overrideCache: (_model
                                                  .displayItemSearchModel
                                                  .textController
                                                  .text !=
                                              FFAppState().search) ||
                                          (FFAppState().filterState != null),
                                      requestFn: () => PolabyGroup
                                          .apiV1SafefoodsGETCall
                                          .call(
                                        orderByDescending: true,
                                        isDeleted: false,
                                        pageIndex: 1,
                                        pageSize: 20,
                                        search: FFAppState().search,
                                        order: 'aaaaaaaaaaa',
                                        isSafe: () {
                                          if (FFAppState().filterState == 0) {
                                            return ' ';
                                          } else if (FFAppState().filterState ==
                                              1) {
                                            return 'true';
                                          } else {
                                            return 'false';
                                          }
                                        }(),
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewApiV1SafefoodsGETResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final eachSafeFoods =
                                              PolabyGroup.apiV1SafefoodsGETCall
                                                      .safeFoods(
                                                        listViewApiV1SafefoodsGETResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];

                                          return ListView.separated(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              16.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: eachSafeFoods.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, eachSafeFoodsIndex) {
                                              final eachSafeFoodsItem =
                                                  eachSafeFoods[
                                                      eachSafeFoodsIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'khong_an_toan',
                                                        queryParameters: {
                                                          'txtName':
                                                              serializeParam(
                                                            getJsonField(
                                                              eachSafeFoodsItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'isSafed':
                                                              serializeParam(
                                                            getJsonField(
                                                              eachSafeFoodsItem,
                                                              r'''$.isSafe''',
                                                            ),
                                                            ParamType.bool,
                                                          ),
                                                          'description':
                                                              serializeParam(
                                                            getJsonField(
                                                              eachSafeFoodsItem,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'image':
                                                              serializeParam(
                                                            getJsonField(
                                                              eachSafeFoodsItem,
                                                              r'''$.imageUrl''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            eachSafeFoodsItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        if (IsSafeStruct
                                                                .maybeFromMap(
                                                                    getJsonField(
                                                              eachSafeFoodsItem,
                                                              r'''$.isSafe''',
                                                            ))?.isSafe ==
                                                            true)
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Contents_-_Trailing.svg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1.0,
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ].divide(const SizedBox(height: 8.0)),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: PagedListView<ApiPagingParams,
                                      dynamic>.separated(
                                    pagingController:
                                        _model.setListViewController2(
                                      (nextPageMarker) => PolabyGroup
                                          .apiV1SafefoodsGETCall
                                          .call(
                                        orderByDescending: true,
                                        isDeleted: false,
                                        pageIndex: FFAppState()
                                                    .UserInfo
                                                    .data
                                                    .isSubscriptionActive ==
                                                true
                                            ? (nextPageMarker.nextPageNumber +
                                                1)
                                            : 1,
                                        pageSize: 20,
                                        search: FFAppState().search,
                                        order: 'aaaaaaaaaaa',
                                        isSafe: () {
                                          if (FFAppState().filterState == 0) {
                                            return ' ';
                                          } else if (FFAppState().filterState ==
                                              1) {
                                            return 'true';
                                          } else {
                                            return 'false';
                                          }
                                        }(),
                                      ),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      16.0,
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
                                      firstPageProgressIndicatorBuilder: (_) =>
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

                                      itemBuilder:
                                          (context, _, eachSafeFoodsIndex) {
                                        final eachSafeFoodsItem = _model
                                            .listViewPagingController2!
                                            .itemList![eachSafeFoodsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'khong_an_toan',
                                                  queryParameters: {
                                                    'txtName': serializeParam(
                                                      getJsonField(
                                                        eachSafeFoodsItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'isSafed': serializeParam(
                                                      getJsonField(
                                                        eachSafeFoodsItem,
                                                        r'''$.isSafe''',
                                                      ),
                                                      ParamType.bool,
                                                    ),
                                                    'description':
                                                        serializeParam(
                                                      getJsonField(
                                                        eachSafeFoodsItem,
                                                        r'''$.description''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'image': serializeParam(
                                                      getJsonField(
                                                        eachSafeFoodsItem,
                                                        r'''$.imageUrl''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      eachSafeFoodsItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  if (IsSafeStruct.maybeFromMap(
                                                          getJsonField(
                                                        eachSafeFoodsItem,
                                                        r'''$.isSafe''',
                                                      ))?.isSafe ==
                                                      true)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Contents_-_Trailing.svg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 1.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ].divide(const SizedBox(height: 8.0)),
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
                  ].divide(const SizedBox(height: 8.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
