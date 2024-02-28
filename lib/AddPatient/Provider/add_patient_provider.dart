import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../../Login/LoginScreen.dart';
import '../../Registration/Model/registration_model.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';

class AddPatientProvider extends ChangeNotifier {
  late RegistrationModel registrationModel;
  bool isLoading=false;
  bool isFemale = false;
  bool isMale = false;
  bool isDoctor = false;
  bool isNurse = false;

  // Future<RegistrationModel?> addUserDetails(
  //     BuildContext context,
  //     String firstName,
  //     String lastName,
  //     String emailId,
  //     String password,
  //     String phoneNumber,
  //     String gender,
  //     String userType
  //     ) async {
  //
  //
  //   startLoading();
  //   Map<String, dynamic> registrationBody = {
  //
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "email": emailId,
  //     "gender":gender,
  //     "phoneNumber": phoneNumber,
  //     "password" : password,
  //     "healthcareProvider": userType,
  //   };
  //   try {
  //     http.Response response =
  //     await http.post(Uri.parse(ApiNetwork.REGISTER_URL),
  //         // headers: {"Content-Type": "application/json"},
  //         body: registrationBody);
  //     print(response);
  //     if (response.statusCode == 201) {
  //       registrationModel = RegistrationModel.fromJson(json.decode(response.body));
  //
  //       if(registrationModel.success== true){
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()),
  //         );
  //         AppUtils.instance.showToast(
  //             textColor: Colors.white,
  //             backgroundColor: AppColors.green,
  //             toastMessage: registrationModel.message);
  //         stopLoading();
  //         notifyListeners();
  //       }else{
  //         AppUtils.instance.showToast(
  //             textColor: Colors.white,
  //             backgroundColor: AppColors.red,
  //             toastMessage: registrationModel.message);
  //         stopLoading();
  //         notifyListeners();
  //       }
  //
  //     } else {
  //       registrationModel = RegistrationModel.fromJson(json.decode(response.body));
  //       stopLoading();
  //       AppUtils.instance.showToast(
  //           textColor: Colors.white,
  //           backgroundColor: AppColors.red,
  //           toastMessage: registrationModel.message);
  //       notifyListeners();
  //
  //     }
  //     notifyListeners();
  //   }
  //   on TimeoutException catch (e) {
  //     throw TimeOutException(e.message!);
  //   } on SocketException catch (e) {
  //     AppUtils.instance.showToast(
  //         textColor: Colors.white,
  //         backgroundColor: AppColors.red,
  //         toastMessage: "Your internet is off");
  //   }
  //   on FormatException catch (e) {
  //     throw InvalidFormatException(e.message);
  //   } on IOException catch (e) {
  //     throw IOException(e.message);
  //   }
  //   on Exception catch (e) {
  //     stopLoading();
  //     print(e.toString());
  //
  //   }
  //   notifyListeners();
  //   return registrationModel;
  // }
  //
  // void startLoading(){
  //   isLoading=true;
  //   notifyListeners();
  // }
  // void stopLoading(){
  //   isLoading=false;
  //   notifyListeners();
  // }

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