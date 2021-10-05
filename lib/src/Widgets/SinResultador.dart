import 'package:flutter/material.dart';


class SinResultados extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/image/empty-box.png', scale: 3),
          SizedBox(height: 5.0,),
          Text('Sin Resultados ', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}