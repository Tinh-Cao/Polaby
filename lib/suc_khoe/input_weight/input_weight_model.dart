import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'input_weight_widget.dart' show InputWeightWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputWeightModel extends FlutterFlowModel<InputWeightWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  final textFieldMask1 = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cân nặng bắt buộc';
    }

    if (!RegExp(
            '^0*(?:30(?:\\.\\d)?|(?:[3-9]\\d|1[0-4]\\d)(?:\\.\\d)?|150(?:\\.0)?)\$')
        .hasMatch(val)) {
      return 'Cân nặng không hợp lệ (gợi ý: 55/055.2)';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  final textFieldMask2 = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cân nặng bắt buộc';
    }

    if (!RegExp(
            '^0*(?:30(?:\\.\\d)?|(?:[3-9]\\d|1[0-4]\\d)(?:\\.\\d)?|150(?:\\.0)?)\$')
        .hasMatch(val)) {
      return 'Cân nặng không hợp lệ (gợi ý: 55/055.2)';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (/api/v1/healths POST)] action in Button widget.
  ApiCallResponse? apiResultb6y;
  // Stores action output result for [Backend Call - API (/api/v1/healths GET)] action in Button widget.
  ApiCallResponse? healthWeightPost;
  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultb7y;
  // Stores action output result for [Backend Call - API (/api/v1/healths GET)] action in Button widget.
  ApiCallResponse? healthWeightUpdate;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
