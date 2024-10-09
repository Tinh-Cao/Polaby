import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'dart:async';
import 'tra_cuu_dinh_duong_widget.dart' show TraCuuDinhDuongWidget;
import 'package:flutter/material.dart';

class TraCuuDinhDuongModel extends FlutterFlowModel<TraCuuDinhDuongWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for displayItemSearch component.
  late DisplayItemSearchModel displayItemSearchModel;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;

  @override
  void initState(BuildContext context) {
    displayItemSearchModel =
        createModel(context, () => DisplayItemSearchModel());
  }

  @override
  void dispose() {
    displayItemSearchModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
