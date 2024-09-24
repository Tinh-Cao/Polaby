// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LoginInfoStruct extends FFFirebaseStruct {
  LoginInfoStruct({
    String? username,
    String? password,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _password = password,
        super(firestoreUtilData);

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  static LoginInfoStruct fromMap(Map<String, dynamic> data) => LoginInfoStruct(
        username: data['username'] as String?,
        password: data['password'] as String?,
      );

  static LoginInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginInfoStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginInfoStruct &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([username, password]);
}

LoginInfoStruct createLoginInfoStruct({
  String? username,
  String? password,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoginInfoStruct(
      username: username,
      password: password,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoginInfoStruct? updateLoginInfoStruct(
  LoginInfoStruct? loginInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    loginInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoginInfoStructData(
  Map<String, dynamic> firestoreData,
  LoginInfoStruct? loginInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (loginInfo == null) {
    return;
  }
  if (loginInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && loginInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loginInfoData = getLoginInfoFirestoreData(loginInfo, forFieldValue);
  final nestedData = loginInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = loginInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoginInfoFirestoreData(
  LoginInfoStruct? loginInfo, [
  bool forFieldValue = false,
]) {
  if (loginInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(loginInfo.toMap());

  // Add any Firestore field values
  loginInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoginInfoListFirestoreData(
  List<LoginInfoStruct>? loginInfos,
) =>
    loginInfos?.map((e) => getLoginInfoFirestoreData(e, true)).toList() ?? [];
