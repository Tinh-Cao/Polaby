import '/flutter_flow/flutter_flow_util.dart';
import 'display_item_for_date_widget.dart' show DisplayItemForDateWidget;
import 'package:flutter/material.dart';

class DisplayItemForDateModel
    extends FlutterFlowModel<DisplayItemForDateWidget> {
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
