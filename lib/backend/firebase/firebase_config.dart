import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBcohfUOF2Ygx7TQQq5KhJqdJt428XZk6A",
            authDomain: "project-comida-ali-uw2c60.firebaseapp.com",
            projectId: "project-comida-ali-uw2c60",
            storageBucket: "project-comida-ali-uw2c60.appspot.com",
            messagingSenderId: "389305611943",
            appId: "1:389305611943:web:e45b4b6b4898db11b80d82"));
  } else {
    await Firebase.initializeApp();
  }
}
