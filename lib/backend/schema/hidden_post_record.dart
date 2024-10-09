import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HiddenPostRecord extends FirestoreRecord {
  HiddenPostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isHidden" field.
  bool? _isHidden;
  bool get isHidden => _isHidden ?? false;
  bool hasIsHidden() => _isHidden != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isHidden = snapshotData['isHidden'] as bool?;
    _userId = snapshotData['userId'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('hiddenPost')
          : FirebaseFirestore.instance.collectionGroup('hiddenPost');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('hiddenPost').doc(id);

  static Stream<HiddenPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HiddenPostRecord.fromSnapshot(s));

  static Future<HiddenPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HiddenPostRecord.fromSnapshot(s));

  static HiddenPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HiddenPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HiddenPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HiddenPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HiddenPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HiddenPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHiddenPostRecordData({
  bool? isHidden,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isHidden': isHidden,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class HiddenPostRecordDocumentEquality implements Equality<HiddenPostRecord> {
  const HiddenPostRecordDocumentEquality();

  @override
  bool equals(HiddenPostRecord? e1, HiddenPostRecord? e2) {
    return e1?.isHidden == e2?.isHidden && e1?.userId == e2?.userId;
  }

  @override
  int hash(HiddenPostRecord? e) =>
      const ListEquality().hash([e?.isHidden, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is HiddenPostRecord;
}
