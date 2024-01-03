import 'package:elfardos/model&widget/model/products.dart';

class ReviewModel {

  List<Review>? review;


  ReviewModel({this.review,});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Review {
  int? id;
  int? idUser;
  int? ratings;
  String? comment;
  String? createdAt;
  String? updatedAt;
  int? idProduct;
  String? name;
  String? image;

  Review(
      {this.id,
        this.idUser,
        this.ratings,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.idProduct,
        this.name,
        this.image});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    ratings = json['ratings'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idProduct = json['id_product'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['ratings'] = this.ratings;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id_product'] = this.idProduct;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}