import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kiem_tra_mail_widget.dart' show KiemTraMailWidget;
import 'package:flutter/material.dart';

class KiemTraMailModel extends FlutterFlowModel<KiemTraMailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (/api/v1/authentication/email/resend-verification POST)] action in Text widget.
  ApiCallResponse? resentVerifyCode;
  // Stores action output result for [Backend Call - API (/api/v1/authentication/email/verify GET)] action in Button widget.
  ApiCallResponse? verifyEmailResult;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
