import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBQs2BvD9fbPR6xHXWtrJ2B1TLGVUKz8QA",
            authDomain: "energy-58v461.firebaseapp.com",
            projectId: "energy-58v461",
            storageBucket: "energy-58v461.firebasestorage.app",
            messagingSenderId: "365813843613",
            appId: "1:365813843613:web:969585468fa95dbba33674"));
  } else {
    await Firebase.initializeApp();
  }
}
