import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mapd722_group1/AllTests/Model/clinical_test_model.dart';

import 'dart:async';



import '../../HomeScreen/home_screen.dart';
import '../../Login/Model/login_model.dart';
import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../../utils/preference_key.dart';

class AllClinicalTestProvider extends ChangeNotifier {
  AllClinicalTest? allClinicalTest;
  List<Data?> allClinicalTestList = [];
  List<String> allClinicalTestListDate = [];
  bool isLoading=false;


  Future<AllClinicalTest?> allClinicalTestMethod(BuildContext context,String userId) async {

    startLoading();

    try {
      http.Response response =
      await http.get(Uri.parse(ApiNetwork.GET_ALL_CLINICAL_TEST),
          );
      if (response.statusCode == 200) {
        allClinicalTest = AllClinicalTest.fromJson(json.decode(response.body));

        if(allClinicalTest!.success == true){
          allClinicalTestList = [];
          allClinicalTestListDate = [];
          allClinicalTest!.data!.asMap().forEach((key, value) {
            if(value.patient!.sId.toString() == userId.toString()){
              allClinicalTestList.add(value);

              DateTime parseTransferredDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(value.creationDateTime!,true).toLocal();
              var outputDate = DateFormat("yyyy-MM-dd' 'HH:mm:ss").format(parseTransferredDate);
              allClinicalTestListDate.add(outputDate);

              notifyListeners();
            }
          }
          );

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
    return allClinicalTest;
  }

  void startLoading(){
    isLoading=true;
    notifyListeners();
  }
  void stopLoading(){
    isLoading=false;
    notifyListeners();
  }


hideShow(index){
  allClinicalTest!.data![index].isExpanded = !allClinicalTest!.data![index].isExpanded;
}


}