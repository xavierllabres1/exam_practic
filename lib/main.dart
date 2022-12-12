import 'package:exam_practic/providers/providers.dart';
import 'package:exam_practic/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

// Canviem el mètode runApp, perqiè enlloc de cridar al la classe MyApp
// (la original) cridi a la AppState (que és a la que hi hem implementat el provider)
// i que al mateix temps, conté MyApp. Així podem haver definit un provider a l'arrel
void main() => runApp(AppState());

// Widget AppState
// per tal de poder contenir un (o varis) providers i es situarà a l'arrel
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna un MultiProvider enlloc d'un Container
    // Tot i que només n'usem un, és per agafar experiencia
    return MultiProvider(
      // Nomes usam el de Movies Providers
      providers: [
        // Es crea la instancia de Movies Provider
        // Es pot crear perque la classe Movies Provider HEREDA ChangeNotifier
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
          // Per forcar a crear la intancia dels providers i veure prints: lazy
          lazy: false,
        )
      ],
      // Aquí es crida al MyApp, però així el retorn del runApp no és sols el MyApp
      // sino que MyApp és un elemente més (un child) del Multiprovider,
      // i a l'arrel tenim el provider i el MyApp
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usuaris',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailScreen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
