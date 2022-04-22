class DogModel {
  String? breed;
  String? breedType;
  String? origin;
  String? popularity;
  String? hypoallergenic;
  String? intelligence;
  String? photo;
  List<String> temperament = [];

  void fromJson(Map<String, dynamic> json) {
    breed = json["breed"];
    breedType = json["breedType"];
    origin = json["origin"];
    popularity = json["popularity"];
    hypoallergenic = json["hypoallergenic"];
    intelligence = json["intelligence"];
    photo = json["photo"];
    temperament = json["temperament"] as List<String>;
  }
}
