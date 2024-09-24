// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JsonValueStruct extends FFFirebaseStruct {
  JsonValueStruct({
    int? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        super(firestoreUtilData);

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  static JsonValueStruct fromMap(Map<String, dynamic> data) => JsonValueStruct(
        type: castToType<int>(data['type']),
      );

  static JsonValueStruct? maybeFromMap(dynamic data) => data is Map
      ? JsonValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
      }.withoutNulls;

  static JsonValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      JsonValueStruct(
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'JsonValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JsonValueStruct && type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([type]);
}

JsonValueStruct createJsonValueStruct({
  int? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JsonValueStruct(
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JsonValueStruct? updateJsonValueStruct(
  JsonValueStruct? jsonValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jsonValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJsonValueStructData(
  Map<String, dynamic> firestoreData,
  JsonValueStruct? jsonValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jsonValue == null) {
    return;
  }
  if (jsonValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jsonValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jsonValueData = getJsonValueFirestoreData(jsonValue, forFieldValue);
  final nestedData = jsonValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jsonValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJsonValueFirestoreData(
  JsonValueStruct? jsonValue, [
  bool forFieldValue = false,
]) {
  if (jsonValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jsonValue.toMap());

  // Add any Firestore field values
  jsonValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJsonValueListFirestoreData(
  List<JsonValueStruct>? jsonValues,
) =>
    jsonValues?.map((e) => getJsonValueFirestoreData(e, true)).toList() ?? [];
