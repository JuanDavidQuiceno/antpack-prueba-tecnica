import 'package:flutter/material.dart';


class IconContacto extends StatelessWidget {
  final IconData icon;
  IconContacto({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(10.0)/* only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)), */
      ),
      // width: 80.0,
      child: Icon(icon, color: Colors.pink.shade600,),
    );
  }
}