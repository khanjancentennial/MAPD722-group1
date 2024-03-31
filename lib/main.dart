import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapd722_group1/AddClinicalTest/Provider/add_clinical_test_provider.dart';
import 'package:mapd722_group1/EditClinicalTest/Provider/edit_clinical_test_provider.dart';
import 'package:mapd722_group1/EditClinicalTest/Provider/get_clinical_test_by_id_provider.dart';
import 'package:mapd722_group1/HomeScreen/Provider/delete_patient_data_provider.dart';
import 'package:mapd722_group1/utils/app_color.dart';
import 'package:provider/provider.dart';

import 'AddPatient/Provider/add_patient_provider.dart';
import 'AllTests/Provider/clinical_test_provider.dart';
import 'AllTests/Provider/delete_clinical_test_by_id_provider.dart';
import 'EditPatient/Provider/edit_patient_provider.dart';
import 'EditProfile/Provider/update_profile_provider.dart';
import 'EditProfile/Provider/user_profile_provider.dart';
import 'HomeScreen/Provider/get_all_critical_patient_provider.dart';
import 'HomeScreen/Provider/get_all_patient_provider.dart';
import 'HomeScreen/Provider/search_by_name_provider.dart';
import 'Login/Provider/LoginProvider.dart';
import 'Registration/Provider/registration_provider.dart';
import 'Splash/SpalshScreen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
        ChangeNotifierProvider<RegistrationProvider>(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider<UserProfileProvider>(create: (context) => UserProfileProvider()),
        ChangeNotifierProvider<UpdateProfileProvider>(create: (context) => UpdateProfileProvider()),

        ChangeNotifierProvider<AddPatientProvider>(create: (context) => AddPatientProvider()),
        ChangeNotifierProvider<GetAllPatientProvider>(create: (context) => GetAllPatientProvider()),
        ChangeNotifierProvider<DeletePatientDataProvider>(create: (context) => DeletePatientDataProvider()),
        ChangeNotifierProvider<EditPatientProvider>(create: (context) => EditPatientProvider()),

        ChangeNotifierProvider<SearchByNameProvider>(create: (context) => SearchByNameProvider()),

        ChangeNotifierProvider<AllClinicalTestProvider>(create: (context) => AllClinicalTestProvider()),
        ChangeNotifierProvider<DeleteClinicalTestByIdProvider>(create: (context) => DeleteClinicalTestByIdProvider()),
        ChangeNotifierProvider<AddClinicalTestProvider>(create: (context) => AddClinicalTestProvider()),
        ChangeNotifierProvider<EditClinicalTestProvider>(create: (context) => EditClinicalTestProvider()),
        ChangeNotifierProvider<GetClinicalTestByIdProvider>(create: (context) => GetClinicalTestByIdProvider()),

        ChangeNotifierProvider<GetAllCriticalPatientProvider>(create: (context) => GetAllCriticalPatientProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.homeScreenColor,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black
              ),
              centerTitle: false,
              iconTheme: IconThemeData(color: AppColors.black)
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
