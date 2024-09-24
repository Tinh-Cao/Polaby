import '/components/date_picker_birthday_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'birth_day_widget.dart' show BirthDayWidget;
import 'package:flutter/material.dart';

class BirthDayModel extends FlutterFlowModel<BirthDayWidget> {
  ///  Local state fields for this component.

  int? currentDay;

  int? currentMonth;

  int? currentYear;

  ///  State fields for stateful widgets in this component.

  // Model for date_picker_birthday component.
  late DatePickerBirthdayModel datePickerBirthdayModel;

  @override
  void initState(BuildContext context) {
    datePickerBirthdayModel =
        createModel(context, () => DatePickerBirthdayModel());
  }

  @override
  void dispose() {
    datePickerBirthdayModel.dispose();
  }
}
