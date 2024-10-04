import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/tham_khao_thuc_don/danh_sach_mon_an/danh_sach_mon_an_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'thuc_don_mau_model.dart';
export 'thuc_don_mau_model.dart';

class ThucDonMauWidget extends StatefulWidget {
  const ThucDonMauWidget({
    super.key,
    required this.menuId,
    required this.menuName,
    required this.menuSaved,
  });

  final String? menuId;
  final String? menuName;
  final List<String>? menuSaved;

  @override
  State<ThucDonMauWidget> createState() => _ThucDonMauWidgetState();
}

class _ThucDonMauWidgetState extends State<ThucDonMauWidget> {
  late ThucDonMauModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThucDonMauModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: FFAppState().meal(
        uniqueQueryKey: valueOrDefault<String>(
          widget.menuId,
          '0',
        ),
        requestFn: () => PolabyGroup.apiV1MealsGETCall.call(
          menuId: widget.menuId,
          isDeleted: false,
          orderByDescending: true,
          order: 'name',
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
        final containerApiV1MealsGETResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
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
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.menuName,
                          'Thực đơn 1',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (currentUserUid != '') {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.apiResultj98 = await PolabyGroup
                                        .apiV1MenusUserMenusPOSTCall
                                        .call(
                                      userId: currentUserUid,
                                      menuId: widget.menuId,
                                    );

                                    if ((_model.apiResultj98?.succeeded ??
                                        true)) {
                                      await Future.wait([
                                        Future(() async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Lưu thực đơn'),
                                                content: const Text(
                                                    'Đã lưu thực đơn thành công'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Đồng ý'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }),
                                        Future(() async {
                                          FFAppState().isMenuSaved = true;
                                          safeSetState(() {});
                                        }),
                                      ]);
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    'Lưu trữ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                );
                              } else {
                                return Icon(
                                  Icons.check_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ]
                        .addToStart(const SizedBox(width: 8.0))
                        .addToEnd(const SizedBox(width: 8.0)),
                  ),
                ]
                    .divide(const SizedBox(height: 16.0))
                    .addToStart(const SizedBox(height: 4.0)),
              ),
              SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        final eachMeal = PolabyGroup.apiV1MealsGETCall
                                .meals(
                                  containerApiV1MealsGETResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];
                        if (eachMeal.isEmpty) {
                          return const Center(
                            child: SizedBox(
                              height: 250.0,
                              child: EmptyWidget(),
                            ),
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
                          itemCount: eachMeal.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                          itemBuilder: (context, eachMealIndex) {
                            final eachMealItem = eachMeal[eachMealIndex];
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
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.95,
                                          child: DanhSachMonAnWidget(
                                            mealId: getJsonField(
                                              eachMealItem,
                                              r'''$.id''',
                                            ).toString(),
                                            mealName: getJsonField(
                                              eachMealItem,
                                              r'''$.name''',
                                            ).toString(),
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                                  if (MealStruct.maybeFromMap(
                                                              eachMealItem)
                                                          ?.name ==
                                                      'Breakfast')
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Frame_6.svg',
                                                        width: 64.0,
                                                        height: 64.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if ((MealStruct.maybeFromMap(eachMealItem)?.name == 'Snack1') ||
                                                      (MealStruct.maybeFromMap(
                                                                  eachMealItem)
                                                              ?.name ==
                                                          'Snack2') ||
                                                      (MealStruct.maybeFromMap(
                                                                  eachMealItem)
                                                              ?.name ==
                                                          'Snack3') ||
                                                      (MealStruct.maybeFromMap(
                                                                  eachMealItem)
                                                              ?.name ==
                                                          'Snack4'))
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Frame_6_(3).svg',
                                                        width: 64.0,
                                                        height: 64.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (MealStruct.maybeFromMap(
                                                              eachMealItem)
                                                          ?.name ==
                                                      'Dinner')
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Frame_6_(2).svg',
                                                        width: 64.0,
                                                        height: 64.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (MealStruct.maybeFromMap(
                                                              eachMealItem)
                                                          ?.name ==
                                                      'Lunch')
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Frame_6_(1).svg',
                                                        width: 64.0,
                                                        height: 64.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        functions
                                                            .getMealNameInVietnamese(
                                                                getJsonField(
                                                          eachMealItem,
                                                          r'''$.name''',
                                                        ).toString()),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        '${(String var1) {
                                                          return double
                                                                      .tryParse(
                                                                          var1)
                                                                  ?.toStringAsFixed(
                                                                      1) ??
                                                              '0.0';
                                                        }(getJsonField(
                                                          eachMealItem,
                                                          r'''$.kcal''',
                                                        ).toString())} kcal',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
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
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 16.0)),
          ),
        );
      },
    );
  }
}
