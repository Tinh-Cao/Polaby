import '/flutter_flow/flutter_flow_util.dart';
import 'display_item_v2_widget.dart' show DisplayItemV2Widget;
import 'package:flutter/material.dart';

class DisplayItemV2Model extends FlutterFlowModel<DisplayItemV2Widget> {
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
