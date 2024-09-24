import '/flutter_flow/flutter_flow_util.dart';
import 'week_picker_widget.dart' show WeekPickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WeekPickerModel extends FlutterFlowModel<WeekPickerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for weeks widget.
  CarouselController? weeksController;
  int weeksCurrentIndex = 0;

  // State field(s) for days widget.
  CarouselController? daysController;
  int daysCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
