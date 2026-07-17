import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB8CsOln7CbNr-DKgtQ2cT2h2WhdXtLD_8",
            authDomain: "proyectoprogramacionmovi-c6375.firebaseapp.com",
            projectId: "proyectoprogramacionmovi-c6375",
            storageBucket: "proyectoprogramacionmovi-c6375.firebasestorage.app",
            messagingSenderId: "435175972947",
            appId: "1:435175972947:web:ad520753f4e2e0148da6a6",
            measurementId: "G-X960SXPN9B"));
  } else {
    await Firebase.initializeApp();
  }
}
