import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'chinh_sua_thong_tin_thai_ky_widget.dart'
    show ChinhSuaThongTinThaiKyWidget;
import 'package:flutter/material.dart';

class ChinhSuaThongTinThaiKyModel
    extends FlutterFlowModel<ChinhSuaThongTinThaiKyWidget> {
  ///  Local state fields for this page.

  String? firstName;

  double? displayNumberValue;

  DateTime? displayDate;

  String? lastName;

  double? height;

  double? weight;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
