import 'package:prueba_tecnica/src/Models/Users-Model.dart';

class UsersListModel {
  UsersListModel({
    this.users,
  });

  List<UserModel>? users;

  factory UsersListModel.fromJson(json) => UsersListModel(
    users: json == null ? [] : List<UserModel>.from(json.map((x) => UserModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}