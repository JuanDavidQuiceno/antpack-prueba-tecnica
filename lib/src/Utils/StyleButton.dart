

import 'package:flutter/material.dart';

final ButtonStyle styleElevatedButton = ElevatedButton.styleFrom(textStyle: const TextStyle(color: Colors.white));

ButtonStyle botonesText(double shapeEntrante, Color colorEntrante){
  return ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(shapeEntrante))),
    backgroundColor: MaterialStateProperty.all<Color>(colorEntrante),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0)),
    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
  );
}