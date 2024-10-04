import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'nang_cap_tai_khoan_model.dart';
export 'nang_cap_tai_khoan_model.dart';

class NangCapTaiKhoanWidget extends StatefulWidget {
  const NangCapTaiKhoanWidget({
    super.key,
    this.value,
  });

  final List<String>? value;

  @override
  State<NangCapTaiKhoanWidget> createState() => _NangCapTaiKhoanWidgetState();
}

class _NangCapTaiKhoanWidgetState extends State<NangCapTaiKhoanWidget> {
  late NangCapTaiKhoanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NangCapTaiKhoanModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
        child: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: SvgPicture.asset(
                              'assets/images/Header_-_Trang_ch.svg',
                              fit: BoxFit.contain,
                            ),
                            allowRotation: false,
                            tag: 'imageTag',
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'imageTag',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/Header_-_Trang_ch.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Hãy nâng cấp tài khoản',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 23.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Mở khóa toàn bộ chức năng Premium bao gồm:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Sử dụng không quảng cáo.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .addToStart(const SizedBox(width: 9.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Gợi ý thực đơn không giới hạn.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .addToStart(const SizedBox(width: 9.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Tra cứu dinh dưỡng.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .addToStart(const SizedBox(width: 9.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Tra cứu độ an toàn thực phẩm.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .addToStart(const SizedBox(width: 9.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'Ghi chú số đo vòng bụng.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .addToStart(const SizedBox(width: 9.0)),
                              ),
                            ].divide(const SizedBox(height: 3.0)),
                          ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ]
                    .divide(const SizedBox(height: 16.0))
                    .addToEnd(const SizedBox(height: 128.0)),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  width: 36.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
