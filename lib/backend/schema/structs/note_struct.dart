// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NoteStruct extends FFFirebaseStruct {
  NoteStruct({
    String? value,
    bool? isSelect,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        _isSelect = isSelect,
        super(firestoreUtilData);

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "isSelect" field.
  bool? _isSelect;
  bool get isSelect => _isSelect ?? false;
  set isSelect(bool? val) => _isSelect = val;

  bool hasIsSelect() => _isSelect != null;

  static NoteStruct fromMap(Map<String, dynamic> data) => NoteStruct(
        value: data['value'] as String?,
        isSelect: data['isSelect'] as bool?,
      );

  static NoteStruct? maybeFromMap(dynamic data) =>
      data is Map ? NoteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'isSelect': _isSelect,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'isSelect': serializeParam(
          _isSelect,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        isSelect: deserializeParam(
          data['isSelect'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoteStruct &&
        value == other.value &&
        isSelect == other.isSelect;
  }

  @override
  int get hashCode => const ListEquality().hash([value, isSelect]);
}

NoteStruct createNoteStruct({
  String? value,
  bool? isSelect,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NoteStruct(
      value: value,
      isSelect: isSelect,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NoteStruct? updateNoteStruct(
  NoteStruct? note, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    note
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNoteStructData(
  Map<String, dynamic> firestoreData,
  NoteStruct? note,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (note == null) {
    return;
  }
  if (note.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && note.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final noteData = getNoteFirestoreData(note, forFieldValue);
  final nestedData = noteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = note.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNoteFirestoreData(
  NoteStruct? note, [
  bool forFieldValue = false,
]) {
  if (note == null) {
    return {};
  }
  final firestoreData = mapToFirestore(note.toMap());

  // Add any Firestore field values
  note.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNoteListFirestoreData(
  List<NoteStruct>? notes,
) =>
    notes?.map((e) => getNoteFirestoreData(e, true)).toList() ?? [];
