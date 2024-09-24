import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteDailyRecord extends FirestoreRecord {
  NoteDailyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  bool hasIsSelected() => _isSelected != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isSelected = snapshotData['isSelected'] as bool?;
    _content = snapshotData['content'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('noteDaily')
          : FirebaseFirestore.instance.collectionGroup('noteDaily');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('noteDaily').doc(id);

  static Stream<NoteDailyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoteDailyRecord.fromSnapshot(s));

  static Future<NoteDailyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoteDailyRecord.fromSnapshot(s));

  static NoteDailyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NoteDailyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoteDailyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoteDailyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoteDailyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoteDailyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoteDailyRecordData({
  bool? isSelected,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isSelected': isSelected,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoteDailyRecordDocumentEquality implements Equality<NoteDailyRecord> {
  const NoteDailyRecordDocumentEquality();

  @override
  bool equals(NoteDailyRecord? e1, NoteDailyRecord? e2) {
    return e1?.isSelected == e2?.isSelected && e1?.content == e2?.content;
  }

  @override
  int hash(NoteDailyRecord? e) =>
      const ListEquality().hash([e?.isSelected, e?.content]);

  @override
  bool isValidKey(Object? o) => o is NoteDailyRecord;
}
