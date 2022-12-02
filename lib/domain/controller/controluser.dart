import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ControlAuthFirebase extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "".obs;
  final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;

  Future<void> reiniciar() async {
    _usuarior.value = "";
    _usuarior.refresh();
  }

  Future<void> registrarEmail(String email, String passwd) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: email, password: passwd);

      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('Contraseña debil');
      } else if (e.code == 'email-already-in-use') {
        _uid.value = "";
        _usuarior.value = "";
        return Future.error('Email ya esta en uso.');
      }
    }
  }

  Future<void> ingresarEmail(String email, String passwd) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: email, password: passwd);
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        return Future.error('Usuario no enocntrado');
      } else if (e.code == 'wrong password') {
        return Future.error('contraseña incorrecta');
      }
    }
  }
}
