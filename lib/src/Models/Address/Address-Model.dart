import 'package:prueba_tecnica/src/Models/Geo/Geo-Model.dart';

class AddressModel {
  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    street: json["street"] == null ? null : json["street"],
    suite: json["suite"] == null ? null : json["suite"],
    city: json["city"] == null ? null : json["city"],
    zipcode: json["zipcode"] == null ? null : json["zipcode"],
    geo: json["geo"] == null ? null : GeoModel.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street == null ? null : street,
    "suite": suite == null ? null : suite,
    "city": city == null ? null : city,
    "zipcode": zipcode == null ? null : zipcode,
    "geo": geo == null ? null : geo!.toJson(),
  };
}