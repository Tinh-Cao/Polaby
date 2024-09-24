import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_date_picker_widget.dart' show TimeDatePickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TimeDatePickerModel extends FlutterFlowModel<TimeDatePickerWidget> {
  ///  Local state fields for this component.

  String? time;

  String? dateNote;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in time_date_picker widget.
  DailyRecord? dailyScheduleCollections;
  // Stores action output result for [Firestore Query - Query a collection] action in time_date_picker widget.
  ScheduleRecord? specificScheduleV1;
  // Stores action output result for [Firestore Query - Query a collection] action in time_date_picker widget.
  DailyRecord? dailyScheduleCollection;
  // State field(s) for hours widget.
  CarouselController? hoursController;
  int hoursCurrentIndex = 1;

  // State field(s) for minutes widget.
  CarouselController? minutesController;
  int minutesCurrentIndex = 1;

  // State field(s) for date widget.
  CarouselController? dateController;
  int dateCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
