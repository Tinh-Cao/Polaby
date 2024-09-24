import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item/display_item_widget.dart';
import '/info_component/display_item_for_date/display_item_for_date_widget.dart';
import '/info_component/display_item_no_unit/display_item_no_unit_widget.dart';
import '/info_component/display_item_v2/display_item_v2_widget.dart';
import '/info_component/display_item_v3/display_item_v3_widget.dart';
import 'thong_tin_dang_ky_ca_nhan_widget.dart' show ThongTinDangKyCaNhanWidget;
import 'package:flutter/material.dart';

class ThongTinDangKyCaNhanModel
    extends FlutterFlowModel<ThongTinDangKyCaNhanWidget> {
  ///  Local state fields for this page.

  String? lastName;

  String? firstName;

  DateTime? dateOfBirth;

  double? height;

  double? weight;

  ///  State fields for stateful widgets in this page.

  // Model for displayItem component.
  late DisplayItemModel displayItemModel;
  // Model for displayItemNoUnit component.
  late DisplayItemNoUnitModel displayItemNoUnitModel;
  // Model for displayItemForDate component.
  late DisplayItemForDateModel displayItemForDateModel;
  // Model for displayItemV2 component.
  late DisplayItemV2Model displayItemV2Model;
  // Model for displayItemV3 component.
  late DisplayItemV3Model displayItemV3Model;

  @override
  void initState(BuildContext context) {
    displayItemModel = createModel(context, () => DisplayItemModel());
    displayItemNoUnitModel =
        createModel(context, () => DisplayItemNoUnitModel());
    displayItemForDateModel =
        createModel(context, () => DisplayItemForDateModel());
    displayItemV2Model = createModel(context, () => DisplayItemV2Model());
    displayItemV3Model = createModel(context, () => DisplayItemV3Model());
  }

  @override
  void dispose() {
    displayItemModel.dispose();
    displayItemNoUnitModel.dispose();
    displayItemForDateModel.dispose();
    displayItemV2Model.dispose();
    displayItemV3Model.dispose();
  }
}
