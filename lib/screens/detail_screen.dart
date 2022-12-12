import 'package:exam_practic/models/models.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User usuari = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(usuari.firstName + " " + usuari.lastName),
      ),
      body: Column(
        children: [
          Text(usuari.firstName + " " + usuari.lastName),
          Text(usuari.email),
          Image(
            image: NetworkImage(usuari.avatar),
          ),
        ],
      ),
    );
  }
}
