class CriticalPatientDetailsModel {
  bool? success;
  List<Data>? data;

  CriticalPatientDetailsModel({this.success, this.data});

  CriticalPatientDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? bloodPressure;
  int? respiratoryRate;
  int? bloodOxygenLevel;
  int? heartbeatRate;
  String? chiefComplaint;
  String? pastMedicalHistory;
  String? medicalDiagnosis;
  String? medicalPrescription;
  String? creationDateTime;
  Patient? patient;
  int? iV;
  PatientInfo? patientInfo;

  Data(
      {this.sId,
        this.bloodPressure,
        this.respiratoryRate,
        this.bloodOxygenLevel,
        this.heartbeatRate,
        this.chiefComplaint,
        this.pastMedicalHistory,
        this.medicalDiagnosis,
        this.medicalPrescription,
        this.creationDateTime,
        this.patient,
        this.iV,
        this.patientInfo});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bloodPressure = json['bloodPressure'];
    respiratoryRate = json['respiratoryRate'];
    bloodOxygenLevel = json['bloodOxygenLevel'];
    heartbeatRate = json['heartbeatRate'];
    chiefComplaint = json['chiefComplaint'];
    pastMedicalHistory = json['pastMedicalHistory'];
    medicalDiagnosis = json['medicalDiagnosis'];
    medicalPrescription = json['medicalPrescription'];
    creationDateTime = json['creationDateTime'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    iV = json['__v'];
    patientInfo = json['patientInfo'] != null
        ? new PatientInfo.fromJson(json['patientInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['bloodPressure'] = this.bloodPressure;
    data['respiratoryRate'] = this.respiratoryRate;
    data['bloodOxygenLevel'] = this.bloodOxygenLevel;
    data['heartbeatRate'] = this.heartbeatRate;
    data['chiefComplaint'] = this.chiefComplaint;
    data['pastMedicalHistory'] = this.pastMedicalHistory;
    data['medicalDiagnosis'] = this.medicalDiagnosis;
    data['medicalPrescription'] = this.medicalPrescription;
    data['creationDateTime'] = this.creationDateTime;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['__v'] = this.iV;
    if (this.patientInfo != null) {
      data['patientInfo'] = this.patientInfo!.toJson();
    }
    return data;
  }
}

class Patient {
  String? sId;
  String? firstName;
  String? lastName;

  Patient({this.sId, this.firstName, this.lastName});

  Patient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class PatientInfo {
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

  PatientInfo(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.weight,
        this.height,
        this.address,
        this.gender,
        this.iV});

  PatientInfo.fromJson(Map<String, dynamic> json) {
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
