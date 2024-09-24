import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user/lich/calendar_component/calendar_component_widget.dart';
import 'lich_widget.dart' show LichWidget;
import 'package:flutter/material.dart';

class LichModel extends FlutterFlowModel<LichWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  String currentPage = 'calendar';

  ///  State fields for stateful widgets in this page.

  // Model for calendar_component component.
  late CalendarComponentModel calendarComponentModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    calendarComponentModel =
        createModel(context, () => CalendarComponentModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    calendarComponentModel.dispose();
    navbarModel.dispose();
  }
}
