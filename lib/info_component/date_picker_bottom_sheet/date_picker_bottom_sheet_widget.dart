import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'date_picker_bottom_sheet_model.dart';
export 'date_picker_bottom_sheet_model.dart';

class DatePickerBottomSheetWidget extends StatefulWidget {
  const DatePickerBottomSheetWidget({super.key});

  @override
  State<DatePickerBottomSheetWidget> createState() =>
      _DatePickerBottomSheetWidgetState();
}

class _DatePickerBottomSheetWidgetState
    extends State<DatePickerBottomSheetWidget> {
  late DatePickerBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet<bool>(
          context: context,
          builder: (context) {
            return ScrollConfiguration(
              behavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown
                },
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: DateTime(1900),
                  initialDateTime: getCurrentTimestamp,
                  maximumDate: DateTime(2050),
                  use24hFormat: false,
                  onDateTimeChanged: (newDateTime) => safeSetState(() {
                    _model.datePicked = newDateTime;
                  }),
                ),
              ),
            );
          });
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
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
