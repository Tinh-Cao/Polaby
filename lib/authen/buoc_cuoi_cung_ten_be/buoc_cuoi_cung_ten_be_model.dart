import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buoc_cuoi_cung_ten_be_widget.dart' show BuocCuoiCungTenBeWidget;
import 'package:flutter/material.dart';

class BuocCuoiCungTenBeModel extends FlutterFlowModel<BuocCuoiCungTenBeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (/api/v1/authentication/login POST)] action in Button widget.
  ApiCallResponse? loginResult;
  // Stores action output result for [Backend Call - API (/api/v1/accounts/{id}/user PUT)] action in Button widget.
  ApiCallResponse? updateUserResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NoteRecord? noteDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
