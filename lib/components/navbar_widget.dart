import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    required this.page,
    required this.role,
    required this.currentPage,
  });

  final String? page;
  final String? role;
  final String? currentPage;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

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
        if (widget.role == 'User')
          Container(
            height: 48.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'trang_chu',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'home')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: widget.page == 'home'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 22.0,
                            ),
                            Text(
                              'Trang chủ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'home'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.currentPage == 'home') {
                      context.goNamed(
                        'lich',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    } else {
                      context.goNamed(
                        'lich',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'calendar')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: widget.page == 'calendar'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Lịch',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'calendar'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if ((widget.currentPage == 'home') ||
                        (widget.currentPage == 'calendar')) {
                      context.goNamed(
                        'cong_dong',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    } else {
                      context.goNamed(
                        'cong_dong',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'community')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.people_outline_rounded,
                              color: widget.page == 'community'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Cộng đồng',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'community'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if ((widget.currentPage == 'home') ||
                        (widget.currentPage == 'calendar') ||
                        (widget.currentPage == 'community')) {
                      context.goNamed(
                        'ghi_chu',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    } else {
                      context.goNamed(
                        'ghi_chu',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'note')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.edit_note_rounded,
                              color: widget.page == 'note'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Ghi chú',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'note'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'tai_khoan',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'account')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              color: widget.page == 'account'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Tài khoản',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'account'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (widget.role == 'Expert')
          Container(
            height: 48.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'cong_dong_chuyen_gia',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'community')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.people_outline_rounded,
                              color: widget.page == 'community'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Cộng đồng',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'community'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.currentPage == 'home') {
                      context.goNamed(
                        'thong_bao',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    } else {
                      context.goNamed(
                        'thong_bao',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'notification')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.notifications_none_rounded,
                              color: widget.page == 'notification'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Thông báo',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'notification'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'chi_tiet_tai_khoan_expert',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 56.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.page == 'account')
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              color: widget.page == 'account'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent4,
                              size: 20.0,
                            ),
                            Text(
                              'Tài khoản',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.page == 'account'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent4,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].addToStart(const SizedBox(height: 4.0)),
                        ),
                      ].addToEnd(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
