import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trimester_picker_widget.dart' show TrimesterPickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrimesterPickerModel extends FlutterFlowModel<TrimesterPickerWidget> {
  ///  Local state fields for this component.

  int? type;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in trimester_picker widget.
  DailyRecord? dailyScheduleCollection;
  // State field(s) for trimester widget.
  CarouselController? trimesterController;
  int trimesterCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
