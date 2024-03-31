import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/get_clinical_test_by_id_model.dart';

class GetClinicalTestByIdProvider extends ChangeNotifier {
  GetClinicalTestByIdModel? getClinicalTestByIdModel;
  bool isLoading=false;
  TextEditingController bloodPressure = TextEditingController();
  TextEditingController respiratoryRate = TextEditingController();
  TextEditingController bloodOxygenLevel = TextEditingController();
  TextEditingController heartbeatRate = TextEditingController();
  TextEditingController chiefComplaint = TextEditingController();
  TextEditingController pastMedicalHistory = TextEditingController();
  TextEditingController medicalDiagnosis = TextEditingController();
  TextEditingController medicalPrescription = TextEditingController();

  Future<GetClinicalTestByIdModel?> allClinicalTestMethod(BuildContext context,String testId) async {

    startLoading();

    try {
      http.Response response =
      await http.get(Uri.parse("${ApiNetwork.GET_ALL_CLINICAL_TEST_BY_ID}/$testId"),
      );
      if (response.statusCode == 200) {
        getClinicalTestByIdModel = GetClinicalTestByIdModel.fromJson(json.decode(response.body));

        if(getClinicalTestByIdModel!.success == true){

          bloodPressure.clear();
          respiratoryRate.clear();
          bloodOxygenLevel.clear();
          heartbeatRate.clear();
          chiefComplaint.clear();
          pastMedicalHistory.clear();
          medicalDiagnosis.clear();
          medicalPrescription.clear();


          bloodPressure.text = getClinicalTestByIdModel!.data!.bloodPressure.toString();
          respiratoryRate.text = getClinicalTestByIdModel!.data!.respiratoryRate.toString();
          bloodOxygenLevel.text = getClinicalTestByIdModel!.data!.bloodOxygenLevel.toString();
          heartbeatRate.text = getClinicalTestByIdModel!.data!.heartbeatRate.toString();
          chiefComplaint.text = getClinicalTestByIdModel!.data!.chiefComplaint.toString();
          pastMedicalHistory.text = getClinicalTestByIdModel!.data!.pastMedicalHistory.toString();
          medicalDiagnosis.text = getClinicalTestByIdModel!.data!.medicalDiagnosis.toString();
          medicalPrescription.text = getClinicalTestByIdModel!.data!.medicalPrescription.toString();
          notifyListeners();
          stopLoading();
          // AppUtils.instance.showToast(
          //     textColor: Colors.white,
          //     backgroundColor: AppColors.green,
          //     toastMessage: "Login Successful");


          notifyListeners();
        }else{
          stopLoading();
          // loginData = LoginModel.fromJson(json.decode(response.body));
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.darkRed,
              toastMessage: "Invalid Data");
          notifyListeners();
        }

      }
      else {
        stopLoading();
        // loginData = LoginModel.fromJson(json.decode(response.body));
        AppUtils.instance.showToast(
            textColor: Colors.white,
            backgroundColor: AppColors.darkRed,
            toastMessage: "Invalid Data");
        notifyListeners();
      }
      notifyListeners();


    }
    on TimeoutException catch (e) {
      throw TimeOutException(e.message!);
    } on SocketException catch (e) {

    } on FormatException catch (e) {
      throw InvalidFormatException(e.message);
    } on IOException catch (e) {
      throw IOException(e.message);
    }
    on Exception catch (e) {
      stopLoading();
      print(e.toString());
    }
    notifyListeners();
    return getClinicalTestByIdModel;
  }

  void startLoading(){
    isLoading=true;
    notifyListeners();
  }
  void stopLoading(){
    isLoading=false;
    notifyListeners();
  }

}