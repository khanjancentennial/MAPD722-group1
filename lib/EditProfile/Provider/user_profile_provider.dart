import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group1/EditProfile/Model/profile_model.dart';
import 'dart:async';

import '../../Login/LoginScreen.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';

class UserProfileProvider extends ChangeNotifier {
  late ProfileModel getUserModel;
  bool isLoading=false;
  bool isFemale = false;
  bool isMale = false;
  bool isDoctor = false;
  bool isNurse = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController address = TextEditingController();

  Future<ProfileModel?> getUserDetails(
      String userId,
      ) async {

    startLoading();

    try {
      firstNameController.text =  "";
      lastNameController.text =  "";
      emailController.text =  "";
      phoneController.text =  "";
      address.text =  "";
      isMale = false;
      isFemale = false;
      http.Response response =
      await http.get(Uri.parse("${ApiNetwork.USER_URL}/$userId"));
      print(response);
      if (response.statusCode == 200) {
        getUserModel = ProfileModel.fromJson(json.decode(response.body));

        if(getUserModel.success== true){

          firstNameController.text =  firstNameController.text == "" ? getUserModel.data!.firstName! : firstNameController.text;
          lastNameController.text =  lastNameController.text == "" ? getUserModel.data!.lastName! : lastNameController.text;
          emailController.text =  emailController.text == "" ? getUserModel.data!.email! : emailController.text;
          phoneController.text =  phoneController.text == "" ? getUserModel.data!.phoneNumber! : phoneController.text;
          isMale = getUserModel.data!.gender == 0 ? true: false;
          isFemale = getUserModel.data!.gender == 1 ? true: false;
          isDoctor = getUserModel.data!.healthcareProvider == 0 ? true: false;
          isNurse = getUserModel.data!.healthcareProvider == 1 ? true: false;
          // AppUtils.instance.showToast(
          //     textColor: Colors.white,
          //     backgroundColor: AppColors.green,
          //     toastMessage: getUserModel.message);
          stopLoading();
          notifyListeners();
        }else{
          // AppUtils.instance.showToast(
          //     textColor: Colors.white,
          //     backgroundColor: AppColors.red,
          //     toastMessage: getUserModel.message);
          stopLoading();
          notifyListeners();
        }

      } else {
        stopLoading();
        // AppUtils.instance.showToast(
        //     textColor: Colors.white,
        //     backgroundColor: AppColors.red,
        //     toastMessage: registrationModel.message);
        notifyListeners();
        getUserModel = ProfileModel.fromJson(json.decode(response.body));

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
    return getUserModel;
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
}