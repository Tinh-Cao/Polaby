import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'them_ghi_chu_hang_ngay_widget.dart' show ThemGhiChuHangNgayWidget;
import 'package:flutter/material.dart';

class ThemGhiChuHangNgayModel
    extends FlutterFlowModel<ThemGhiChuHangNgayWidget> {
  ///  Local state fields for this component.

  bool isAdd = false;

  bool isSave = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  DailyRecord? daily;
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
