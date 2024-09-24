// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IsSafeStruct extends FFFirebaseStruct {
  IsSafeStruct({
    bool? isSafe,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isSafe = isSafe,
        super(firestoreUtilData);

  // "isSafe" field.
  bool? _isSafe;
  bool get isSafe => _isSafe ?? false;
  set isSafe(bool? val) => _isSafe = val;

  bool hasIsSafe() => _isSafe != null;

  static IsSafeStruct fromMap(Map<String, dynamic> data) => IsSafeStruct(
        isSafe: data['isSafe'] as bool?,
      );

  static IsSafeStruct? maybeFromMap(dynamic data) =>
      data is Map ? IsSafeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'isSafe': _isSafe,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isSafe': serializeParam(
          _isSafe,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IsSafeStruct fromSerializableMap(Map<String, dynamic> data) =>
      IsSafeStruct(
        isSafe: deserializeParam(
          data['isSafe'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'IsSafeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IsSafeStruct && isSafe == other.isSafe;
  }

  @override
  int get hashCode => const ListEquality().hash([isSafe]);
}

IsSafeStruct createIsSafeStruct({
  bool? isSafe,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IsSafeStruct(
      isSafe: isSafe,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IsSafeStruct? updateIsSafeStruct(
  IsSafeStruct? isSafeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    isSafeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIsSafeStructData(
  Map<String, dynamic> firestoreData,
  IsSafeStruct? isSafeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (isSafeStruct == null) {
    return;
  }
  if (isSafeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && isSafeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final isSafeStructData = getIsSafeFirestoreData(isSafeStruct, forFieldValue);
  final nestedData =
      isSafeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = isSafeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIsSafeFirestoreData(
  IsSafeStruct? isSafeStruct, [
  bool forFieldValue = false,
]) {
  if (isSafeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(isSafeStruct.toMap());

  // Add any Firestore field values
  isSafeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIsSafeListFirestoreData(
  List<IsSafeStruct>? isSafeStructs,
) =>
    isSafeStructs?.map((e) => getIsSafeFirestoreData(e, true)).toList() ?? [];
