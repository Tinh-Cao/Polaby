import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_ingredient_picker_widget.dart' show FilterIngredientPickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FilterIngredientPickerModel
    extends FlutterFlowModel<FilterIngredientPickerWidget> {
  ///  Local state fields for this component.

  int? type;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in filter_ingredient_picker widget.
  DailyRecord? dailyScheduleCollection;
  // State field(s) for filter widget.
  CarouselController? filterController;
  int filterCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
