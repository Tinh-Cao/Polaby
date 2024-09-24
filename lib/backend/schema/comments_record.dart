import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "commentUser" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "commentContent" field.
  String? _commentContent;
  String get commentContent => _commentContent ?? '';
  bool hasCommentContent() => _commentContent != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "commentLike" field.
  List<DocumentReference>? _commentLike;
  List<DocumentReference> get commentLike => _commentLike ?? const [];
  bool hasCommentLike() => _commentLike != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentUser = snapshotData['commentUser'] as DocumentReference?;
    _commentContent = snapshotData['commentContent'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _commentLike = getDataList(snapshotData['commentLike']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? commentUser,
  String? commentContent,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'commentUser': commentUser,
      'commentContent': commentContent,
      'createDate': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentUser == e2?.commentUser &&
        e1?.commentContent == e2?.commentContent &&
        e1?.createDate == e2?.createDate &&
        listEquality.equals(e1?.commentLike, e2?.commentLike);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.commentUser, e?.commentContent, e?.createDate, e?.commentLike]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
