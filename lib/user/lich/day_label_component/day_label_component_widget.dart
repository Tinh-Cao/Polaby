import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'day_label_component_model.dart';
export 'day_label_component_model.dart';

class DayLabelComponentWidget extends StatefulWidget {
  const DayLabelComponentWidget({
    super.key,
    required this.day,
  });

  final String? day;

  @override
  State<DayLabelComponentWidget> createState() =>
      _DayLabelComponentWidgetState();
}

class _DayLabelComponentWidgetState extends State<DayLabelComponentWidget> {
  late DayLabelComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayLabelComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Text(
          valueOrDefault<String>(
            widget.day,
            'null',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: const Color(0xFFBDBDBD),
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
