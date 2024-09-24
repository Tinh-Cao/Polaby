import '/backend/api_requests/api_calls.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chi_tiet_tai_khoan_expert_widget.dart' show ChiTietTaiKhoanExpertWidget;
import 'package:flutter/material.dart';

class ChiTietTaiKhoanExpertModel
    extends FlutterFlowModel<ChiTietTaiKhoanExpertWidget> {
  ///  Local state fields for this page.

  String currentPage = 'account';

  int? numberofPeople;

  double? raitingAverage;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ratingsGET)] action in chi_tiet_tai_khoan_expert widget.
  ApiCallResponse? apiResults78;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navbarModel.dispose();
  }
}
