import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tao_bai_post_widget.dart' show TaoBaiPostWidget;
import 'package:flutter/material.dart';

class TaoBaiPostModel extends FlutterFlowModel<TaoBaiPostWidget> {
  ///  Local state fields for this component.

  bool isOpen = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  UsersRecord? userID;
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
