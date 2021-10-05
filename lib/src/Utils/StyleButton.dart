

import 'package:flutter/material.dart';

final ButtonStyle styleElevatedButton = ElevatedButton.styleFrom(textStyle: const TextStyle(color: Colors.white));

ButtonStyle botonesLocalizacion(){
  return ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
    // textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.red)),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    elevation: MaterialStateProperty.all<double>(4.0),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
  );
}

ButtonStyle styleButtonEdit(double shapeEntrante, double paddingHori, double paddingVer, Color background, double elevation){
  return ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(shapeEntrante))),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: paddingHori, vertical: paddingVer)),
    // textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.red)),
    backgroundColor: MaterialStateProperty.all<Color>(background),
    elevation: MaterialStateProperty.all<double>(elevation),
    foregroundColor: MaterialStateProperty.all<Color>(background),
  );
}

ButtonStyle botonesText(double shapeEntrante, Color colorEntrante){
  return ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(shapeEntrante))),
    backgroundColor: MaterialStateProperty.all<Color>(colorEntrante),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0)),
    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
  );
}