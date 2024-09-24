import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'them_ghi_chu_widget.dart' show ThemGhiChuWidget;
import 'package:flutter/material.dart';

class ThemGhiChuModel extends FlutterFlowModel<ThemGhiChuWidget> {
  ///  Local state fields for this component.

  String? date;

  int? trimester;

  String? description;

  bool? isCalendar = false;

  bool isSavedCollection = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in them_ghi_chu widget.
  NoteRecord? noteDocument;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - trimester_picker] action in Row widget.
  int? getTrimester;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Bottom Sheet - time_date_picker] action in Row widget.
  String? dateNote;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
