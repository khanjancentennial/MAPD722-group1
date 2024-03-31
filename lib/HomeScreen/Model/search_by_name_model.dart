class SearchByNameModel {
  bool? success;
  List<Data>? data;

  SearchByNameModel({this.success, this.data});

  SearchByNameModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? weight;
  String? height;
  String? address;
  int? gender;
  int? iV;
  bool isCritical = false;

  Data(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.weight,
        this.height,
        this.address,
        this.gender,
        this.iV,
        this.isCritical = false
      });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    weight = json['weight'];
    height = json['height'];
    address = json['address'];
    gender = json['gender'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['__v'] = this.iV;
    return data;
  }
}
