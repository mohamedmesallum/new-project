class Categories {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? home;

  Categories(
      {this.id,
        this.name,
        this.nameAr,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.home});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    home = json['home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['home'] = this.home;
    return data;
  }
}