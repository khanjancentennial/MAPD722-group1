import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group1/HomeScreen/Model/search_by_name_model.dart';
import 'dart:async';

import '../../utils/api_network.dart';
import '../../utils/app_color.dart';
import '../../utils/app_utils.dart';
import '../../utils/exceptions.dart';
import '../Model/home_screen_model.dart';

class SearchByNameProvider extends ChangeNotifier {
  SearchByNameModel searchByNameModel = SearchByNameModel();
  bool isLoading=false;

  Future<SearchByNameModel?> getPatientByName(
      String searchText
      ) async {

    startLoading();

    try {

      http.Response response =
      await http.get(Uri.parse("${ApiNetwork.SEARCH_BY_NAME}/$searchText"));
      print(response.statusCode);
      if (response.statusCode == 200) {
        searchByNameModel = SearchByNameModel.fromJson(json.decode(response.body));
        print(searchByNameModel.data);
        if(searchByNameModel.success== true){

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
        searchByNameModel = SearchByNameModel.fromJson(json.decode(response.body));
        print(searchByNameModel.success);
        stopLoading();
        // AppUtils.instance.showToast(
        //     textColor: Colors.white,
        //     backgroundColor: AppColors.red,
        //     toastMessage: "No Patient Found");
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
    return searchByNameModel;
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