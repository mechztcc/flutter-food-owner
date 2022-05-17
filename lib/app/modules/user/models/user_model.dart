class UserModel {
  String? _name;
  String? _email;
  String? _password;
  String? _status;

  UserModel({String? name, String? email, String? password, String? status}) {
    if (name != null) {
      _name = name;
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    if (status != null) {
      _status = status;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get status => _status;
  set status(String? status) => _status = status;

  UserModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['email'] = _email;
    data['password'] = _password;
    return data;
  }
}
