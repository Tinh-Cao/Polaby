import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'thoi_gian_mang_thai_model.dart';
export 'thoi_gian_mang_thai_model.dart';

class ThoiGianMangThaiWidget extends StatefulWidget {
  const ThoiGianMangThaiWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
  });

  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final double? height;
  final double? weight;

  @override
  State<ThoiGianMangThaiWidget> createState() => _ThoiGianMangThaiWidgetState();
}

class _ThoiGianMangThaiWidgetState extends State<ThoiGianMangThaiWidget> {
  late ThoiGianMangThaiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThoiGianMangThaiModel());

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
        appBar: AppBar(
          backgroundColor: const Color(0x00FFFFFF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/Login(2).svg',
                            width: 360.0,
                            height: 280.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Thời gian mang thai',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Hãy chọn cách ước lượng thời gian mang thai của bạn. Thông tin này có thể được thay đổi sau bất kỳ lúc nào.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'ngay_dau_tien_chu_ky',
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
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              text: 'Ngày đầu tiên của chu kỳ',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).pink50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'tuan_hien_tai_thai_ky',
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
                                );
                              },
                              text: 'Tuần hiện tại của thai kỳ',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).pink50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'ngay_sinh_du_kien',
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
                                );
                              },
                              text: 'Ngày sinh dự kiến',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).pink50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
