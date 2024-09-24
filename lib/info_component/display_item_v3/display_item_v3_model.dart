import '/flutter_flow/flutter_flow_util.dart';
import 'display_item_v3_widget.dart' show DisplayItemV3Widget;
import 'package:flutter/material.dart';

class DisplayItemV3Model extends FlutterFlowModel<DisplayItemV3Widget> {
  ///  State fields for stateful widgets in this component.

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
