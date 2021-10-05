import 'PatronBloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{
  static Provider? instancia;

  factory Provider({Key? key, required Widget child}){

    if(instancia==null){
      instancia = new Provider._internal(key: key, child: child);
    }
    return instancia!;
  }
  
  Provider._internal({Key? key, required Widget child})
    : super(key: key, child: child);

  final patronBloc = PatronBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static PatronBloc of ( BuildContext context ){
   return context.dependOnInheritedWidgetOfExactType<Provider>()!.patronBloc;
  } 
}