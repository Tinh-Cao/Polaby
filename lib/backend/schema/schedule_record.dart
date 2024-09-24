import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleRecord extends FirestoreRecord {
  ScheduleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as String?;
    _place = snapshotData['place'] as String?;
    _time = snapshotData['time'] as String?;
    _type = snapshotData['type'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _question = snapshotData['question'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('schedule')
          : FirebaseFirestore.instance.collectionGroup('schedule');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('schedule').doc(id);

  static Stream<ScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleRecord.fromSnapshot(s));

  static Future<ScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduleRecord.fromSnapshot(s));

  static ScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleRecordData({
  String? date,
  String? place,
  String? time,
  String? type,
  int? index,
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'place': place,
      'time': time,
      'type': type,
      'index': index,
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleRecordDocumentEquality implements Equality<ScheduleRecord> {
  const ScheduleRecordDocumentEquality();

  @override
  bool equals(ScheduleRecord? e1, ScheduleRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.place == e2?.place &&
        e1?.time == e2?.time &&
        e1?.type == e2?.type &&
        e1?.index == e2?.index &&
        e1?.question == e2?.question;
  }

  @override
  int hash(ScheduleRecord? e) => const ListEquality()
      .hash([e?.date, e?.place, e?.time, e?.type, e?.index, e?.question]);

  @override
  bool isValidKey(Object? o) => o is ScheduleRecord;
}
