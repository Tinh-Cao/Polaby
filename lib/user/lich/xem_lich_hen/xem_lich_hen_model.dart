import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'xem_lich_hen_widget.dart' show XemLichHenWidget;
import 'package:flutter/material.dart';

class XemLichHenModel extends FlutterFlowModel<XemLichHenWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in xem_lich_hen widget.
  DailyRecord? dailyScheduleCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in xem_lich_hen widget.
  ScheduleRecord? schedules;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Query cache managers for this widget.

  final _scheduleValueManager = StreamRequestManager<List<ScheduleRecord>>();
  Stream<List<ScheduleRecord>> scheduleValue({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ScheduleRecord>> Function() requestFn,
  }) =>
      _scheduleValueManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearScheduleValueCache() => _scheduleValueManager.clear();
  void clearScheduleValueCacheKey(String? uniqueKey) =>
      _scheduleValueManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    /// Dispose query cache managers for this widget.

    clearScheduleValueCache();
  }
}
