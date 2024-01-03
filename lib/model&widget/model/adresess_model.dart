class Addresses {
  List<Data>? data;
  int? statues;

  Addresses({this.data, this.statues});

  Addresses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    statues = json['statues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statues'] = this.statues;
    return data;
  }
}

class Data {
  int? idAddres;
  int? idUser;
  String? name;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  String? phoneAddres;
  String? notsAddres;

  Data(
      {this.idAddres,
        this.idUser,
        this.name,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.phoneAddres,
        this.notsAddres});

  Data.fromJson(Map<String, dynamic> json) {
    idAddres = json['id_addres'];
    idUser = json['id_user'];
    name = json['name'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneAddres = json['phone_addres'];
    notsAddres = json['nots_addres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_addres'] = this.idAddres;
    data['id_user'] = this.idUser;
    data['name'] = this.name;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone_addres'] = this.phoneAddres;
    data['nots_addres'] = this.notsAddres;
    return data;
  }
}