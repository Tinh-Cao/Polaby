import '/components/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ngay_sinh_du_kien_widget.dart' show NgaySinhDuKienWidget;
import 'package:flutter/material.dart';

class NgaySinhDuKienModel extends FlutterFlowModel<NgaySinhDuKienWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for date_picker component.
  late DatePickerModel datePickerModel;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
  }

  @override
  void dispose() {
    datePickerModel.dispose();
  }
}
