import '/components/week_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tuan_hien_tai_thai_ky_widget.dart' show TuanHienTaiThaiKyWidget;
import 'package:flutter/material.dart';

class TuanHienTaiThaiKyModel extends FlutterFlowModel<TuanHienTaiThaiKyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for week_picker component.
  late WeekPickerModel weekPickerModel;

  @override
  void initState(BuildContext context) {
    weekPickerModel = createModel(context, () => WeekPickerModel());
  }

  @override
  void dispose() {
    weekPickerModel.dispose();
  }
}
