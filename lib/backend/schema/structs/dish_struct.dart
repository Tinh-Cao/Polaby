// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DishStruct extends FFFirebaseStruct {
  DishStruct({
    String? name,
    String? id,
    double? kcal,
    double? protein,
    double? carbohydrates,
    double? fat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _kcal = kcal,
        _protein = protein,
        _carbohydrates = carbohydrates,
        _fat = fat,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "kcal" field.
  double? _kcal;
  double get kcal => _kcal ?? 0.0;
  set kcal(double? val) => _kcal = val;

  void incrementKcal(double amount) => kcal = kcal + amount;

  bool hasKcal() => _kcal != null;

  // "protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  set protein(double? val) => _protein = val;

  void incrementProtein(double amount) => protein = protein + amount;

  bool hasProtein() => _protein != null;

  // "carbohydrates" field.
  double? _carbohydrates;
  double get carbohydrates => _carbohydrates ?? 0.0;
  set carbohydrates(double? val) => _carbohydrates = val;

  void incrementCarbohydrates(double amount) =>
      carbohydrates = carbohydrates + amount;

  bool hasCarbohydrates() => _carbohydrates != null;

  // "fat" field.
  double? _fat;
  double get fat => _fat ?? 0.0;
  set fat(double? val) => _fat = val;

  void incrementFat(double amount) => fat = fat + amount;

  bool hasFat() => _fat != null;

  static DishStruct fromMap(Map<String, dynamic> data) => DishStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        kcal: castToType<double>(data['kcal']),
        protein: castToType<double>(data['protein']),
        carbohydrates: castToType<double>(data['carbohydrates']),
        fat: castToType<double>(data['fat']),
      );

  static DishStruct? maybeFromMap(dynamic data) =>
      data is Map ? DishStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'kcal': _kcal,
        'protein': _protein,
        'carbohydrates': _carbohydrates,
        'fat': _fat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'kcal': serializeParam(
          _kcal,
          ParamType.double,
        ),
        'protein': serializeParam(
          _protein,
          ParamType.double,
        ),
        'carbohydrates': serializeParam(
          _carbohydrates,
          ParamType.double,
        ),
        'fat': serializeParam(
          _fat,
          ParamType.double,
        ),
      }.withoutNulls;

  static DishStruct fromSerializableMap(Map<String, dynamic> data) =>
      DishStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        kcal: deserializeParam(
          data['kcal'],
          ParamType.double,
          false,
        ),
        protein: deserializeParam(
          data['protein'],
          ParamType.double,
          false,
        ),
        carbohydrates: deserializeParam(
          data['carbohydrates'],
          ParamType.double,
          false,
        ),
        fat: deserializeParam(
          data['fat'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DishStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DishStruct &&
        name == other.name &&
        id == other.id &&
        kcal == other.kcal &&
        protein == other.protein &&
        carbohydrates == other.carbohydrates &&
        fat == other.fat;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, kcal, protein, carbohydrates, fat]);
}

DishStruct createDishStruct({
  String? name,
  String? id,
  double? kcal,
  double? protein,
  double? carbohydrates,
  double? fat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DishStruct(
      name: name,
      id: id,
      kcal: kcal,
      protein: protein,
      carbohydrates: carbohydrates,
      fat: fat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DishStruct? updateDishStruct(
  DishStruct? dish, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dish
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDishStructData(
  Map<String, dynamic> firestoreData,
  DishStruct? dish,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dish == null) {
    return;
  }
  if (dish.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && dish.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dishData = getDishFirestoreData(dish, forFieldValue);
  final nestedData = dishData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dish.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDishFirestoreData(
  DishStruct? dish, [
  bool forFieldValue = false,
]) {
  if (dish == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dish.toMap());

  // Add any Firestore field values
  dish.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDishListFirestoreData(
  List<DishStruct>? dishs,
) =>
    dishs?.map((e) => getDishFirestoreData(e, true)).toList() ?? [];
