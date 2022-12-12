import 'package:exam_practic/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// Cream la classe User Provider per emprar com a gestor d'estats
class UsersProvider extends ChangeNotifier {
  //Varibles d'acces a la API
  String _baseUrl = 'reqres.in';
  String page = '1';

  // Llista que recuperarem de la API
  List<User> usuaris = [];

  //Constructor
  UsersProvider() {
    this.getUsers();
  }

  nextPage() {
    var num = int.parse(page);
    num++;
    page = num.toString();
  }

  getUsers() async {
    //print('getOnDisplayMovies');

    // Variable url on fer la petició
    // usam variable per fer el codi més net.
    var url = Uri.https(_baseUrl, 'api/users', {
      'page': page,
    });

    // Variable de resultat del get
    final result = await http.get(url);

    // Objecte de NowPlayingResponse construit a través del constructor fromJson.
    // al cual se li passa al construnctor el cos (body) del result anterior (de la API)
    // ja que ha de mester un Strig. El body ho és, i no hem de mester la resta de
    // capçaleres que ens retorna la API.
    final userResponse = UserResponse.fromJson(result.body);

    // Omplim la variable de tipus llista declarada abans
    // amb "un getter" del atribut "result" del objecte nowPlayingResponse
    usuaris = userResponse.data;

    // Aquest mètode indica que hi ha hagut canvit i ho notifica a tothom qui
    // empra aquest provider

    notifyListeners();
  }
}
