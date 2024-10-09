import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'cong_dong_widget.dart' show CongDongWidget;
import 'package:flutter/material.dart';

class CongDongModel extends FlutterFlowModel<CongDongWidget> {
  ///  Local state fields for this page.

  String currentPage = 'community';

  bool isLiked = false;

  String? selectedPostId = '';

  bool? isOpenImage = true;

  bool state = false;

  bool? searchActive;

  ///  State fields for stateful widgets in this page.

  // Model for displayItemSearch component.
  late DisplayItemSearchModel displayItemSearchModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
    tabBarController?.dispose();
    navbarModel.dispose();
  }
}
