import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/info_component/display_item/display_item_widget.dart';
import '/info_component/display_item_for_date/display_item_for_date_widget.dart';
import '/info_component/display_item_no_unit/display_item_no_unit_widget.dart';
import '/info_component/display_item_v2/display_item_v2_widget.dart';
import '/info_component/display_item_v3/display_item_v3_widget.dart';
import 'package:flutter/material.dart';
import 'thong_tin_dang_ky_ca_nhan_model.dart';
export 'thong_tin_dang_ky_ca_nhan_model.dart';

class ThongTinDangKyCaNhanWidget extends StatefulWidget {
  const ThongTinDangKyCaNhanWidget({
    super.key,
    this.lastName,
    this.firstName,
    this.dateOfBirth,
    this.height,
    this.weight,
  });

  final String? lastName;
  final String? firstName;
  final DateTime? dateOfBirth;
  final double? height;
  final double? weight;

  @override
  State<ThongTinDangKyCaNhanWidget> createState() =>
      _ThongTinDangKyCaNhanWidgetState();
}

class _ThongTinDangKyCaNhanWidgetState
    extends State<ThongTinDangKyCaNhanWidget> {
  late ThongTinDangKyCaNhanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThongTinDangKyCaNhanModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: const Color(0x00FFFFFF),
                automaticallyImplyLeading: false,
                actions: const [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Thông tin cá nhân',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Inter',
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'chinh_sua_thong_tin_dang_ky',
                          queryParameters: {
                            'txtTitle': serializeParam(
                              'Họ và tên đệm',
                              ParamType.String,
                            ),
                            'isDate': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isFirstName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isLastName': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                            'isHeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isWeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'date': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      child: wrapWithModel(
                        model: _model.displayItemModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DisplayItemWidget(
                          lastName: widget.lastName,
                          txtTitle: 'Họ và tên đệm',
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'chinh_sua_thong_tin_dang_ky',
                          queryParameters: {
                            'txtTitle': serializeParam(
                              'Tên',
                              ParamType.String,
                            ),
                            'isDate': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isFirstName': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                            'isLastName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isHeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isWeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'date': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: wrapWithModel(
                        model: _model.displayItemNoUnitModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DisplayItemNoUnitWidget(
                          txtTitle: 'Tên của bạn',
                          value: widget.firstName,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'chinh_sua_thong_tin_dang_ky',
                          queryParameters: {
                            'txtTitle': serializeParam(
                              'Ngày sinh',
                              ParamType.String,
                            ),
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'isDate': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                            'isFirstName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isLastName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isHeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isWeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'date': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      child: wrapWithModel(
                        model: _model.displayItemForDateModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DisplayItemForDateWidget(
                          txtTitle: 'Ngày sinh của bạn',
                          value: widget.dateOfBirth?.toString(),
                          date: widget.dateOfBirth,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'chinh_sua_thong_tin_dang_ky',
                          queryParameters: {
                            'txtTitle': serializeParam(
                              'Chiều cao',
                              ParamType.String,
                            ),
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'isDate': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isHeight': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                            'isFirstName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isLastName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isWeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'date': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      child: wrapWithModel(
                        model: _model.displayItemV2Model,
                        updateCallback: () => safeSetState(() {}),
                        child: DisplayItemV2Widget(
                          txtTitle: 'Chiều cao',
                          value: widget.height?.toString(),
                          unit: 'cm',
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'chinh_sua_thong_tin_dang_ky',
                          queryParameters: {
                            'txtTitle': serializeParam(
                              'Cân nặng',
                              ParamType.String,
                            ),
                            'lastName': serializeParam(
                              widget.lastName,
                              ParamType.String,
                            ),
                            'isDate': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isWeight': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                            'isFirstName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isLastName': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isHeight': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'firstName': serializeParam(
                              widget.firstName,
                              ParamType.String,
                            ),
                            'height': serializeParam(
                              widget.height,
                              ParamType.double,
                            ),
                            'weight': serializeParam(
                              widget.weight,
                              ParamType.double,
                            ),
                            'date': serializeParam(
                              widget.dateOfBirth,
                              ParamType.DateTime,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      child: wrapWithModel(
                        model: _model.displayItemV3Model,
                        updateCallback: () => safeSetState(() {}),
                        child: DisplayItemV3Widget(
                          txtTitle: 'Cân nặng trước sinh',
                          value: widget.weight?.toString(),
                          unit: 'kg',
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((widget.lastName == null ||
                                    widget.lastName == '') ||
                                (widget.firstName == null ||
                                    widget.firstName == '') ||
                                (widget.dateOfBirth == null) ||
                                (widget.height == null) ||
                                (widget.weight == null)) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Thông tin cá nhân'),
                                    content: const Text('Hãy nhập đầy đủ thông tin'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Đồng ý'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              context.pushNamed(
                                'thoi_gian_mang_thai',
                                queryParameters: {
                                  'firstName': serializeParam(
                                    widget.firstName,
                                    ParamType.String,
                                  ),
                                  'lastName': serializeParam(
                                    widget.lastName,
                                    ParamType.String,
                                  ),
                                  'dateOfBirth': serializeParam(
                                    widget.dateOfBirth,
                                    ParamType.DateTime,
                                  ),
                                  'height': serializeParam(
                                    double.tryParse(_model.displayItemV2Model
                                        .textController.text),
                                    ParamType.double,
                                  ),
                                  'weight': serializeParam(
                                    double.tryParse(_model.displayItemV3Model
                                        .textController.text),
                                    ParamType.double,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            }
                          },
                          text: 'Tiếp tục',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
