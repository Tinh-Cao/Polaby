// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NutrientStruct extends FFFirebaseStruct {
  NutrientStruct({
    String? name,
    String? unit,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _unit = unit,
        _amount = amount,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static NutrientStruct fromMap(Map<String, dynamic> data) => NutrientStruct(
        name: data['name'] as String?,
        unit: data['unit'] as String?,
        amount: castToType<double>(data['amount']),
      );

  static NutrientStruct? maybeFromMap(dynamic data) =>
      data is Map ? NutrientStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'unit': _unit,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static NutrientStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutrientStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NutrientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutrientStruct &&
        name == other.name &&
        unit == other.unit &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([name, unit, amount]);
}

NutrientStruct createNutrientStruct({
  String? name,
  String? unit,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NutrientStruct(
      name: name,
      unit: unit,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NutrientStruct? updateNutrientStruct(
  NutrientStruct? nutrient, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nutrient
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNutrientStructData(
  Map<String, dynamic> firestoreData,
  NutrientStruct? nutrient,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nutrient == null) {
    return;
  }
  if (nutrient.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nutrient.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nutrientData = getNutrientFirestoreData(nutrient, forFieldValue);
  final nestedData = nutrientData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nutrient.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNutrientFirestoreData(
  NutrientStruct? nutrient, [
  bool forFieldValue = false,
]) {
  if (nutrient == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nutrient.toMap());

  // Add any Firestore field values
  nutrient.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNutrientListFirestoreData(
  List<NutrientStruct>? nutrients,
) =>
    nutrients?.map((e) => getNutrientFirestoreData(e, true)).toList() ?? [];
