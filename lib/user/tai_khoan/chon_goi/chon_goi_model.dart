import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chon_goi_widget.dart' show ChonGoiWidget;
import 'package:flutter/material.dart';

class ChonGoiModel extends FlutterFlowModel<ChonGoiWidget> {
  ///  Local state fields for this component.

  int? type;

  int? price;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? isPurchaseSuccessful;
  // Stores action output result for [Backend Call - API (accountSubscription)] action in Button widget.
  ApiCallResponse? updateSubscription;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
