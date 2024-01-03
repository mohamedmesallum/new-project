class OrdersModel {
  List<Orders>? orders;
  String? message;
  int? status;

  OrdersModel({this.orders, this.message, this.status});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['Orders'] != null) {
      orders = <Orders>[];
      json['Orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['Orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Orders {
  int? idOrders;
  int? idUser;
  int? priceOrders;
  int? idAddress;
  int? couponOrder;
  int? statusOrder;
  int? paymentMethod;
  String? createdAt;
  String? updatedAt;
  int? ordersTyp;

  Orders(
      {this.idOrders,
        this.idUser,
        this.priceOrders,
        this.idAddress,
        this.couponOrder,
        this.statusOrder,
        this.paymentMethod,
        this.createdAt,
        this.updatedAt,
        this.ordersTyp});

  Orders.fromJson(Map<String, dynamic> json) {
    idOrders = json['id_orders'];
    idUser = json['id_user'];
    priceOrders = json['price_orders'];
    idAddress = json['id_address'];
    couponOrder = json['coupon_order'];
    statusOrder = json['status_order'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ordersTyp = json['orders_typ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_orders'] = this.idOrders;
    data['id_user'] = this.idUser;
    data['price_orders'] = this.priceOrders;
    data['id_address'] = this.idAddress;
    data['coupon_order'] = this.couponOrder;
    data['status_order'] = this.statusOrder;
    data['payment_method'] = this.paymentMethod;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['orders_typ'] = this.ordersTyp;
    return data;
  }
}

class AllOrdersModel {
  List<Orders>? ordresWitaing;
  List<Orders>? ordresComplete;
  List<Orders>? ordresRejected;
  String? message;
  int? status;

  AllOrdersModel(
      {this.ordresWitaing,
        this.ordresComplete,
        this.ordresRejected,
        this.message,
        this.status});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['OrdresWitaing'] != null) {
      ordresWitaing = <Orders>[];
      json['OrdresWitaing'].forEach((v) {
        ordresWitaing!.add(new Orders.fromJson(v));
      });
    }
    if (json['OrdresComplete'] != null) {
      ordresComplete = <Orders>[];
      json['OrdresComplete'].forEach((v) {
        ordresComplete!.add(new Orders.fromJson(v));
      });
    }
    if (json['OrdresRejected'] != null) {
      ordresRejected = <Orders>[];
      json['OrdresRejected'].forEach((v) {
        ordresRejected!.add(new Orders.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ordresWitaing != null) {
      data['OrdresWitaing'] =
          this.ordresWitaing!.map((v) => v.toJson()).toList();
    }
    if (this.ordresComplete != null) {
      data['OrdresComplete'] =
          this.ordresComplete!.map((v) => v.toJson()).toList();
    }
    if (this.ordresRejected != null) {
      data['OrdresRejected'] =
          this.ordresRejected!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
