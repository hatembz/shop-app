class UserData {
  int? id;
  String? email;
  String? phone;
  String? image;
  String? name;
  int? credit;
  String? token;

  UserData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    credit = json['credit'];
    token = json['token'];
  }
}

class LoginModel {
  late bool status;
  late String message;
  UserData? data;

  LoginModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromjson(json['data']) : null;
  }
}
