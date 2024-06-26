import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../AllTests/all_clinial_test_screen.dart';
import '../Widgets/button_with_text.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';
import 'Provider/add_clinical_test_provider.dart';

class AddClinicalTestScreen extends StatefulWidget {
  String? patientId;
  String? firstName;
  String? lastName;
  String? address;
  String? height;
  String? weight;
  String? emailId;
  String? phoneNumber;
  AddClinicalTestScreen({super.key,
    this.firstName,
    this.lastName,
    this.address,
    this.height,
    this.weight,
    this.emailId,
    this.phoneNumber,
    this.patientId});

  @override
  State<AddClinicalTestScreen> createState() => _AddClinicalTestScreenState();
}

class _AddClinicalTestScreenState extends State<AddClinicalTestScreen> {
  TextEditingController bloodPressure = TextEditingController();
  TextEditingController respiratoryRate = TextEditingController();
  TextEditingController bloodOxygenLevel = TextEditingController();
  TextEditingController heartbeatRate = TextEditingController();
  TextEditingController chiefComplaint = TextEditingController();
  TextEditingController pastMedicalHistory = TextEditingController();
  TextEditingController medicalDiagnosis = TextEditingController();
  TextEditingController medicalPrescription = TextEditingController();
  FocusNode bloodPressureFocusNode = FocusNode();
  FocusNode respiratoryRateFocusNode = FocusNode();
  FocusNode bloodOxygenLevelFocusNode = FocusNode();
  FocusNode heartbeatRateFocusNode = FocusNode();
  FocusNode chiefComplaintFocusNode = FocusNode();
  FocusNode pastMedicalHistoryFocusNode = FocusNode();
  FocusNode medicalDiagnosisFocusNode = FocusNode();
  FocusNode medicalPrescriptionFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String emailValue = "";

  bool isFirstTime = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        body: Form(
            key: _formKey,
            child:
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 50,
                                child: Icon(Icons.keyboard_arrow_left,size: 35,)
                            )
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width-120,
                          child: Center(
                            child: Text("Add Test Details",
                                style: AppUtils.instance.textStyle(
                                    fontSize: 30,
                                    color: AppColors.buttonColor,
                                    fontWeight: FontWeight.bold

                                )
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 20),

                        // first name
                        TextFormField(
                          onTap: () {},
                          controller: bloodPressure,
                          focusNode: bloodPressureFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.only(left: 10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Blood Pressure (X/Y mmHg)",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 5,right: 11),
                            //   child: Image.asset(AppImage.user,
                            //     scale: 20,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter blood pressure";
                            }
                            else if(int.parse(value) > 1000 || int.parse(value) < 1){
                              return "Please enter valid blood pressure value";
                            }
                            else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        // last name
                        TextFormField(
                          onTap: () {},
                          controller: respiratoryRate,
                          focusNode: respiratoryRateFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Respiratory Rate (X/min)",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 5,right: 11),
                            //   child: Image.asset(AppImage.user,
                            //     scale: 20,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter respiratory rate";
                            }
                            else if(int.parse(value) > 1000 || int.parse(value) < 1){
                              return "Please enter valid respiratory rate value";
                            }
                            else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        //email
                        TextFormField(
                          onTap: () {},
                          controller: bloodOxygenLevel,
                          focusNode: bloodOxygenLevelFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Blood Oxygen Level (X%)",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   child: Image.asset(AppImage.emailImage,
                            //     scale: 3,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter blood oxygen level";
                            }
                            else if(int.parse(value) > 1000 || int.parse(value) < 1){
                              return "Please enter valid blood oxygen level value";
                            }else {
                              return null;
                            }

                          },
                          // onChanged: (emailValue){
                          //   Provider.of<AddPatientProvider>(context,listen: false).emailStructure(emailValue);
                          //   // print(emailValue);
                          // },
                        ),

                        const SizedBox(height: 20),
                        // weight text field
                        TextFormField(
                          onTap: () {},
                          controller: heartbeatRate,
                          focusNode: heartbeatRateFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Heartbeat Rate (X/min)",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter heartbeat rate";
                            }
                            else if(int.parse(value) > 1000 || int.parse(value) < 1){
                              return "Please enter valid heartbeat rate value";
                            }
                            else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),


                        // chief complaint text field
                        TextFormField(
                          maxLines: 5,
                          onTap: () {},
                          controller: chiefComplaint,
                          focusNode: chiefComplaintFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter patient's chief complaint",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 5,right: 11),
                            //   child: Image.asset(AppImage.user,
                            //     scale: 20,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter patient's chief complaint";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        // past medical history text field
                        TextFormField(
                          maxLines: 5,
                          onTap: () {},
                          controller: pastMedicalHistory,
                          focusNode: pastMedicalHistoryFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter patient's past medical history",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 5,right: 11),
                            //   child: Image.asset(AppImage.user,
                            //     scale: 20,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter patient's past medical history";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        // past medical diagnosis text field
                        TextFormField(
                          maxLines: 5,
                          onTap: () {},
                          controller: medicalDiagnosis,
                          focusNode: medicalDiagnosisFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter patient's diagnosis",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 5,right: 11),
                            //   child: Image.asset(AppImage.user,
                            //     scale: 20,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter patient's diagnosis";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        // past medical prescription text field
                        TextFormField(
                          maxLines: 5,
                          onTap: () {},
                          controller: medicalPrescription,
                          focusNode: medicalPrescriptionFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter patient's prescription",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 5,right: 11),
                            //   child: Image.asset(AppImage.user,
                            //     scale: 20,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter patient's prescription";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),


                        const SizedBox(height: 40),

                        // Consumer<RegistrationProvider>(
                        //     builder: (_, isLoading, child) =>
                        //     isLoading.isLoading
                        //
                        //         ?
                        //     buttonWithProgressIndicator(
                        //       widget: const Padding(
                        //         padding: EdgeInsets.only(left: 150,right: 150,top: 10,bottom: 10),
                        //         child: SizedBox(
                        //             height: 10,
                        //             width: 10,
                        //             child: CircularProgressIndicator()),
                        //       ),
                        //       bgColor: AppColors.buttonColor,
                        //       height: 60,
                        //       width: MediaQuery.of(context).size.width,
                        //     )
                        //         :

                        buttonWithText(
                            onPress: () {
                              validations();
                            },
                            bgColor: AppColors.buttonColor,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            text: "Add Details",
                            textColor: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        // ),


                        const SizedBox(height: 50),

                      ],
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }

  void validations() async {
    DateTime now = DateTime.now().toUtc();
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now);

    if(_formKey.currentState!.validate()){


        Provider.of<AddClinicalTestProvider>(context, listen: false).createNewTest(
            context,
            bloodPressure.text,
            respiratoryRate.text,
            bloodOxygenLevel.text,
            heartbeatRate.text,
            chiefComplaint.text,
            pastMedicalHistory.text,
            medicalDiagnosis.text,
            medicalPrescription.text,
            formattedDate,
          widget.patientId!,
          widget.firstName!,
          widget.lastName!,
          widget.address!,
          widget.height!,
          widget.weight!,
          widget.emailId!,
          widget.phoneNumber!,
        ).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  AllClinicalTestScreen(
              firstName : widget.firstName,
              lastName : widget.lastName,
              address : widget.address,
              height : widget.height,
              weight : widget.weight,
              emailId :widget.emailId,
              phoneNumber : widget.phoneNumber,
              patientId: widget.patientId,

            )
            ),
          );
        });




      //     .then((value) {
      //
      //   if (value!.success == true){
      //
      //     AppUtils.instance.showToast(
      //         textColor: Colors.white,
      //         backgroundColor: Colors.green,
      //         toastMessage: "${value.message}");
      //     Navigator.pop(context);
      //
      //   } else {
      //     AppUtils.instance.showToast(
      //         textColor: Colors.white,
      //         backgroundColor: AppColors.red,
      //         toastMessage: "${value.message}");
      //   }
      // });


    }
  }

}
