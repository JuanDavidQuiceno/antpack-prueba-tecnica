import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';
import 'package:prueba_tecnica/src/Page/Home/DetalleUser/widgets/AddressUser.dart';


class DatosUser extends StatelessWidget {
  final UserModel user;
  DatosUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10.0, right: 8.0, left: 8.0),
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
                  // Text(widget.user.name??'No registra Nombre', style: TextStyle(fontSize: 16.0 ,color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(user.name??'No registra Nombre', style: TextStyle(fontSize: 16.0 ,color: Colors.black, fontWeight: FontWeight.bold))
                      ),
                      SizedBox(width: 4.0,),
                      Expanded(
                        flex: 1,
                        child: Text('#${user.id??''}', style: TextStyle(fontSize: 12.0 ,color: Colors.black), textAlign: TextAlign.right,)
                      ),
                      SizedBox(width: 5.0,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Divider(),
                  ),
                  AddressUser(icon: Icons.person_outline_rounded, descripcion: user.username??'Sin UserName',),
                  SizedBox(height: 7.0,),
                  AddressUser(icon: Icons.directions_rounded, descripcion: '${user.address!.street} - ${user.address!.suite}'),
                  SizedBox(height: 7.0,),
                  AddressUser(icon: Icons.location_city_rounded, descripcion: user.address!.city),
                  SizedBox(height: 7.0,),
                  AddressUser(icon: Icons.qr_code_2, descripcion: user.address!.zipcode),
                  SizedBox(height: 7.0,),
                ],
              ),
            ),
            SizedBox(width: 5.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(15.0)/* only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)), */
              ),
              width: 60.0,
              child: Icon(Icons.check_circle_rounded, color: Colors.pink.shade600, size: 50.0,)
            ),
          ]
      ),
    );
  }
}