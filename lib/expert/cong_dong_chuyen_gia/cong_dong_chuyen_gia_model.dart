import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'cong_dong_chuyen_gia_widget.dart' show CongDongChuyenGiaWidget;
import 'package:flutter/material.dart';

class CongDongChuyenGiaModel extends FlutterFlowModel<CongDongChuyenGiaWidget> {
  ///  Local state fields for this page.

  String currentPage = 'home';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (/api/v1/accounts/{id} GET)] action in cong_dong_chuyen_gia widget.
  ApiCallResponse? getUserInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in cong_dong_chuyen_gia widget.
  UsersRecord? checkUserExist;
  // Stores action output result for [Backend Call - Create Document] action in cong_dong_chuyen_gia widget.
  UsersRecord? userDocument;
  // Model for displayItemSearch component.
  late DisplayItemSearchModel displayItemSearchModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    displayItemSearchModel =
        createModel(context, () => DisplayItemSearchModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    displayItemSearchModel.dispose();
    navbarModel.dispose();
  }
}
