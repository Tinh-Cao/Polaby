import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tilte" field.
  String? _tilte;
  String get tilte => _tilte ?? '';
  bool hasTilte() => _tilte != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "liekCount" field.
  List<DocumentReference>? _liekCount;
  List<DocumentReference> get liekCount => _liekCount ?? const [];
  bool hasLiekCount() => _liekCount != null;

  // "attachments" field.
  String? _attachments;
  String get attachments => _attachments ?? '';
  bool hasAttachments() => _attachments != null;

  // "isProfessional" field.
  bool? _isProfessional;
  bool get isProfessional => _isProfessional ?? false;
  bool hasIsProfessional() => _isProfessional != null;

  // "visiability" field.
  int? _visiability;
  int get visiability => _visiability ?? 0;
  bool hasVisiability() => _visiability != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "comments" field.
  int? _comments;
  int get comments => _comments ?? 0;
  bool hasComments() => _comments != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _tilte = snapshotData['tilte'] as String?;
    _content = snapshotData['content'] as String?;
    _liekCount = getDataList(snapshotData['liekCount']);
    _attachments = snapshotData['attachments'] as String?;
    _isProfessional = snapshotData['isProfessional'] as bool?;
    _visiability = castToType<int>(snapshotData['visiability']);
    _createDate = snapshotData['createDate'] as DateTime?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _comments = castToType<int>(snapshotData['comments']);
    _imageUrl = snapshotData['imageUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? tilte,
  String? content,
  String? attachments,
  bool? isProfessional,
  int? visiability,
  DateTime? createDate,
  DocumentReference? postUser,
  int? comments,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tilte': tilte,
      'content': content,
      'attachments': attachments,
      'isProfessional': isProfessional,
      'visiability': visiability,
      'createDate': createDate,
      'postUser': postUser,
      'comments': comments,
      'imageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tilte == e2?.tilte &&
        e1?.content == e2?.content &&
        listEquality.equals(e1?.liekCount, e2?.liekCount) &&
        e1?.attachments == e2?.attachments &&
        e1?.isProfessional == e2?.isProfessional &&
        e1?.visiability == e2?.visiability &&
        e1?.createDate == e2?.createDate &&
        e1?.postUser == e2?.postUser &&
        e1?.comments == e2?.comments &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.tilte,
        e?.content,
        e?.liekCount,
        e?.attachments,
        e?.isProfessional,
        e?.visiability,
        e?.createDate,
        e?.postUser,
        e?.comments,
        e?.imageUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
