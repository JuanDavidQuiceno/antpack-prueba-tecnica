import 'package:flutter/material.dart';


class AddressUser extends StatelessWidget {
  final IconData icon;
  final String? descripcion;
  AddressUser({Key? key, required this.icon, this.descripcion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey,),
        SizedBox(width: 4.0,),
        Expanded(child: Text(descripcion??'No específica', style: TextStyle(fontSize: 12.0 ,color: Colors.grey,), overflow: TextOverflow.ellipsis, maxLines: 3,)),
      ],
    );
  }
}