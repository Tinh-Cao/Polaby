import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'cong_dong_chuyen_gia_widget.dart' show CongDongChuyenGiaWidget;
import 'package:flutter/material.dart';

class CongDongChuyenGiaModel extends FlutterFlowModel<CongDongChuyenGiaWidget> {
  ///  Local state fields for this page.

  String currentPage = 'community';

  ///  State fields for stateful widgets in this page.

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
