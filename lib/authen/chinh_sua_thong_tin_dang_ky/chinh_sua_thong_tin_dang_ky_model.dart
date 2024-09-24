import '/flutter_flow/flutter_flow_util.dart';
import 'chinh_sua_thong_tin_dang_ky_widget.dart'
    show ChinhSuaThongTinDangKyWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

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
