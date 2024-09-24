import '/backend/api_requests/api_calls.dart';
import '/components/empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/tham_khao_thuc_don/chi_tiet_mon_an/chi_tiet_mon_an_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'danh_sach_mon_an_model.dart';
export 'danh_sach_mon_an_model.dart';

class DanhSachMonAnWidget extends StatefulWidget {
  const DanhSachMonAnWidget({
    super.key,
    required this.mealId,
    required this.mealName,
  });

  final String? mealId;
  final String? mealName;

  @override
  State<DanhSachMonAnWidget> createState() => _DanhSachMonAnWidgetState();
}

class _DanhSachMonAnWidgetState extends State<DanhSachMonAnWidget> {
  late DanhSachMonAnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DanhSachMonAnModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: SingleChildScrollView(
        primary: false,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
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
                    Flexible(
                      child: Text(
                        functions.getMealNameInVietnamese(widget.mealName!),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.0,
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          'Lưu trữ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
            FutureBuilder<ApiCallResponse>(
              future: _model.getMeal(
                requestFn: () => PolabyGroup.apiV1DishesGETCall.call(
                  mealId: widget.mealId,
                  isDeleted: false,
                  orderByDescending: false,
                  order: 'kcal',
                  pageIndex: 1,
                  pageSize: 50,
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
                final listViewApiV1DishesGETResponse = snapshot.data!;

                return Builder(
                  builder: (context) {
                    final eachDish = PolabyGroup.apiV1DishesGETCall
                            .dishes(
                              listViewApiV1DishesGETResponse.jsonBody,
                            )
                            ?.toList() ??
                        [];
                    if (eachDish.isEmpty) {
                      return const SizedBox(
                        height: 250.0,
                        child: EmptyWidget(),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        16.0,
                        0,
                        16.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: eachDish.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                      itemBuilder: (context, eachDishIndex) {
                        final eachDishItem = eachDish[eachDishIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.95,
                                      child: ChiTietMonAnWidget(
                                        dishId: getJsonField(
                                          eachDishItem,
                                          r'''$.id''',
                                        ).toString(),
                                        dishName: getJsonField(
                                          eachDishItem,
                                          r'''$.name''',
                                        ).toString(),
                                        dishImage: getJsonField(
                                          eachDishItem,
                                          r'''$.image''',
                                        ).toString(),
                                        kcal: getJsonField(
                                          eachDishItem,
                                          r'''$.kcal''',
                                        ),
                                        protein: getJsonField(
                                          eachDishItem,
                                          r'''$.protein''',
                                        ),
                                        carbohydrates: getJsonField(
                                          eachDishItem,
                                          r'''$.carbohydrates''',
                                        ),
                                        fat: getJsonField(
                                          eachDishItem,
                                          r'''$.fat''',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl: getJsonField(
                                                    eachDishItem,
                                                    r'''$.image''',
                                                  ).toString(),
                                                  width: 64.0,
                                                  height: 64.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      eachDishItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    getJsonField(
                                                      eachDishItem,
                                                      r'''$.kcal''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(width: 4.0)),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xFFC5C5C7),
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
