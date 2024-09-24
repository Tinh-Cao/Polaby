import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_picker_widget.dart' show TimePickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TimePickerModel extends FlutterFlowModel<TimePickerWidget> {
  ///  Local state fields for this component.

  String? time;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in time_picker widget.
  DailyRecord? dailyScheduleCollections;
  // Stores action output result for [Firestore Query - Query a collection] action in time_picker widget.
  ScheduleRecord? specificScheduleV1;
  // Stores action output result for [Firestore Query - Query a collection] action in time_picker widget.
  DailyRecord? dailyScheduleCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  ScheduleRecord? specificSchedule;
  // State field(s) for hours widget.
  CarouselController? hoursController;
  int hoursCurrentIndex = 1;

  // State field(s) for minutes widget.
  CarouselController? minutesController;
  int minutesCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
