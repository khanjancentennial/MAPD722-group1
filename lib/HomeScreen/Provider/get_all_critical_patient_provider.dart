import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group1/HomeScreen/Provider/search_by_name_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/critical_patient_details_model.dart';
import 'get_all_patient_provider.dart';

class GetAllCriticalPatientProvider extends ChangeNotifier {
  CriticalPatientDetailsModel? criticalPatientDetailsModel;
  bool isLoading=false;



  Future<CriticalPatientDetailsModel?> getAllCriticalPatientDetails(
      BuildContext context
      ) async {

    startLoading();

    try {

      http.Response response =
      await http.get(Uri.parse(ApiNetwork.GET_ALL_CRITICAL_TEST));
      print(response);
      if (response.statusCode == 200) {
        criticalPatientDetailsModel = CriticalPatientDetailsModel.fromJson(json.decode(response.body));

        if(criticalPatientDetailsModel!.success== true){

          // AppUtils.instance.showToast(
          //     textColor: Colors.white,
          //     backgroundColor: AppColors.green,
          //     toastMessage: getUserModel.message);

          for(int i=0; i<Provider.of<GetAllPatientProvider>(context,listen: false).allPatientDetailsModel!.data!.length;i++){
            for(int j = 0; j<criticalPatientDetailsModel!.data!.length;j++){
              if(Provider.of<GetAllPatientProvider>(context,listen: false).allPatientDetailsModel!.data![i].sId.toString() == criticalPatientDetailsModel!.data![j].patientInfo!.sId.toString()){
                Provider.of<GetAllPatientProvider>(context,listen: false).allPatientDetailsModel!.data![i].isCritical = true;
                notifyListeners();
              }else{
                Provider.of<GetAllPatientProvider>(context,listen: false).allPatientDetailsModel!.data![i].isCritical = false;
                notifyListeners();
              }
            }
          }

          if(Provider.of<SearchByNameProvider>(context,listen: false).searchByNameModel.success == true){
            for(int i=0; i<Provider.of<SearchByNameProvider>(context,listen: false).searchByNameModel!.data!.length;i++){
              for(int j = 0; j<criticalPatientDetailsModel!.data!.length;j++){
                if(Provider.of<SearchByNameProvider>(context,listen: false).searchByNameModel!.data![i].sId.toString() == criticalPatientDetailsModel!.data![j].patientInfo!.sId.toString()){
                  Provider.of<SearchByNameProvider>(context,listen: false).searchByNameModel!.data![i].isCritical = true;
                  notifyListeners();
                }else{
                  Provider.of<SearchByNameProvider>(context,listen: false).searchByNameModel!.data![i].isCritical = false;
                  notifyListeners();
                }
              }
            }
          }





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
        criticalPatientDetailsModel = CriticalPatientDetailsModel.fromJson(json.decode(response.body));

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
    return criticalPatientDetailsModel;
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