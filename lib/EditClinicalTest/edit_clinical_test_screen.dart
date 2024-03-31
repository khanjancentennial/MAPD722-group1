import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapd722_group1/EditClinicalTest/Provider/edit_clinical_test_provider.dart';
import 'package:mapd722_group1/EditClinicalTest/Provider/get_clinical_test_by_id_provider.dart';
import 'package:provider/provider.dart';

import '../AllTests/all_clinial_test_screen.dart';
import '../Widgets/button_with_text.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';

class EditClinicalTest extends StatefulWidget {
  String? patientId;
  String? firstName;
  String? lastName;
  String? address;
  String? height;
  String? weight;
  String? emailId;
  String? phoneNumber;
  String? testId;
  EditClinicalTest({super.key,
    this.firstName,
    this.lastName,
    this.address,
    this.height,
    this.weight,
    this.emailId,
    this.phoneNumber,
    this.testId,
    this.patientId});

  @override
  State<EditClinicalTest> createState() => _EditClinicalTestState();
}

class _EditClinicalTestState extends State<EditClinicalTest> {


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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => getDetails());
  }

  Future<void>? getDetails() async {
    if (this.mounted) {
      Provider.of<GetClinicalTestByIdProvider>(context, listen: false).allClinicalTestMethod(context, widget.testId!);
      // Provider.of<SearchByNameProvider>(context,listen: false).getPatientByName("");
      setState(() {});

    }
  }


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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).bloodPressure,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).respiratoryRate,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).bloodOxygenLevel,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).heartbeatRate,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).chiefComplaint,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).pastMedicalHistory,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).medicalDiagnosis,
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
                          controller: Provider.of<GetClinicalTestByIdProvider>(context,listen: false).medicalPrescription,
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
                              validations();
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

  void validations() async {
    DateTime now = DateTime.now().toUtc();
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now);

    if(_formKey.currentState!.validate()){


      Provider.of<EditClinicalTestProvider>(context, listen: false).createNewTest(
        context,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).bloodPressure.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).respiratoryRate.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).bloodOxygenLevel.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).heartbeatRate.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).chiefComplaint.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).pastMedicalHistory.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).medicalDiagnosis.text,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).medicalPrescription.text,
        formattedDate,
        Provider.of<GetClinicalTestByIdProvider>(context,listen: false).getClinicalTestByIdModel!.data!.sId!,
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
