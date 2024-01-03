import 'package:elfardos/model&widget/model/products.dart';
import 'package:elfardos/model&widget/model/reviewsModel.dart';

class OneProduct{
  Products? products;
  List<Review> review = [];


  OneProduct(this.products,this.review);

  OneProduct.fromJson(Map<String, dynamic> json) {
    products = json['data'] != null ? new Products.fromJson(json['data']) : null;
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review.add(new Review.fromJson(v));
      });
    }

  }


}