import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmotionRecord extends FirestoreRecord {
  EmotionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "emotion" field.
  List<String>? _emotion;
  List<String> get emotion => _emotion ?? const [];
  bool hasEmotion() => _emotion != null;

  // "symptom" field.
  List<String>? _symptom;
  List<String> get symptom => _symptom ?? const [];
  bool hasSymptom() => _symptom != null;

  // "activity" field.
  List<String>? _activity;
  List<String> get activity => _activity ?? const [];
  bool hasActivity() => _activity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _emotion = getDataList(snapshotData['emotion']);
    _symptom = getDataList(snapshotData['symptom']);
    _activity = getDataList(snapshotData['activity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('emotion')
          : FirebaseFirestore.instance.collectionGroup('emotion');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('emotion').doc(id);

  static Stream<EmotionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmotionRecord.fromSnapshot(s));

  static Future<EmotionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmotionRecord.fromSnapshot(s));

  static EmotionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmotionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmotionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmotionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmotionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmotionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmotionRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class EmotionRecordDocumentEquality implements Equality<EmotionRecord> {
  const EmotionRecordDocumentEquality();

  @override
  bool equals(EmotionRecord? e1, EmotionRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.emotion, e2?.emotion) &&
        listEquality.equals(e1?.symptom, e2?.symptom) &&
        listEquality.equals(e1?.activity, e2?.activity);
  }

  @override
  int hash(EmotionRecord? e) =>
      const ListEquality().hash([e?.emotion, e?.symptom, e?.activity]);

  @override
  bool isValidKey(Object? o) => o is EmotionRecord;
}
