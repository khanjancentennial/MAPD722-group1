class ProfileModel {
  bool? success;
  Data? data;

  ProfileModel({this.success, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  int? gender;
  int? healthcareProvider;
  int? iV;

  Data(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.gender,
        this.healthcareProvider,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    healthcareProvider = json['healthcareProvider'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['healthcareProvider'] = this.healthcareProvider;
    data['__v'] = this.iV;
    return data;
  }
}
