import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group1/AllTests/all_clinial_test_screen.dart';
import 'dart:async';

import '../../Login/LoginScreen.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/add_clinical_test_model.dart';

class AddClinicalTestProvider extends ChangeNotifier {
  late CreateClinicalTest createClinicalTest;
  bool isLoading=false;
  bool isFemale = false;
  bool isMale = false;
  bool isDoctor = false;
  bool isNurse = false;

  Future<CreateClinicalTest?> createNewTest(
      BuildContext context,
      String bloodPressure,
      String respiratoryRate,
      String bloodOxygenLevel,
      String heartbeatRate,
      String chiefComplaint,
      String pastMedicalHistory,
      String medicalDiagnosis,
      String medicalPrescription,
      String creationDateTime,
      String patientId,
      String firstName,
      String lastName,
      String address,
      String height,
      String weight,
      String emailId,
      String phoneNumber,
      ) async {

    startLoading();
    Map<String, dynamic> createTestBody = {

      "bloodPressure": bloodPressure,
      "respiratoryRate": respiratoryRate,
      "bloodOxygenLevel": bloodOxygenLevel,
      "heartbeatRate": heartbeatRate,
      "chiefComplaint": chiefComplaint,
      "pastMedicalHistory": pastMedicalHistory,
      "medicalDiagnosis": medicalDiagnosis,
      "medicalPrescription": medicalPrescription,
      "creationDateTime": creationDateTime,
      "patientId": patientId
    };
    try {
      http.Response response =
      await http.post(Uri.parse(ApiNetwork.GET_ALL_CLINICAL_TEST),
          // headers: {"Content-Type": "application/json"},
          body: createTestBody);
      print(response);
      if (response.statusCode == 200) {
        createClinicalTest = CreateClinicalTest.fromJson(json.decode(response.body));

        if(createClinicalTest.success== true){

          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.green,
              toastMessage: createClinicalTest.message);

          stopLoading();
          notifyListeners();
        }else{
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.red,
              toastMessage: createClinicalTest.message);
          stopLoading();
          notifyListeners();
        }

      } else {
        createClinicalTest = CreateClinicalTest.fromJson(json.decode(response.body));
        stopLoading();
        AppUtils.instance.showToast(
            textColor: Colors.white,
            backgroundColor: AppColors.red,
            toastMessage: createClinicalTest.message);
        notifyListeners();

      }
      notifyListeners();
    }
    on TimeoutException catch (e) {
      throw TimeOutException(e.message!);
    } on SocketException catch (e) {
      AppUtils.instance.showToast(
          textColor: Colors.white,
          backgroundColor: AppColors.red,
          toastMessage: "Your internet is off");
    }
    on FormatException catch (e) {
      throw InvalidFormatException(e.message);
    } on IOException catch (e) {
      throw IOException(e.message);
    }
    on Exception catch (e) {
      stopLoading();
      print(e.toString());

    }
    notifyListeners();
    return createClinicalTest;
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