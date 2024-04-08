import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../../HomeScreen/home_screen.dart';
import '../../Login/LoginScreen.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../../utils/preference_key.dart';
import '../Model/update_profile_model.dart';

class UpdateProfileProvider extends ChangeNotifier {
  late UpdateProfileModel updateProfileModel;
  bool isLoading=false;
  bool isFemale = false;
  bool isMale = false;


  Future<UpdateProfileModel?> updateUserDetails(
      BuildContext context,
      String userId,
      String firstName,
      String lastName,
      String emailId,
      String phoneNumber,
      int gender,
      int userType
      ) async {

    print(gender);
    startLoading();
    Map<String, dynamic> updateUserBody = {
      "firstName": firstName,
      "lastName": lastName,
      "gender":gender,
      "phoneNumber": phoneNumber,
      "healthcareProvider": userType,
    };
    try {
      http.Response response =
      await http.put(Uri.parse("${ApiNetwork.USER_URL}/${userId}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(updateUserBody)
      );
      print(response);
      if (response.statusCode == 200) {
        updateProfileModel = UpdateProfileModel.fromJson(json.decode(response.body));

        if(updateProfileModel.success== true){
          AppUtils.instance.addPref(PreferenceKey.stringKey, PreferenceKey.prefFirstName,firstName);
          AppUtils.instance.addPref(PreferenceKey.stringKey, PreferenceKey.prefLastName,lastName);
          // Navigator.pushReplacement(context, newRoute)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(firstName: firstName,lastName:lastName)),
          );

          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.green,
              toastMessage: updateProfileModel.message);
          stopLoading();
          notifyListeners();
        }else{
          AppUtils.instance.showToast(
              textColor: Colors.white,
              backgroundColor: AppColors.red,
              toastMessage: updateProfileModel.message);
          stopLoading();
          notifyListeners();
        }

      } else {
        updateProfileModel = UpdateProfileModel.fromJson(json.decode(response.body));
        stopLoading();
        AppUtils.instance.showToast(
            textColor: Colors.white,
            backgroundColor: AppColors.red,
            toastMessage: updateProfileModel.message);
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
    return updateProfileModel;
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