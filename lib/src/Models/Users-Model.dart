import 'Address/Address-Model.dart';
import 'Company/Company-Model.dart';

// List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  AddressModel? address;
  String? phone;
  String? website;
  CompanyModel? company;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : AddressModel.fromJson(json["address"]),
    phone: json["phone"] == null ? null : json["phone"],
    website: json["website"] == null ? null : json["website"],
    company: json["company"] == null ? null : CompanyModel.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "address": address == null ? null : address!.toJson(),
    "phone": phone == null ? null : phone,
    "website": website == null ? null : website,
    "company": company == null ? null : company!.toJson(),
  };
}