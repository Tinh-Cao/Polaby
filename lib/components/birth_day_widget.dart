import '/components/date_picker_birthday_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'birth_day_model.dart';
export 'birth_day_model.dart';

class BirthDayWidget extends StatefulWidget {
  const BirthDayWidget({super.key});

  @override
  State<BirthDayWidget> createState() => _BirthDayWidgetState();
}

class _BirthDayWidgetState extends State<BirthDayWidget> {
  late BirthDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BirthDayModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().day = _model.datePickerBirthdayModel.daysCurrentIndex;
      FFAppState().month = _model.datePickerBirthdayModel.monthsCurrentIndex;
      FFAppState().year = _model.datePickerBirthdayModel.yearsCurrentIndex;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return wrapWithModel(
      model: _model.datePickerBirthdayModel,
      updateCallback: () => safeSetState(() {}),
      child: const DatePickerBirthdayWidget(),
    );
  }
}
