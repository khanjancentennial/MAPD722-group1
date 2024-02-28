import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapd722_group1/utils/app_color.dart';
import 'package:provider/provider.dart';

import 'AddPatient/Provider/add_patient_provider.dart';
import 'EditProfile/Provider/update_profile_provider.dart';
import 'EditProfile/Provider/user_profile_provider.dart';
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
