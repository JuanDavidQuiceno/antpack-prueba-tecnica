class GeoModel {
  GeoModel({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
    lat: json["lat"] == null ? 4.3580437 : double.tryParse('${json["lat"]}')??4.3580437,
    lng: json["lng"] == null ? -73.9450831 : double.tryParse('${json["lng"]}')??-73.9450831,
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
  };
}