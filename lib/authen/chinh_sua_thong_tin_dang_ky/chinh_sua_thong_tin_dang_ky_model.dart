import '/flutter_flow/flutter_flow_util.dart';
import 'chinh_sua_thong_tin_dang_ky_widget.dart'
    show ChinhSuaThongTinDangKyWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ChinhSuaThongTinDangKyModel
    extends FlutterFlowModel<ChinhSuaThongTinDangKyWidget> {
  ///  Local state fields for this page.

  String? firstName;

  double? displayNumberValue;

  DateTime? displayDate;

  String? lastName;

  double? height;

  double? weight;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Họ và tên đệm bắt buộc';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Tên bắt buộc';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  final textFieldMask3 = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Chiều cao bắt buộc';
    }

    if (!RegExp('^(?:120(?:\\.[0-9])?|1[2-9]\\d(?:\\.\\d)?|250(?:\\.0)?)\$')
        .hasMatch(val)) {
      return 'Chiều cao không hợp lệ (gợi ý: 121/121.2)';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  final textFieldMask4 = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cân nặng bắt buộc';
    }

    if (!RegExp(
            '^(?:0?30(?:\\.[0-9])?|0?(?:[3-9]\\d|1[0-4]\\d)(?:\\.\\d)?|0?150(?:\\.0)?)\$')
        .hasMatch(val)) {
      return 'Cân nặng không hợp lệ (gợi ý: 55/055.2)';
    }
    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
