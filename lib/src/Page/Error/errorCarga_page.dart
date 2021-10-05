import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_tecnica/src/Utils/StyleButton.dart';

class ErrorCargaPage extends StatefulWidget {

  @override
  _ErrorCargaPageState createState() => _ErrorCargaPageState();
}

class _ErrorCargaPageState extends State<ErrorCargaPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        await _alertaSalir();
        return false;
      },
      child: Scaffold(
        // backgroundColor: Colors.orange[300],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5.0,),
                  Image.asset('assets/image/imagen error.png', height: MediaQuery.of(context).size.height*0.40,),
                  Text('Ooops!', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  Text('Tenemos problemas para cargar los datos', textAlign: TextAlign.center),
                  SizedBox(height: 20.0,),
                  Center(
                    child: OutlinedButton(
                      onPressed: (){
                        // final _bloc = Provider.of(context);
                        // print(_bloc.dataUser.toJson());
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushNamedAndRemoveUntil('users', (Route<dynamic> route) => false);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0),),
                        mouseCursor: MaterialStateProperty.all<MouseCursor>(MouseCursor.defer),
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black)),
                      ),       
                      child: Container(
                        // width: MediaQuery.of(context).size.width*0.8,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
                        child: Text('Continuar', style: TextStyle(color: Colors.black, fontSize: 16.0), textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  // Expanded(child: Container(),),
                  SizedBox(height: 5.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _alertaSalir()async{
    await showDialog(
      context: context,
      builder: (BuildContext context) { 
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          // title: Text('Quieres salir de la apliacación'),
          content: Text('¿Quieres salir de la aplicación?'),
          actions: <Widget>[
            TextButton (
              style: botonesText(10.0, Colors.transparent),
              child: Text('Cancelar', style: TextStyle(color: Colors.green),),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              style: botonesText(10.0, Colors.green),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Salir", style: TextStyle(color: Colors.white)),
                  Icon(Icons.logout, color: Colors.white, size: 15.0,),
                ],
              ),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      }
    );
  }
}