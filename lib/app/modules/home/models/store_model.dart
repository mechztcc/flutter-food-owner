class StoreModel {
  int? _id;
  String? _name;
  String? _description;
  bool? _active;
  bool? _opened;
  int? _userId;
  String? _createdAt;
  String? _updatedAt;

  StoreModel(
      {int? id,
      String? name,
      String? description,
      bool? active,
      bool? opened,
      int? userId,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
    if (active != null) {
      _active = active;
    }
    if (opened != null) {
      _opened = opened;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  bool? get active => _active;
  set active(bool? active) => _active = active;
  bool? get opened => _opened;
  set opened(bool? opened) => _opened = opened;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  StoreModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _active = json['active'];
    _opened = json['opened'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    data['active'] = _active;
    data['opened'] = _opened;
    data['user_id'] = _userId;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
