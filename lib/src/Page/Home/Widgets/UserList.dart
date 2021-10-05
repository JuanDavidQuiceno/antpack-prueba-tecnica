import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';


class UserList extends StatefulWidget {
  final UserModel user;
  UserList({Key? key, required this.user}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('data')
      ],
    );
  }
}