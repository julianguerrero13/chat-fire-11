import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Controlchat extends GetxController {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> crearchat(Map<String, dynamic> datos) async {
    await _db.collection('c').doc().set(datos).catchError((e) {});
  }

  Stream<QuerySnapshot> leerChat(){
    Stream<QuerySnapshot<Map<String, dynamic>>> listado =
    _db.collection('c').orderBy("fecha", descending: true).snapshots();

    return listado;
  }
}
