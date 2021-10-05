import 'package:flutter/material.dart';


class LoadingLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/antpack.png', height: MediaQuery.of(context).size.width*0.4),
            SizedBox(height: 20.0,),
            Container(
              width: MediaQuery.of(context).size.width*0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: LinearProgressIndicator(
                  minHeight: 5.0,
                  // value: 0.5,
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Text('Cargando...'),
          ], 
        ),
      ],
    );
  }
}