import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Bloc/PatronBloc.dart';
import 'package:prueba_tecnica/src/Bloc/Provider.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';
import 'package:prueba_tecnica/src/Models/UsersList-Model.dart';
import 'package:prueba_tecnica/src/Utils/Utils.dart';
import 'package:prueba_tecnica/src/Widgets/LoadingLogo.dart';


class UsersPage extends StatefulWidget {

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of(context);
    return Scaffold(
      body: _body(context, _bloc)
    );
  }

  Widget _body(BuildContext context, PatronBloc bloc) {
    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot<UsersListModel> snapshot) {
        if(snapshot.hasError){
          return Container();
        }
        if(snapshot.hasData){
          if(snapshot.data!.users!.isNotEmpty){
            return Container();
          }
          return Container();
        }else{
          return LoadingLogo();
        }
      },
    );
  }
}