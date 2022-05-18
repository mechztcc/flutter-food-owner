class UserModel {
  String? name;
  String? email;
  String? password;
  String? status;

  UserModel({String? name, String? email, String? password, String? status}) {
    if (name != null) {
      name = name;
    }
    if (email != null) {
      email = email;
    }
    if (password != null) {
      password = password;
    }
    if (status != null) {
      status = status;
    }
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
