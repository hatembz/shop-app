class CategoriesModel {
  late bool status;
  CatergoriesDataModel? data;
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = CatergoriesDataModel.fromJson(json['data']);
  }
}

class CatergoriesDataModel {
  late int curentPage;
  late List<DataModel> data = [];
  CatergoriesDataModel.fromJson(Map<String, dynamic> json) {
    curentPage = json["current_page"];
    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  late int id;
  late String name;
  late String image;
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    image = json['image'];
  }
}
