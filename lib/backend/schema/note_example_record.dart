import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteExampleRecord extends FirestoreRecord {
  NoteExampleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  bool hasIsSelected() => _isSelected != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  void _initializeFields() {
    _isSelected = snapshotData['isSelected'] as bool?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as String?;
    _type = castToType<int>(snapshotData['type']);
    _index = castToType<int>(snapshotData['index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('noteExample');

  static Stream<NoteExampleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoteExampleRecord.fromSnapshot(s));

  static Future<NoteExampleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoteExampleRecord.fromSnapshot(s));

  static NoteExampleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NoteExampleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoteExampleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoteExampleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoteExampleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoteExampleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoteExampleRecordData({
  bool? isSelected,
  String? description,
  String? date,
  int? type,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isSelected': isSelected,
      'description': description,
      'date': date,
      'type': type,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoteExampleRecordDocumentEquality implements Equality<NoteExampleRecord> {
  const NoteExampleRecordDocumentEquality();

  @override
  bool equals(NoteExampleRecord? e1, NoteExampleRecord? e2) {
    return e1?.isSelected == e2?.isSelected &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.index == e2?.index;
  }

  @override
  int hash(NoteExampleRecord? e) => const ListEquality()
      .hash([e?.isSelected, e?.description, e?.date, e?.type, e?.index]);

  @override
  bool isValidKey(Object? o) => o is NoteExampleRecord;
}
