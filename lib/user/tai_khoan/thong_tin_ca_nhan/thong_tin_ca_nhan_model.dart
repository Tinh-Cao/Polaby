import '/flutter_flow/flutter_flow_util.dart';
import 'thong_tin_ca_nhan_widget.dart' show ThongTinCaNhanWidget;
import 'package:flutter/material.dart';

class ThongTinCaNhanModel extends FlutterFlowModel<ThongTinCaNhanWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
