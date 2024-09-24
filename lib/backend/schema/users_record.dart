import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "createDate" field.
  String? _createDate;
  String get createDate => _createDate ?? '';
  bool hasCreateDate() => _createDate != null;

  // "isFollowing" field.
  List<DocumentReference>? _isFollowing;
  List<DocumentReference> get isFollowing => _isFollowing ?? const [];
  bool hasIsFollowing() => _isFollowing != null;

  void _initializeFields() {
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _userId = snapshotData['userId'] as String?;
    _role = snapshotData['role'] as String?;
    _createDate = snapshotData['createDate'] as String?;
    _isFollowing = getDataList(snapshotData['isFollowing']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? firstName,
  String? lastName,
  String? userId,
  String? role,
  String? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'role': role,
      'createDate': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.userId == e2?.userId &&
        e1?.role == e2?.role &&
        e1?.createDate == e2?.createDate &&
        listEquality.equals(e1?.isFollowing, e2?.isFollowing);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.userId,
        e?.role,
        e?.createDate,
        e?.isFollowing
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
