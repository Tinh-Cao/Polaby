import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/suc_khoe/card_item/card_item_widget.dart';
import '/suc_khoe/health_size/health_size_widget.dart';
import '/suc_khoe/health_size_empty/health_size_empty_widget.dart';
import '/suc_khoe/health_weight/health_weight_widget.dart';
import '/suc_khoe/health_weight_empty/health_weight_empty_widget.dart';
import 'trang_chu_widget.dart' show TrangChuWidget;
import 'package:flutter/material.dart';

class TrangChuModel extends FlutterFlowModel<TrangChuWidget> {
  ///  Local state fields for this page.

  String currentPage = 'home';

  List<dynamic> healSize = [];
  void addToHealSize(dynamic item) => healSize.add(item);
  void removeFromHealSize(dynamic item) => healSize.remove(item);
  void removeAtIndexFromHealSize(int index) => healSize.removeAt(index);
  void insertAtIndexInHealSize(int index, dynamic item) =>
      healSize.insert(index, item);
  void updateHealSizeAtIndex(int index, Function(dynamic) updateFn) =>
      healSize[index] = updateFn(healSize[index]);

  List<dynamic> healthWeightv2 = [];
  void addToHealthWeightv2(dynamic item) => healthWeightv2.add(item);
  void removeFromHealthWeightv2(dynamic item) => healthWeightv2.remove(item);
  void removeAtIndexFromHealthWeightv2(int index) =>
      healthWeightv2.removeAt(index);
  void insertAtIndexInHealthWeightv2(int index, dynamic item) =>
      healthWeightv2.insert(index, item);
  void updateHealthWeightv2AtIndex(int index, Function(dynamic) updateFn) =>
      healthWeightv2[index] = updateFn(healthWeightv2[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (/api/v1/accounts/{id} GET)] action in trang_chu widget.
  ApiCallResponse? getUserInfo;
  // Stores action output result for [Backend Call - API (/api/v1/healths GET)] action in trang_chu widget.
  ApiCallResponse? healthWeight;
  // Stores action output result for [Backend Call - API (/api/v1/healths GET)] action in trang_chu widget.
  ApiCallResponse? healthSize;
  // Stores action output result for [Firestore Query - Query a collection] action in trang_chu widget.
  UsersRecord? checkUserExist;
  // Stores action output result for [Backend Call - Create Document] action in trang_chu widget.
  UsersRecord? userDocument;
  // Model for cardItem component.
  late CardItemModel cardItemModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  DailyRecord? daily;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  DailyRecord? dailyCollection;
  // Model for healthWeight component.
  late HealthWeightModel healthWeightModel;
  // Model for healthWeightEmpty component.
  late HealthWeightEmptyModel healthWeightEmptyModel;
  // Model for healthSize component.
  late HealthSizeModel healthSizeModel;
  // Model for healthSizeEmpty component.
  late HealthSizeEmptyModel healthSizeEmptyModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    cardItemModel = createModel(context, () => CardItemModel());
    healthWeightModel = createModel(context, () => HealthWeightModel());
    healthWeightEmptyModel =
        createModel(context, () => HealthWeightEmptyModel());
    healthSizeModel = createModel(context, () => HealthSizeModel());
    healthSizeEmptyModel = createModel(context, () => HealthSizeEmptyModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    cardItemModel.dispose();
    healthWeightModel.dispose();
    healthWeightEmptyModel.dispose();
    healthSizeModel.dispose();
    healthSizeEmptyModel.dispose();
    navbarModel.dispose();
  }
}
