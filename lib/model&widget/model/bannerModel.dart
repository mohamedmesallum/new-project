class Banner {
  int? id;
  String? image;
  int? categorieId;
  String? createdAt;
  String? updatedAt;

  Banner(
      {this.id, this.image, this.categorieId, this.createdAt, this.updatedAt});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    categorieId = json['categorieId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['categorieId'] = this.categorieId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}