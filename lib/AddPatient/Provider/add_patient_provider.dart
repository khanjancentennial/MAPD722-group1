import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group1/HomeScreen/home_screen.dart';
import 'dart:async';

import '../../Login/LoginScreen.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/add_patient_model.dart';

class AddPatientProvider extends ChangeNotifier {
  late AddPatientDetails addPatientDetails;
  bool isLoading=false;
  bool isFemale = false;
  bool isMale = false;
  bool isDoctor = false;
  bool isNurse = false;

  Future<AddPatientDetails?> addPatient(
      BuildContext context,
      String firstName,
      String lastName,
      String emailId,
      String phoneNumber,
      String weight,
      String height,
      String address,
      String gender,
      String userFirstName,
      String userLastName,
      String userType
      ) async {


    startLoading();
    Map<String, dynamic> patientDetailsBody = {

      "firstName": firstName,
      "lastName": lastName,
      "email": emailId,
      "gender":gender,
      "phoneNumber": phoneNumber,
      "weight" : weight,
      "height" : height,
      "address" : address,
      "status" : "normal"

    };
    try {
      http.Response response =
      await http.post(Uri.parse(ApiNetwork.ADD_PATIENT_DETAILS),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(patientDetailsBody)
      );
      print(response);
      if (response.statusCode == 201) {
        addPatientDetails = AddPatientDetails.fromJson(json.decode(response.body));

        if(addPatientDetails.success== true){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(firstName: userFirstName,lastName: userLastName,healthCareProvider: userType,)),
          );
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.green,
              toastMessage: addPatientDetails.message);
          stopLoading();
          notifyListeners();
        }else{
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.red,
              toastMessage: addPatientDetails.message);
          stopLoading();
          notifyListeners();
        }

      } else {
        addPatientDetails = AddPatientDetails.fromJson(json.decode(response.body));
        stopLoading();
        AppUtils.instance.showToast(
            textColor: Colors.white,
            backgroundColor: AppColors.red,
            toastMessage: addPatientDetails.message);
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
    return addPatientDetails;
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

}