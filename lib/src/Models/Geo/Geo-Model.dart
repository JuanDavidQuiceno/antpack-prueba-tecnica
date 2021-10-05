class GeoModel {
  GeoModel({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
  };
}