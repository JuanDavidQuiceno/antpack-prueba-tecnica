import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastGenericos{
  static toastIcon(BuildContext context,  FToast fToast, Color colorToast, IconData iconToast, String textoToast, int tiempoToast) {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: colorToast,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconToast, color: Colors.white),
            SizedBox(width: 12.0),
            Flexible(child: Text(textoToast, style: TextStyle(color: Colors.white))),
          ],
        ),
    );
    // print('===');
    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: tiempoToast),
    );
  }

  static toast(BuildContext context,  FToast fToast, Color colorToast, String textoToast, int tiempoToast) {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: colorToast,
        ),
        child: Text(textoToast, style: TextStyle(color: Colors.white), textAlign: TextAlign.center ,),
    );
    // print('===');
    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: tiempoToast),
    );
  }
}