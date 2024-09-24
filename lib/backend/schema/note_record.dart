import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteRecord extends FirestoreRecord {
  NoteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "noteDetail" field.
  List<DocumentReference>? _noteDetail;
  List<DocumentReference> get noteDetail => _noteDetail ?? const [];
  bool hasNoteDetail() => _noteDetail != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _noteDetail = getDataList(snapshotData['noteDetail']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('note');

  static Stream<NoteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoteRecord.fromSnapshot(s));

  static Future<NoteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoteRecord.fromSnapshot(s));

  static NoteRecord fromSnapshot(DocumentSnapshot snapshot) => NoteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoteRecordData({
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoteRecordDocumentEquality implements Equality<NoteRecord> {
  const NoteRecordDocumentEquality();

  @override
  bool equals(NoteRecord? e1, NoteRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        listEquality.equals(e1?.noteDetail, e2?.noteDetail);
  }

  @override
  int hash(NoteRecord? e) =>
      const ListEquality().hash([e?.userId, e?.noteDetail]);

  @override
  bool isValidKey(Object? o) => o is NoteRecord;
}
