import '/flutter_flow/flutter_flow_util.dart';
import 'date_picker_birthday_widget.dart' show DatePickerBirthdayWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DatePickerBirthdayModel
    extends FlutterFlowModel<DatePickerBirthdayWidget> {
  ///  Local state fields for this component.

  int? curruntDayIndex;

  int? curruntMonthIndex;

  int? curruntYearIndex;

  int? dayAppstate;

  int? monthAppstate;

  ///  State fields for stateful widgets in this component.

  // State field(s) for days widget.
  CarouselController? daysController;
  int daysCurrentIndex = 0;

  // State field(s) for months widget.
  CarouselController? monthsController;
  int monthsCurrentIndex = 0;

  // State field(s) for years widget.
  CarouselController? yearsController;
  int yearsCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
