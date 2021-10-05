import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/src/Bloc/PatronBloc.dart';
import 'package:prueba_tecnica/src/Models/UsersList-Model.dart';

class ProviderUser{
  // String _url = 'https://jsonplaceholder.typicode.com/users';

  Future<Map<String, dynamic>> users(BuildContext context, PatronBloc bloc)async{
    final respuesta = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(respuesta.statusCode == 200){
      print(respuesta.body);
      // UserModel user = UserModel.fromJson(json.decode(respuesta.body));
      // List<UserModel> users = List<UserModel>.from(json.decode(respuesta.body).map((x) => UserModel.fromJson(x)));
      UsersListModel users = UsersListModel.fromJson(json.decode(respuesta.body));
      bloc.changeUserSink(users);
      return {'ok': true, 'code': respuesta.statusCode};
    }
    return {'ok': false, 'code': respuesta.statusCode};
  }
}