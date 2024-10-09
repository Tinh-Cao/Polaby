import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_size_widget.dart' show UpdateSizeWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateSizeModel extends FlutterFlowModel<UpdateSizeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '###.#');
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vòng bụng bắt buộc';
    }

    if (!RegExp(
            '^(?:0*(?:50(?:\\.\\d)?|6[1-9](?:\\.\\d)?|[7-9]\\d(?:\\.\\d)?|1[0-3]\\d(?:\\.\\d)?|140(?:\\.0)?)?)\$')
        .hasMatch(val)) {
      return 'Vòng bụng không hợp lệ(gợi ý: 60/060.1)';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (/api/v1/healths/{id} PUT)] action in Button widget.
  ApiCallResponse? apiResultb7y;
  // Stores action output result for [Backend Call - API (/api/v1/healths GET)] action in Button widget.
  ApiCallResponse? healthSizePost;

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
