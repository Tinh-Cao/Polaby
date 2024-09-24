import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'bai_viet_cua_ban_widget.dart' show BaiVietCuaBanWidget;
import 'package:flutter/material.dart';

class BaiVietCuaBanModel extends FlutterFlowModel<BaiVietCuaBanWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in bai_viet_cua_ban widget.
  UsersRecord? checkMyUser;
  // Model for displayItemSearch component.
  late DisplayItemSearchModel displayItemSearchModel;

  @override
  void initState(BuildContext context) {
    displayItemSearchModel =
        createModel(context, () => DisplayItemSearchModel());
  }

  @override
  void dispose() {
    displayItemSearchModel.dispose();
  }
}
