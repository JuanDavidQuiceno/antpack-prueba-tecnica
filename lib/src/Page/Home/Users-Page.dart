import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prueba_tecnica/src/Bloc/PatronBloc.dart';
import 'package:prueba_tecnica/src/Bloc/Provider.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';
import 'package:prueba_tecnica/src/Models/UsersList-Model.dart';
import 'package:prueba_tecnica/src/Provider/Provider-User.dart';
import 'package:prueba_tecnica/src/Widgets/LoadingLogo.dart';
import 'package:prueba_tecnica/src/Widgets/SinResultador.dart';
import 'package:prueba_tecnica/src/Widgets/Toast.dart';

import 'Widgets/UserList.dart';


class UsersPage extends StatefulWidget {

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  final _providerUser = ProviderUser();
  FToast fToast = FToast();
  
  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Users', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _body(context, _bloc)
    );
  }

  Widget _body(BuildContext context, PatronBloc bloc) {
    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot<UsersListModel> snapshot) {
        if(snapshot.hasError){
          return SinResultados();
        }
        if(snapshot.hasData){
          if(snapshot.data!.users!.isNotEmpty){
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView(
                children: [
                  for (UserModel item in snapshot.data!.users!) 
                    UserList(user: item,)
                ],
              ),
            );
          }
          return SinResultados();
        }else{
          return LoadingLogo();
        }
      },
    );
  }

  

  Future<void> onRefresh() async{
    final _bloc = Provider.of(context);
    try {
      await _providerUser.users(context, _bloc);
    } catch (e) {
      ToastGenericos.toastIcon(context, fToast, Colors.grey.shade400, Icons.cloud_off_rounded, 'No logro cargar los datos, intenta nuevamente', 2);
    }
  }
}