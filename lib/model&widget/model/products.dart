

class Products {
  List<Products>? data;
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  int? priec;
  int? status;
  int? oldpriec;
  int? discount;
  int? categoriesId;
  String? image;
  int? count;
  String? createdAt;
  String? updatedAt;
 bool? iseFavorites ;

  Products(
      {this.id,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.priec,
        this.status,
        this.oldpriec,
        this.discount,
        this.categoriesId,
        this.image,
        this.count,
        this.createdAt,
        this.updatedAt,
      this.iseFavorites
      });

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(Products.fromJson(v));
      });
    }


    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    priec = json['priec'];
    status = json['status'];
    oldpriec = json['oldpriec'];
    discount = json['discount'];
    categoriesId = json['categories_id'];
    image = json['image'];
    count = json['count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['priec'] = this.priec;
    data['status'] = this.status;
    data['oldpriec'] = this.oldpriec;
    data['discount'] = this.discount;
    data['categories_id'] = this.categoriesId;
    data['image'] = this.image;
    data['count'] = this.count;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }



}