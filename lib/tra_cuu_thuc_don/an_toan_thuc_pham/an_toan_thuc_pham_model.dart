import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'an_toan_thuc_pham_widget.dart' show AnToanThucPhamWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AnToanThucPhamModel extends FlutterFlowModel<AnToanThucPhamWidget> {
  ///  Local state fields for this page.

  bool? isSafe;

  ///  State fields for stateful widgets in this page.

  // Model for displayItemSearch component.
  late DisplayItemSearchModel displayItemSearchModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;

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
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
