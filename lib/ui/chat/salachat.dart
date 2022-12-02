import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebafire/domain/controlchat.dart';

import '../../domain/controller/controluser.dart';
import 'mensaje.dart';

class Salachat extends StatefulWidget {
  const Salachat({super.key});

  @override
  State<Salachat> createState() => _SalachatState();
}

class _SalachatState extends State<Salachat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mensaje = TextEditingController();
    ControlAuthFirebase ca = Get.find(); //
    Controlchat cc = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat grupal 11. ${ca.emailf}'),
        actions: [
          IconButton(
              onPressed: () {
                ca.reiniciar().then((value) => Get.offAllNamed('/login'));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Expanded(child: Mensajes()),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: mensaje,
                    decoration:
                        const InputDecoration(hintText: 'Ingresa un mensaje'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (mensaje.text.isNotEmpty) {
                        final datos = {
                          'email': ca.emailf,
                          'fecha': DateTime.now(),
                          'mensaje': mensaje.text
                        };
                        cc.crearchat(datos);
                        mensaje.clear();
                      }
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
