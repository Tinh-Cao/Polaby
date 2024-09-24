// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

// Custom Action Function
Future<void> createNoteDetailsForUser(String? userId) async {
  if (userId == null || userId.isEmpty) {
    print('User ID is null or empty');
    return;
  }
  CollectionReference sourceCollection =
      FirebaseFirestore.instance.collection('noteExample');

  QuerySnapshot noteQuery = await FirebaseFirestore.instance
      .collection('note')
      .where('userId', isEqualTo: userId)
      .get();

  if (noteQuery.docs.isEmpty) {
    print('No note document found for user ID: $userId');
    return;
  }
  DocumentReference userNoteRef = noteQuery.docs.first.reference;
  CollectionReference destinationCollection =
      userNoteRef.collection('noteDetail');

  try {
    QuerySnapshot querySnapshot = await sourceCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var sourceDocument in querySnapshot.docs) {
        Map<String, dynamic> sourceData =
            sourceDocument.data() as Map<String, dynamic>;

        await destinationCollection.add(sourceData);
        print(
            'Document copied successfully to user noteDetail: ${sourceDocument.id}');
      }
    } else {
      print('No documents found in the source collection');
    }
  } catch (e) {
    print('Error copying documents: $e');
  }
}
