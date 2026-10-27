import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCm0uJ4_uRBcZdocuPnA1Cg5avSGC3AwTg",
            authDomain: "shift-cover-t2hgk4.firebaseapp.com",
            projectId: "shift-cover-t2hgk4",
            storageBucket: "shift-cover-t2hgk4.firebasestorage.app",
            messagingSenderId: "393462876720",
            appId: "1:393462876720:web:eafccde04bef732f56bbf5"));
  } else {
    await Firebase.initializeApp();
  }
}
