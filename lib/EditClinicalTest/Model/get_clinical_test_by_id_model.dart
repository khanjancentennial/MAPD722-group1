class GetClinicalTestByIdModel {
  bool? success;
  Data? data;

  GetClinicalTestByIdModel({this.success, this.data});

  GetClinicalTestByIdModel.fromJson(Map<String, dynamic> json) {
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
  Patient? patient;
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
  int? iV;

  Data(
      {this.patient,
        this.sId,
        this.bloodPressure,
        this.respiratoryRate,
        this.bloodOxygenLevel,
        this.heartbeatRate,
        this.chiefComplaint,
        this.pastMedicalHistory,
        this.medicalDiagnosis,
        this.medicalPrescription,
        this.creationDateTime,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
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
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
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
    data['__v'] = this.iV;
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
