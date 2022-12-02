import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebafire/domain/controller/controluser.dart';
import 'package:pruebafire/ui/app.dart';

import 'domain/controlchat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAl56hxi1ZsvgNhWbNGGhH0Enn0Bib9qYk",
              authDomain: "chat-fire-5a34e.firebaseapp.com",
              projectId: "chat-fire-5a34e",
              storageBucket: "chat-fire-5a34e.appspot.com",
              messagingSenderId: "538730914177",
              appId: "1:538730914177:web:e18925a2b5916d5073c880"))
      : await Firebase.initializeApp();
  Get.put(Controlchat());
  Get.put(ControlAuthFirebase());
  runApp(const App());
}
