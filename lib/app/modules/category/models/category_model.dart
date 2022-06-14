class CategoryModel {
  String? name;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? id;

  CategoryModel({
    this.name,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['store_id'] = storeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
