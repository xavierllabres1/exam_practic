import 'dart:io';

import 'package:exam_practic/models/models.dart';
import 'package:exam_practic/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recuperar el provider
    final userProvider = Provider.of<UsersProvider>(context);

    //Llista de usuaris
    final usuaris = userProvider.usuaris;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userProvider.nextPage(); // Ni de conya
              },
              icon: const Icon(Icons.next_plan))
        ],
        title: Text('Usuaris'),
      ),
      body: LlistaUsuaris(llistaUsuaris: usuaris),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: Icon(Icons.add),
      ),
    );
  }
}

class LlistaUsuaris extends StatelessWidget {
  final List<User> llistaUsuaris;

  const LlistaUsuaris({super.key, required this.llistaUsuaris});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: llistaUsuaris.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              // Obrim la segona pàgina

              onTap: () => Navigator.pushNamed(
                context,
                'details',
                arguments: llistaUsuaris[index],
              ),
              title: Text(llistaUsuaris[index].firstName +
                  " " +
                  llistaUsuaris[index].lastName),
              subtitle: Text(llistaUsuaris[index].email),
            ),
            Image(
              image: NetworkImage(llistaUsuaris[index].avatar),
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}
