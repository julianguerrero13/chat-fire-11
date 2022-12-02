import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebafire/domain/controlchat.dart';
import 'package:pruebafire/domain/controller/controluser.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  ControlAuthFirebase ca = Get.find();
  Controlchat cc = Get.find();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cc.leerChat(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> resultados) {
        return ListView.builder(
          itemCount: resultados.data!.docs.length,
          itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.grey,
            elevation: 5,
            color: resultados.data!.docs[index].get("email").toString() == ca.emailf
                
                ? const Color.fromARGB(255, 82, 158, 196)
                : const Color.fromARGB(255, 182, 204, 214),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: resultados.data!.docs[index].get("email").toString() == ca.emailf
                    ? const NetworkImage(
                        'https://pbs.twimg.com/media/EF4xKFzXkAEK9kM?format=jpg&name=small')
                    : const NetworkImage(
                        'https://pbs.twimg.com/profile_images/1388382543137976325/T5MRH0hO_400x400.jpg'),
              ),
              title: Text(
                resultados.data!.docs[index].get("mensaje").toString(),
                textAlign: resultados.data!.docs[index].get("email").toString() == ca.emailf
                 ? TextAlign.start : TextAlign.end,
              ),
              subtitle: Text(
                resultados.data!.docs[index].get("email").toString(),
                textAlign: resultados.data!.docs[index].get("email").toString() == ca.emailf 
                ? TextAlign.start : TextAlign.end,
              ),
              
              ),
          );
        });
      }
    );
  }
}
