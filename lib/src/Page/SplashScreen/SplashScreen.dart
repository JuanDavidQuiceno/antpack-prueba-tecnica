import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_tecnica/src/Bloc/Provider.dart';
import 'package:prueba_tecnica/src/Models/UsersList-Model.dart';
// import 'package:prueba_tecnica/src/Preferences/Preferences-User.dart';
import 'package:prueba_tecnica/src/Provider/Provider-User.dart';
import 'package:prueba_tecnica/src/Utils/StyleButton.dart';
import 'package:flutter/services.dart' show rootBundle;

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  // final _prefs = new PreferencesUser();
  final _providerUser = ProviderUser();
  late Map _data ;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black26,
        statusBarBrightness: Brightness.light
      )
    );
    controller = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    animation = Tween(begin: 0.0, end: 0.7).animate(controller)..addListener(() {
      setState(() {/* the state that has changed here is the animation object’s value*/});
    });
    controller.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: _alertaSalir,
      onWillPop: () async{ 
        await _alertaSalir(context);
        return false;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          // fit: StackFit.expand,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Image.asset('assets/image/antpack.png', height: MediaQuery.of(context).size.width*0.4),
                SizedBox(height: 20.0,),
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: LinearProgressIndicator(
                      minHeight: 5.0,
                      // value: 0.5,
                      value:  animation.value,
                      backgroundColor: Color.fromRGBO(217, 52, 120, 0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _alertaSalir(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context) { 
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          // title: Text('Quieres salir de la apliacación'),
          content: Text('¿Quieres salir de la aplicación?'),
          actions: <Widget>[
            TextButton (
                style: botonesText(10.0, Colors.transparent),
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancelar', style: TextStyle(color: Colors.green),)
              ),
              TextButton(
                style: botonesText(10.0, Colors.red),
                onPressed: () => Navigator.pop(context, true),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Salir', style: TextStyle(color: Colors.white),),
                    Icon(Icons.logout, color: Colors.white,)
                  ],
                )
              ),
          ],
        );
      }
    );
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 2000);
    return new Timer(_duration, navigationPage);
  }

  startTime2() async {
    var _duration = new Duration(milliseconds: 1500);
    return new Timer(_duration, postConsulta);
  }

  void navigationPage() async{
    final _bloc = Provider.of(context);
    try {
      _data = await _providerUser.users(context, _bloc);
      startTime2();
    } catch (e) {
      rootBundle.loadString('assets/data/user.json').then((value) {
        _bloc.changeUserSink(UsersListModel.fromJson([json.decode(value)]));
        // print(_bloc.dataUser.toJson());
      });
      Navigator.of(context).pushNamedAndRemoveUntil('error', (Route<dynamic> route) => false);
    }
  }

  void postConsulta()async{
    try {
      if(_data['ok']){
        controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
        animation = Tween(begin: 0.7, end: 1.0).animate(controller)..addListener(() {
          setState(() {/* the state that has changed here is the animation object’s value*/});
        });
        await controller.forward();
        Navigator.pushReplacementNamed(context, 'users');
      }
    } catch (e) {
      // print('Error de cargar $e');
      Navigator.of(context).pushNamedAndRemoveUntil('error', (Route<dynamic> route) => false);
    }
  }
}