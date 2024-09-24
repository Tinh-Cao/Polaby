// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends FFFirebaseStruct {
  UserInfoStruct({
    DataStruct? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  DataStruct? _data;
  DataStruct get data => _data ?? DataStruct();
  set data(DataStruct? val) => _data = val;

  void updateData(Function(DataStruct) updateFn) {
    updateFn(_data ??= DataStruct());
  }

  bool hasData() => _data != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        data: DataStruct.maybeFromMap(data['data']),
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInfoStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

UserInfoStruct createUserInfoStruct({
  DataStruct? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInfoStruct(
      data: data ?? (clearUnsetFields ? DataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInfoStruct? updateUserInfoStruct(
  UserInfoStruct? userInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInfoStructData(
  Map<String, dynamic> firestoreData,
  UserInfoStruct? userInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInfo == null) {
    return;
  }
  if (userInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInfoData = getUserInfoFirestoreData(userInfo, forFieldValue);
  final nestedData = userInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInfoFirestoreData(
  UserInfoStruct? userInfo, [
  bool forFieldValue = false,
]) {
  if (userInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInfo.toMap());

  // Handle nested data for "data" field.
  addDataStructData(
    firestoreData,
    userInfo.hasData() ? userInfo.data : null,
    'data',
    forFieldValue,
  );

  // Add any Firestore field values
  userInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInfoListFirestoreData(
  List<UserInfoStruct>? userInfos,
) =>
    userInfos?.map((e) => getUserInfoFirestoreData(e, true)).toList() ?? [];
