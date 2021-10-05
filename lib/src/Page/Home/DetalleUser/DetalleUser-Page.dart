import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';

import 'widgets/AppBarDetalle.dart';
import 'widgets/ContactoUser.dart';
import 'widgets/DatosUser.dart';
import 'widgets/empresaUser.dart';


class DetalleUserPage extends StatefulWidget {

  @override
  _DetalleUserPageState createState() => _DetalleUserPageState();
}

class _DetalleUserPageState extends State<DetalleUserPage> {

  late UserModel _data;
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
    _data = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      body: _body(context)
    );
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        AppBarDetalle(user: _data),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              DatosUser(user: _data,),
              ContactoUser(user: _data,),
              EmpresaUser(user: _data),
              SizedBox(height: 100.0,)
            ]
          )
        )
      ],
    );
  }
}