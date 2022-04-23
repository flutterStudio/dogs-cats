class CatModel {
  String? id;
  String? image;

  CatModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
  }
}
