import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebafire/ui/autenticaciones/login.dart';
import 'package:pruebafire/ui/chat/salachat.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'chat Fire',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        debugShowCheckedModeBanner: false,
        home: const Login(),
        routes: {
          '/login': (context) => const Login(),
          '/chat': (context) => const Salachat()
        });
  }
}
