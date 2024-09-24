import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_header/display_item_header_widget.dart';
import 'bai_viet_tuan_widget.dart' show BaiVietTuanWidget;
import 'package:flutter/material.dart';

class BaiVietTuanModel extends FlutterFlowModel<BaiVietTuanWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for displayItemHeader component.
  late DisplayItemHeaderModel displayItemHeaderModel;

  @override
  void initState(BuildContext context) {
    displayItemHeaderModel =
        createModel(context, () => DisplayItemHeaderModel());
  }

  @override
  void dispose() {
    displayItemHeaderModel.dispose();
  }
}
