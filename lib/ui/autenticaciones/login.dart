import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebafire/domain/controller/controluser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pswrd = TextEditingController();

  ControlAuthFirebase cf = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Chat fire'),
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 50,
              child: (Image(
                image: NetworkImage(
                    'https://pbs.twimg.com/media/EF4wtcXWsAA4bgi.jpg'),
                fit: BoxFit.contain,
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: pswrd,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    cf.ingresarEmail(email.text, pswrd.text).then((value) {
                      if (cf.emailf != "") {
                        Get.offAllNamed('/chat');
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'Validación de datos',
                          message: 'usuario o contraseña incorrectos',
                          icon: Icon(Icons.warning),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.deepOrange,
                        ));
                      }
                    }).catchError((e) {
                      Get.showSnackbar(GetSnackBar(
                        title: 'Validación de datos',
                        message: '$e',
                        icon: const Icon(Icons.warning),
                        duration: const Duration(seconds: 5),
                        backgroundColor: Colors.deepOrange,
                      ));
                    });
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    cf.registrarEmail(email.text, pswrd.text).then((value) {
                      if (cf.emailf != "") {
                        Get.offAllNamed('/chat');
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'Validación de datos',
                          message: 'usuario o contraseña incorrectos',
                          icon: Icon(Icons.warning),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.orange,
                        ));
                      }
                    }).catchError((e) {
                      Get.showSnackbar(GetSnackBar(
                        title: 'Validación de datos',
                        message: '$e',
                        icon: const Icon(Icons.warning),
                        duration: const Duration(seconds: 5),
                        backgroundColor: Colors.orange,
                      ));
                    });
                  },
                  child: const Text('Registrarse'),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
