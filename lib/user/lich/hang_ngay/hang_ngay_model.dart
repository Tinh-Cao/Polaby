import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/user/lich/health_daily_value/health_daily_value_widget.dart';
import 'hang_ngay_widget.dart' show HangNgayWidget;
import 'package:flutter/material.dart';

class HangNgayModel extends FlutterFlowModel<HangNgayWidget> {
  ///  Local state fields for this component.

  int? intSizeData;

  bool isSaved = false;

  List<NoteRecord> noteValue = [];
  void addToNoteValue(NoteRecord item) => noteValue.add(item);
  void removeFromNoteValue(NoteRecord item) => noteValue.remove(item);
  void removeAtIndexFromNoteValue(int index) => noteValue.removeAt(index);
  void insertAtIndexInNoteValue(int index, NoteRecord item) =>
      noteValue.insert(index, item);
  void updateNoteValueAtIndex(int index, Function(NoteRecord) updateFn) =>
      noteValue[index] = updateFn(noteValue[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in hang_ngay widget.
  DailyRecord? dailyCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in hang_ngay widget.
  EmotionRecord? emotionDefault;
  // Stores action output result for [Backend Call - Create Document] action in hang_ngay widget.
  EmotionRecord? emotionCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in hang_ngay widget.
  EmotionRecord? getEmotionCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in hang_ngay widget.
  DailyRecord? newDailyCollection;
  // Model for health_daily_value component.
  late HealthDailyValueModel healthDailyValueModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  int? numberOfSchedule;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController3;
  List<String>? get choiceChipsValues3 => choiceChipsValueController3?.value;
  set choiceChipsValues3(List<String>? val) =>
      choiceChipsValueController3?.value = val;

  @override
  void initState(BuildContext context) {
    healthDailyValueModel = createModel(context, () => HealthDailyValueModel());
  }

  @override
  void dispose() {
    healthDailyValueModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
