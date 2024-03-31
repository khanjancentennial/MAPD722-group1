import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group1/HomeScreen/home_screen.dart';
import 'package:mapd722_group1/utils/preference_key.dart';
import 'dart:async';

import '../../Login/LoginScreen.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/edit_patient_model.dart';

class EditPatientProvider extends ChangeNotifier {
  late EditPatientModel editPatientModel;
  bool isLoading=false;
  bool isFemale = false;
  bool isMale = false;
  bool isDoctor = false;
  bool isNurse = false;



  Future<EditPatientModel?> editPatient(
      BuildContext context,
      String firstName,
      String lastName,
      String emailId,
      String phoneNumber,
      String weight,
      String height,
      String address,
      String gender,
      String patientId
      ) async {



    startLoading();
    Map<String, dynamic> registrationBody = {

      "firstName": firstName,
      "lastName": lastName,
      "email": emailId,
      "gender":gender,
      "phoneNumber": phoneNumber,
      "height": height,
      "weight": weight,
      "address": address,
    };
    try {
      http.Response response =
      await http.put(Uri.parse("${ApiNetwork.EDIT_PATIENT_DETAILS}/$patientId"),
          // headers: {"Content-Type": "application/json"},
          body: registrationBody);
      print(response);
      if (response.statusCode == 200) {
        editPatientModel = EditPatientModel.fromJson(json.decode(response.body));

        String userFirstName = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefFirstName) ?? "";
        String userLastName = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefLastName) ?? "";
        if(editPatientModel.success== true){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(lastName: userLastName,firstName: userFirstName)),
          );
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.green,
              toastMessage: editPatientModel.message);
          stopLoading();
          notifyListeners();
        }else{
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.red,
              toastMessage: editPatientModel.message);
          stopLoading();
          notifyListeners();
        }

      } else {
        editPatientModel = EditPatientModel.fromJson(json.decode(response.body));
        stopLoading();
        AppUtils.instance.showToast(
            textColor: Colors.white,
            backgroundColor: AppColors.red,
            toastMessage: editPatientModel.message);
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
    return editPatientModel;
  }

  void startLoading(){
    isLoading=true;
    notifyListeners();
  }
  void stopLoading(){
    isLoading=false;
    notifyListeners();
  }

  bool emailStructure(String emailValueCheck){
    bool emailIsValid=false;
    String  emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9_-]+\.[a-zA-Z]+";
    RegExp emailRegExp = new RegExp(emailPattern);
    emailIsValid= emailRegExp.hasMatch(emailValueCheck);
    notifyListeners();
    return emailIsValid;
  }

  bool passwordStructure(String value){
    bool passwordIsValid=false;
    String  passwordPattern = r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d][A-Za-z\d!@#$%^&*()_+]{7,}$';
    RegExp passwordRegExp = RegExp(passwordPattern);
    passwordIsValid= passwordRegExp.hasMatch(value);
    print("password $passwordIsValid");
    notifyListeners();
    return passwordIsValid;

  }

  void genderCheck(String gender){
    if(gender == "Male"){
      isMale = !isMale;
      isFemale = false;
      notifyListeners();
    }else{
      isFemale = !isFemale;
      isMale = false;
      notifyListeners();
    }
  }

  void healthCareCheck(String healthCare){
    if(healthCare == "Doctor"){
      isDoctor = !isDoctor;
      isNurse = false;
      notifyListeners();
    }else{
      isNurse = !isNurse;
      isDoctor = false;
      notifyListeners();
    }
  }

  falseGender(){
    isMale = false;
    isFemale = false;
    notifyListeners();
  }

}