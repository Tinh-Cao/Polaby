import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_weight_widget.dart' show UpdateWeightWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateWeightModel extends FlutterFlowModel<UpdateWeightWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
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

  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultb7y;
  // Stores action output result for [Backend Call - API (/api/v1/healths GET)] action in Button widget.
  ApiCallResponse? healthWeightPost;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
