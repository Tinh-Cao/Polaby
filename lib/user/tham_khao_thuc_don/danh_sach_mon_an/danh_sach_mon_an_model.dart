import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'danh_sach_mon_an_widget.dart' show DanhSachMonAnWidget;
import 'package:flutter/material.dart';

class DanhSachMonAnModel extends FlutterFlowModel<DanhSachMonAnWidget> {
  ///  Local state fields for this component.

  String? mealId;

  /// Query cache managers for this widget.

  final _getMealManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getMeal({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getMealManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetMealCache() => _getMealManager.clear();
  void clearGetMealCacheKey(String? uniqueKey) =>
      _getMealManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearGetMealCache();
  }
}
