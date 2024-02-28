import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/button_with_text.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';

class EditClinicalTest extends StatefulWidget {
  const EditClinicalTest({super.key});

  @override
  State<EditClinicalTest> createState() => _EditClinicalTestState();
}

class _EditClinicalTestState extends State<EditClinicalTest> {

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
                            child: Text("Edit Test Details",
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

                        const Text("Blood Pressure (X/Y mmHg)"),
                        const SizedBox(height: 5),
                        // first name
                        TextFormField(
                          onTap: () {},
                          controller: bloodPressure,
                          focusNode: bloodPressureFocusNode,
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
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),
                        const Text("Respiratory Rate (X/min)"),
                        const SizedBox(height: 5),

                        // last name
                        TextFormField(
                          onTap: () {},
                          controller: respiratoryRate,
                          focusNode: respiratoryRateFocusNode,
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
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        const Text("Blood Oxygen Level (X%)"),
                        const SizedBox(height: 5),

                        //email
                        TextFormField(
                          onTap: () {},
                          controller: bloodOxygenLevel,
                          focusNode: bloodOxygenLevelFocusNode,
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
                            // else {
                            //   if(Provider.of<AddPatientProvider>(context,listen: false).emailStructure(value)){
                            //     return null;
                            //   }else{
                            //     return "Please enter a valid email address";
                            //   }
                            //
                            // }
                          },
                          // onChanged: (emailValue){
                          //   Provider.of<AddPatientProvider>(context,listen: false).emailStructure(emailValue);
                          //   // print(emailValue);
                          // },
                        ),

                        const SizedBox(height: 20),
                        const Text("Heartbeat Rate (X/min)"),
                        const SizedBox(height: 5),

                        // weight text field
                        TextFormField(
                          onTap: () {},
                          controller: heartbeatRate,
                          focusNode: heartbeatRateFocusNode,
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
                              return "please enter heartbeat rate";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        const Text("Patient's Chief Complaint"),
                        const SizedBox(height: 5),
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
                            hintText: "Enter Patient's Chief Complaint",
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

                        const Text("Patient's Past Medical History"),
                        const SizedBox(height: 5),
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
                            hintText: "Enter Patient's Past Medical History",
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

                        const Text("Patient's Diagnosis"),
                        const SizedBox(height: 5),
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
                            hintText: "Enter Patient's Diagnosis",
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

                        const Text("Patient's Prescription"),
                        const SizedBox(height: 5),

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
                            hintText: "Enter Patient's Prescription",
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
                              // validations();
                            },
                            bgColor: AppColors.buttonColor,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            text: "Edit Details",
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
}
