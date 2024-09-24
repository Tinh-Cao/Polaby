import '/components/week_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'tuan_hien_tai_thai_ky_model.dart';
export 'tuan_hien_tai_thai_ky_model.dart';

class TuanHienTaiThaiKyWidget extends StatefulWidget {
  const TuanHienTaiThaiKyWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    required this.height,
    required this.weight,
  });

  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final double? height;
  final double? weight;

  @override
  State<TuanHienTaiThaiKyWidget> createState() =>
      _TuanHienTaiThaiKyWidgetState();
}

class _TuanHienTaiThaiKyWidgetState extends State<TuanHienTaiThaiKyWidget> {
  late TuanHienTaiThaiKyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TuanHienTaiThaiKyModel());

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
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                          widget.height,
                          ParamType.double,
                        ),
                        'weight': serializeParam(
                          widget.weight,
                          ParamType.double,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Tuần thai hiện tại',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Inter',
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                wrapWithModel(
                  model: _model.weekPickerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const WeekPickerWidget(),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'chuc_mung',
                        queryParameters: {
                          'dueDate': serializeParam(
                            functions
                                .calculateDueDateFromCurrentWeeks(
                                    _model.weekPickerModel.weeksCurrentIndex,
                                    _model.weekPickerModel.daysCurrentIndex)
                                ?.toString(),
                            ParamType.String,
                          ),
                          'pregnantWeek': serializeParam(
                            '${_model.weekPickerModel.weeksCurrentIndex.toString()} tuần ${_model.weekPickerModel.daysCurrentIndex.toString()} ngày',
                            ParamType.String,
                          ),
                          'pregnantTime': serializeParam(
                            functions.caculateWeeksAndDaysRe(
                                _model.weekPickerModel.weeksCurrentIndex,
                                _model.weekPickerModel.daysCurrentIndex),
                            ParamType.String,
                          ),
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
                            widget.height,
                            ParamType.double,
                          ),
                          'weight': serializeParam(
                            widget.weight,
                            ParamType.double,
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
                    text: 'Tiếp tục',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
        ),
      ),
    );
  }
}
