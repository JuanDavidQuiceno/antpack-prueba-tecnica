import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';

import 'AddressUser.dart';
import 'IconContacto.dart';


class ContactoUser extends StatelessWidget {
  final UserModel user;
  ContactoUser({Key? key, required this.user}) : super(key: key);

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
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contactame', style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold)),
                SizedBox(height: 5.0,),
                AddressUser(icon: Icons.phone_android_rounded, descripcion: user.phone??'Sin telefono',),
                SizedBox(height: 3.0,),
                AddressUser(icon: Icons.email_rounded, descripcion: user.email??'Sin Email',),
                SizedBox(height: 3.0,),
                AddressUser(icon: Icons.web_rounded, descripcion: user.website??'Sin sitio Web',),
                SizedBox(height: 3.0,),
              ],
            ),
          ),
          SizedBox(width: 5.0,),
          Expanded(
            flex: 1,
            child: Wrap(
              alignment: WrapAlignment.end,
              // crossAxisAlignment: WrapCrossAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){

                  },
                  child: IconContacto(icon: Icons.phone_android_rounded,)
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: IconContacto(icon: Icons.email_rounded,)
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: IconContacto(icon: Icons.web_rounded,)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}