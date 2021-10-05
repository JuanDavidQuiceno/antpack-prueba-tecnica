import 'package:prueba_tecnica/src/Models/UsersList-Model.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class PatronBloc{

  final _usersController = BehaviorSubject<UsersListModel>();

  //recuperar datos stream =======================############################################################
  Stream<UsersListModel> get userStream => _usersController.stream;


  //insertar valores al strema =======================############################################################
  Function(UsersListModel)  get changeUserSink => _usersController.sink.add;


  //Obtener el ultimo valor ingresado a los stream =======================############################################################
  UsersListModel get dataUser => _usersController.value;
    

  dispose(){
    _usersController.close();
  
  }
}