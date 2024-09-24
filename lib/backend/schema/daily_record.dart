import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyRecord extends FirestoreRecord {
  DailyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "schedule" field.
  List<DocumentReference>? _schedule;
  List<DocumentReference> get schedule => _schedule ?? const [];
  bool hasSchedule() => _schedule != null;

  // "emotions" field.
  List<DocumentReference>? _emotions;
  List<DocumentReference> get emotions => _emotions ?? const [];
  bool hasEmotions() => _emotions != null;

  // "noteDaily" field.
  List<DocumentReference>? _noteDaily;
  List<DocumentReference> get noteDaily => _noteDaily ?? const [];
  bool hasNoteDaily() => _noteDaily != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  void _initializeFields() {
    _date = snapshotData['date'] as String?;
    _userId = snapshotData['userId'] as String?;
    _schedule = getDataList(snapshotData['schedule']);
    _emotions = getDataList(snapshotData['emotions']);
    _noteDaily = getDataList(snapshotData['noteDaily']);
    _note = snapshotData['note'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Daily');

  static Stream<DailyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyRecord.fromSnapshot(s));

  static Future<DailyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyRecord.fromSnapshot(s));

  static DailyRecord fromSnapshot(DocumentSnapshot snapshot) => DailyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyRecordData({
  String? date,
  String? userId,
  String? note,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'userId': userId,
      'note': note,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyRecordDocumentEquality implements Equality<DailyRecord> {
  const DailyRecordDocumentEquality();

  @override
  bool equals(DailyRecord? e1, DailyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.userId == e2?.userId &&
        listEquality.equals(e1?.schedule, e2?.schedule) &&
        listEquality.equals(e1?.emotions, e2?.emotions) &&
        listEquality.equals(e1?.noteDaily, e2?.noteDaily) &&
        e1?.note == e2?.note;
  }

  @override
  int hash(DailyRecord? e) => const ListEquality().hash(
      [e?.date, e?.userId, e?.schedule, e?.emotions, e?.noteDaily, e?.note]);

  @override
  bool isValidKey(Object? o) => o is DailyRecord;
}
