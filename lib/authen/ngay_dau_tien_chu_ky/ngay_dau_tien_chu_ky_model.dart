import '/components/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ngay_dau_tien_chu_ky_widget.dart' show NgayDauTienChuKyWidget;
import 'package:flutter/material.dart';

class NgayDauTienChuKyModel extends FlutterFlowModel<NgayDauTienChuKyWidget> {
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
