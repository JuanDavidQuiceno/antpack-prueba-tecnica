
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser{
  //patron singleton maneja preferencias unicas
  static final PreferencesUser _instancia = PreferencesUser._internal();

  factory PreferencesUser(){
    return _instancia;
  }
  late SharedPreferences _prefs;
  // //final patron single
  PreferencesUser._internal();

  // void get newMethod => PreferenciasUsuario;

  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }

  get getUltimaPagina{return _prefs.getString('ultimaPagina') ?? 'splash';}
  set setUltimaPagina(String value){_prefs.setString('ultimaPagina', value);}
}