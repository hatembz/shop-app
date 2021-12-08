class HomeModel {
  late bool status;
  HomeData? data;
  HomeModel.fromjson({required Map<String, dynamic> json}) {
    status = json['status'];
    data = HomeData.fromjson(json: json['data']);
  }
}

class HomeData {
  List<BannersModel> banners = [];
  List<ProductModel> products = [];
  HomeData.fromjson({required Map<String, dynamic> json}) {
    json['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannersModel {
  late int id;
  late String image;
  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
  }
}

class ProductModel {
  int? id;
  late num price;
  late num oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    images = List<String>.from(json["images"].map((x) => x));
    inFavorites = json["in_favorites"];
    inCart = json["in_cart"];
  }
}
