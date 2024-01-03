import 'package:elfardos/model&widget/model/products.dart';
import 'bannerModel.dart';
import 'categoriesModel.dart';

class HomeModel {
  List<Categories>? categories;
  List<Banner>? banner;
  List<Products>? discount;
  List<Products>? popular;
  List<Products>? bestChoice;

  HomeModel(
      {this.categories,
        this.banner,
        this.discount,
        this.popular,
        this.bestChoice});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['Banner'] != null) {
      banner = <Banner>[];
      json['Banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    if (json['Discount'] != null) {
      discount = <Products>[];
      json['Discount'].forEach((v) {
        discount!.add(Products.fromJson(v));
      });
    }
    if (json['Popular'] != null) {
      popular = <Products>[];
      json['Popular'].forEach((v) {
        popular!.add(Products.fromJson(v));
      });
    }
    if (json['Best Choice'] != null) {
      bestChoice = <Products>[];
      json['Best Choice'].forEach((v) {
        bestChoice!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['Banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    if (this.discount != null) {
      data['Discount'] = this.discount!.map((v) => v.toJson()).toList();
    }
    if (this.popular != null) {
      data['Popular'] = this.popular!.map((v) => v.toJson()).toList();
    }
    if (this.bestChoice != null) {
      data['Best Choice'] = this.bestChoice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}





