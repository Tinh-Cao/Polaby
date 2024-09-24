// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthStruct extends FFFirebaseStruct {
  HealthStruct({
    String? date,
    List<double>? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _value = value,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "value" field.
  List<double>? _value;
  List<double> get value => _value ?? const [];
  set value(List<double>? val) => _value = val;

  void updateValue(Function(List<double>) updateFn) {
    updateFn(_value ??= []);
  }

  bool hasValue() => _value != null;

  static HealthStruct fromMap(Map<String, dynamic> data) => HealthStruct(
        date: data['date'] as String?,
        value: getDataList(data['value']),
      );

  static HealthStruct? maybeFromMap(dynamic data) =>
      data is Map ? HealthStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static HealthStruct fromSerializableMap(Map<String, dynamic> data) =>
      HealthStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        value: deserializeParam<double>(
          data['value'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'HealthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HealthStruct &&
        date == other.date &&
        listEquality.equals(value, other.value);
  }

  @override
  int get hashCode => const ListEquality().hash([date, value]);
}

HealthStruct createHealthStruct({
  String? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HealthStruct(
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HealthStruct? updateHealthStruct(
  HealthStruct? health, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    health
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHealthStructData(
  Map<String, dynamic> firestoreData,
  HealthStruct? health,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (health == null) {
    return;
  }
  if (health.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && health.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final healthData = getHealthFirestoreData(health, forFieldValue);
  final nestedData = healthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = health.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHealthFirestoreData(
  HealthStruct? health, [
  bool forFieldValue = false,
]) {
  if (health == null) {
    return {};
  }
  final firestoreData = mapToFirestore(health.toMap());

  // Add any Firestore field values
  health.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHealthListFirestoreData(
  List<HealthStruct>? healths,
) =>
    healths?.map((e) => getHealthFirestoreData(e, true)).toList() ?? [];
