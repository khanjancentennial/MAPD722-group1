import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/delete_clinical_test_by_id_model.dart';

class DeleteClinicalTestByIdProvider extends ChangeNotifier {
  DeleteClinicalTestByIdModel? deleteClinicalTestByIdModel;
  bool isLoading=false;


  Future<DeleteClinicalTestByIdModel?> delete(BuildContext context,String testId) async {

    startLoading();

    try {
      http.Response response =
      await http.delete(Uri.parse("${ApiNetwork.GET_ALL_CLINICAL_TEST}/$testId"),
      );
      if (response.statusCode == 200) {
        deleteClinicalTestByIdModel = DeleteClinicalTestByIdModel.fromJson(json.decode(response.body));

        if(deleteClinicalTestByIdModel!.success == true){

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
    return deleteClinicalTestByIdModel;
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