import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCUKzM_2qT2ubfY4cmuFUijesEGRqoaMSI",
            authDomain: "polaby-tuiq67.firebaseapp.com",
            projectId: "polaby-tuiq67",
            storageBucket: "polaby-tuiq67.appspot.com",
            messagingSenderId: "4060679862",
            appId: "1:4060679862:web:b19356df5019cca498a017",
            measurementId: "G-4T0RYZZZF0"));
  } else {
    await Firebase.initializeApp();
  }
}
