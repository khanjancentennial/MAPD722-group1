class ClinicalTestModel{
  String? bloodPressure;
  String? respiratoryRate;
  String? bloodOxygen;
  String? heartBeat;
  String? chiefComplaint;
  String? pastHistory;
  String? diagnosis;
  String? prescription;
  bool isExpanded = false;

  ClinicalTestModel(this.bloodPressure,
      this.bloodOxygen,
      this.chiefComplaint,
      this.diagnosis,
      this.heartBeat,
      this.pastHistory,
      this.prescription,
      this.respiratoryRate,
      this.isExpanded);
}