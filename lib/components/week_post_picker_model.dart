import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'week_post_picker_widget.dart' show WeekPostPickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WeekPostPickerModel extends FlutterFlowModel<WeekPostPickerWidget> {
  ///  Local state fields for this component.

  int? type;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in week_post_picker widget.
  DailyRecord? dailyScheduleCollection;
  // State field(s) for weekPost widget.
  CarouselController? weekPostController;
  int weekPostCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
