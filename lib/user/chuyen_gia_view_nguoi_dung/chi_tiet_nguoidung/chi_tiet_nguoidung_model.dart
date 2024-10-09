import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chi_tiet_nguoidung_widget.dart' show ChiTietNguoidungWidget;
import 'package:flutter/material.dart';

class ChiTietNguoidungModel extends FlutterFlowModel<ChiTietNguoidungWidget> {
  ///  Local state fields for this page.

  UsersRecord? useId;

  int? numberOfPeople;

  double? ratingAverage;

  bool? setColor;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (/api/v1/accounts/{id} GET)] action in chi_tiet_nguoidung widget.
  ApiCallResponse? apiResult7sx;
  // Stores action output result for [Backend Call - API (ratingsGET)] action in chi_tiet_nguoidung widget.
  ApiCallResponse? apiResultmkt;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
