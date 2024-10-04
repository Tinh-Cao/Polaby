import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/lich/calendar_component/calendar_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lich_model.dart';
export 'lich_model.dart';

class LichWidget extends StatefulWidget {
  const LichWidget({super.key});

  @override
  State<LichWidget> createState() => _LichWidgetState();
}

class _LichWidgetState extends State<LichWidget> {
  late LichModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LichModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Lịch',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.calendarComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CalendarComponentWidget(
                            inputDate: getCurrentTimestamp,
                            onSelectDateAction: (selectedDate) async {
                              _model.selectedDate = selectedDate;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    page: 'calendar',
                    role: FFAppState().UserInfo.data.role,
                    currentPage: _model.currentPage,
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
