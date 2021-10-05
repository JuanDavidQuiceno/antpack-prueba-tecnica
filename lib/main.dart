import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prueba_tecnica/src/Bloc/Provider.dart';
import 'package:prueba_tecnica/src/Preferences/Preferences-User.dart';

import 'src/Page/Error/errorCarga_page.dart';
import 'src/Page/Home/Users-Page.dart';
import 'src/Page/SplashScreen/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferencesUser();
  await prefs.initPrefs();

  //============= Orientacion vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba Técnica',
        initialRoute: 'splash',
        home: SplashScreen(),
        routes: {
          'splash' : (BuildContext context) => SplashScreen(),
          'users' : (BuildContext context) => UsersPage(),
          'error' : (BuildContext context) => ErrorCargaPage(),
        },
        theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryIconTheme: IconThemeData(
            color: Colors.white,
          ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          // ... delegado[s] de localización específicos de la app aquí
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es'), // Español
          const Locale('en'), // Inglés
        ],
      ),
    );
  }
}