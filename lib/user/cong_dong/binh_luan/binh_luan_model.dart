import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'binh_luan_widget.dart' show BinhLuanWidget;
import 'package:flutter/material.dart';

class BinhLuanModel extends FlutterFlowModel<BinhLuanWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Image widget.
  UsersRecord? addUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
