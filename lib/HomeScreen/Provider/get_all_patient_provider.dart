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
import '../Model/home_screen_model.dart';

class GetAllPatientProvider extends ChangeNotifier {
  late AllPatientDetailsModel allPatientDetailsModel;
  bool isLoading=false;



  Future<AllPatientDetailsModel?> getAllPatientDetails(
      ) async {

    startLoading();

    try {

      http.Response response =
      await http.get(Uri.parse(ApiNetwork.GET_ALL_PATIENRTS));
      print(response);
      if (response.statusCode == 200) {
        allPatientDetailsModel = AllPatientDetailsModel.fromJson(json.decode(response.body));

        if(allPatientDetailsModel.success== true){

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
        allPatientDetailsModel = AllPatientDetailsModel.fromJson(json.decode(response.body));

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
    return allPatientDetailsModel;
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