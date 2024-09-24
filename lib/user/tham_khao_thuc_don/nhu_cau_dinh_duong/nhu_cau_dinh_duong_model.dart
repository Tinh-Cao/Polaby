import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'nhu_cau_dinh_duong_widget.dart' show NhuCauDinhDuongWidget;
import 'package:flutter/material.dart';

class NhuCauDinhDuongModel extends FlutterFlowModel<NhuCauDinhDuongWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (menuUserGET)] action in Container widget.
  ApiCallResponse? menuSaved;

  /// Query cache managers for this widget.

  final _menuManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> menu({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _menuManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMenuCache() => _menuManager.clear();
  void clearMenuCacheKey(String? uniqueKey) =>
      _menuManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearMenuCache();
  }
}
