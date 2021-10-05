class CompanyModel {
  CompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    name: json["name"] == null ? null : json["name"].toString().replaceAll("-", " ").replaceAll("#", " ").replaceAll("@", " "),
    catchPhrase: json["catchPhrase"] == null ? null : json["catchPhrase"],
    bs: json["bs"] == null ? null : json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "catchPhrase": catchPhrase == null ? null : catchPhrase,
    "bs": bs == null ? null : bs,
  };
}