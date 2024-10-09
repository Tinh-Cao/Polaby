import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'input_health_widget.dart' show InputHealthWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputHealthModel extends FlutterFlowModel<InputHealthWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  final textFieldMask1 = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Bắt buộc';
    }

    if (!RegExp(
            '^(?=.*\\b(?:0?3[0-9]|0?[4-9][0-9]|0?1[0-4][0-9]|0?150)(?:\\.\\d{1})?\\b)(?=.*\\b(?:0?3[0-9]|0?[6-9][0-9]|0?1[0-9]{2}|0?200)(?:\\.\\d{1})?\\b).+\$')
        .hasMatch(val)) {
      return 'Không hợp lệ';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (/api/v1/healths POST)] action in Button widget.
  ApiCallResponse? apiResultb6y;
  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultbt6y;
  // Stores action output result for [Backend Call - API (/api/v1/healths POST)] action in Button widget.
  ApiCallResponse? apiResultb7y;
  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultbty;
  // Stores action output result for [Backend Call - API (/api/v1/healths POST)] action in Button widget.
  ApiCallResponse? apiResultb8y;
  // Stores action output result for [Backend Call - API (/api/v1/healths POST)] action in Button widget.
  ApiCallResponse? apiResultb9y;
  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultb10y;
  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultb11y;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
