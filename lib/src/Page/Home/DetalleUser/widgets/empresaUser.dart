import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';

import 'AddressUser.dart';


class EmpresaUser extends StatelessWidget {
  final UserModel user;
  EmpresaUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.pink.shade50,
            blurRadius: 5.0,
            offset: Offset(0.0, 1.0),
            spreadRadius: 3.0
          )
        ]
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.company!.name??'No registra Nombre', style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Divider(),
                  ),
                  Text(user.company!.catchPhrase??'', style: TextStyle(fontSize: 12.0 ,color: Colors.grey,), overflow: TextOverflow.ellipsis, maxLines: 3,),
                  SizedBox(height: 4.0,),
                  Text(user.company!.bs??'No específica Bs', style: TextStyle(fontSize: 12.0 ,color: Colors.grey,), overflow: TextOverflow.ellipsis, maxLines: 3,),
                  
                ],
              ),
            ),
            SizedBox(width: 5.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(15.0)
              ),
              width: 60.0,
              child: Icon(Icons.store_rounded, color: Colors.pink.shade600, size: 50.0,)
            ),
          ]
      ),
    );
  }
}