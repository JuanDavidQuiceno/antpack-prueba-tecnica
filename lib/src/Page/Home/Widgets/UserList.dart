import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';
import 'package:prueba_tecnica/src/Page/Home/DetalleUser/widgets/AddressUser.dart';


class UserList extends StatefulWidget {
  final UserModel user;
  UserList({Key? key, required this.user}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'user', arguments: widget.user);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                  // Text(widget.user.name??'No registra Nombre', style: TextStyle(fontSize: 16.0 ,color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(widget.user.name??'No registra Nombre', style: TextStyle(fontSize: 16.0 ,color: Colors.black, fontWeight: FontWeight.bold))
                      ),
                      SizedBox(width: 4.0,),
                      Expanded(
                        flex: 1,
                        child: Text('#${widget.user.id??''}', style: TextStyle(fontSize: 12.0 ,color: Colors.black), textAlign: TextAlign.right,)
                      ),
                      SizedBox(width: 5.0,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Divider(),
                  ),
                  AddressUser(icon: Icons.person_outline_rounded, descripcion: widget.user.username??'Sin UserName'),
                  SizedBox(height: 7.0,),
                  AddressUser(icon: Icons.location_on_outlined, descripcion: '${widget.user.address!.city??'Sin ciudad'} - ${widget.user.address!.suite??'Sin Apartamento'}'),
                  SizedBox(height: 7.0,),
                  AddressUser(icon: Icons.store_mall_directory_rounded, descripcion: widget.user.company!.name??'Sin Empresa'),
                ],
              ),
            ),
            SizedBox(width: 5.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0)/* only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)), */
              ),
              width: 80.0,
              child: Image.asset('assets/image/map.png')
            ),
          ]
        ),
      ),
    );   
  }
}