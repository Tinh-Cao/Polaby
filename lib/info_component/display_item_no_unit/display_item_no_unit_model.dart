import '/flutter_flow/flutter_flow_util.dart';
import 'display_item_no_unit_widget.dart' show DisplayItemNoUnitWidget;
import 'package:flutter/material.dart';

class DisplayItemNoUnitModel extends FlutterFlowModel<DisplayItemNoUnitWidget> {
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
