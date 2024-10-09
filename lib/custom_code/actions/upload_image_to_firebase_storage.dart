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

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io'; // Import File
import 'package:path_provider/path_provider.dart';

Future<String> uploadImageToFirebaseStorage(
    FFUploadedFile file, String userId) async {
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      // Tạo tệp tạm thời
      final directory = await getTemporaryDirectory();
      final tempFilePath = '${directory.path}/${file.name}';
      final tempFile = File(tempFilePath);
      await tempFile.writeAsBytes(file.bytes!);

      // Tạo tham chiếu đến vị trí Firebase Storage mong muốn
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageRef = storage.ref().child(
          '$userId/${DateTime.now().millisecondsSinceEpoch}_${file.name}');

      // Tải tệp lên Firebase Storage
      UploadTask uploadTask = storageRef.putFile(tempFile);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

      // Lấy URL download
      final url = await snapshot.ref.getDownloadURL();

      // Xóa tệp tạm thời
      await tempFile.delete();

      return url;
    } else {
      throw Exception('Unsupported platform');
    }
  } catch (e) {
    print('Error uploading image: $e');
    return '';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
