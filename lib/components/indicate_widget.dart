import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'indicate_model.dart';
export 'indicate_model.dart';

class IndicateWidget extends StatefulWidget {
  const IndicateWidget({super.key});

  @override
  State<IndicateWidget> createState() => _IndicateWidgetState();
}

class _IndicateWidgetState extends State<IndicateWidget> {
  late IndicateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndicateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
