import 'package:elfardos/model&widget/model/adresess_model.dart' as AddresModel;
import 'package:elfardos/model&widget/model/ordersModel.dart';

class DetailsOrderModel {
  List<Data>? data;
  List<Orders>? dataOrdre;
  List<AddresModel.Data>? dataaddres;
  String? message;
  int? status;

  DetailsOrderModel(
      {this.data, this.dataOrdre, this.dataaddres, this.message, this.status});

  DetailsOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['dataOrdre'] != null) {
      dataOrdre = <Orders>[];
      json['dataOrdre'].forEach((v) {
        dataOrdre!.add(new Orders.fromJson(v));
      });
    }

    if (json['dataaddres'] != null) {
      dataaddres = <AddresModel.Data>[];
      json['dataaddres'].forEach((v) {
        dataaddres!.add(new AddresModel.Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.dataOrdre != null) {
      data['dataOrdre'] = this.dataOrdre!.map((v) => v.toJson()).toList();
    }
    if (this.dataaddres != null) {
      data['dataaddres'] = this.dataaddres!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
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
  int? idUser;
  int? idProducts;
  int? orderStatus;

  Data(
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
        this.idUser,
        this.idProducts,
        this.orderStatus});

  Data.fromJson(Map<String, dynamic> json) {
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
    idUser = json['id_user'];
    idProducts = json['id_products'];
    orderStatus = json['order_status'];
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
    data['id_user'] = this.idUser;
    data['id_products'] = this.idProducts;
    data['order_status'] = this.orderStatus;
    return data;
  }
}

