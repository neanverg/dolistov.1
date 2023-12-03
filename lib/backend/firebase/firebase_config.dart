import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBAXRd9iiNdLgW882yUwNcQhkVIkS3RdEg",
            authDomain: "dolisto-c1b28.firebaseapp.com",
            projectId: "dolisto-c1b28",
            storageBucket: "dolisto-c1b28.appspot.com",
            messagingSenderId: "810006972875",
            appId: "1:810006972875:web:0e4442547dafbf13484e4e",
            measurementId: "G-VH47H8J158"));
  } else {
    await Firebase.initializeApp();
  }
}
