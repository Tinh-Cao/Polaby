// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AuthenStruct extends FFFirebaseStruct {
  AuthenStruct({
    String? accessToken,
    String? refreshToken,
    String? accessTokenExpiryTime,
    DocumentReference? users,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accessToken = accessToken,
        _refreshToken = refreshToken,
        _accessTokenExpiryTime = accessTokenExpiryTime,
        _users = users,
        super(firestoreUtilData);

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "refreshToken" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "accessTokenExpiryTime" field.
  String? _accessTokenExpiryTime;
  String get accessTokenExpiryTime => _accessTokenExpiryTime ?? '';
  set accessTokenExpiryTime(String? val) => _accessTokenExpiryTime = val;

  bool hasAccessTokenExpiryTime() => _accessTokenExpiryTime != null;

  // "Users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  set users(DocumentReference? val) => _users = val;

  bool hasUsers() => _users != null;

  static AuthenStruct fromMap(Map<String, dynamic> data) => AuthenStruct(
        accessToken: data['accessToken'] as String?,
        refreshToken: data['refreshToken'] as String?,
        accessTokenExpiryTime: data['accessTokenExpiryTime'] as String?,
        users: data['Users'] as DocumentReference?,
      );

  static AuthenStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuthenStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'accessToken': _accessToken,
        'refreshToken': _refreshToken,
        'accessTokenExpiryTime': _accessTokenExpiryTime,
        'Users': _users,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'accessToken': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'refreshToken': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'accessTokenExpiryTime': serializeParam(
          _accessTokenExpiryTime,
          ParamType.String,
        ),
        'Users': serializeParam(
          _users,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AuthenStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthenStruct(
        accessToken: deserializeParam(
          data['accessToken'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refreshToken'],
          ParamType.String,
          false,
        ),
        accessTokenExpiryTime: deserializeParam(
          data['accessTokenExpiryTime'],
          ParamType.String,
          false,
        ),
        users: deserializeParam(
          data['Users'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'AuthenStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthenStruct &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        accessTokenExpiryTime == other.accessTokenExpiryTime &&
        users == other.users;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accessToken, refreshToken, accessTokenExpiryTime, users]);
}

AuthenStruct createAuthenStruct({
  String? accessToken,
  String? refreshToken,
  String? accessTokenExpiryTime,
  DocumentReference? users,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthenStruct(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessTokenExpiryTime: accessTokenExpiryTime,
      users: users,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthenStruct? updateAuthenStruct(
  AuthenStruct? authen, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authen
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthenStructData(
  Map<String, dynamic> firestoreData,
  AuthenStruct? authen,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authen == null) {
    return;
  }
  if (authen.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && authen.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authenData = getAuthenFirestoreData(authen, forFieldValue);
  final nestedData = authenData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = authen.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthenFirestoreData(
  AuthenStruct? authen, [
  bool forFieldValue = false,
]) {
  if (authen == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authen.toMap());

  // Add any Firestore field values
  authen.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthenListFirestoreData(
  List<AuthenStruct>? authens,
) =>
    authens?.map((e) => getAuthenFirestoreData(e, true)).toList() ?? [];
