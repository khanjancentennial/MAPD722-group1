import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapd722_group1/AddPatient/Provider/add_patient_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/button_with_text.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';
class EditPatientDetails extends StatefulWidget {
  const EditPatientDetails({super.key});

  @override
  State<EditPatientDetails> createState() => _EditPatientDetailsState();
}

class _EditPatientDetailsState extends State<EditPatientDetails> {


  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode weightFocusNode = FocusNode();
  FocusNode heightFocusNode = FocusNode();
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
                            child: Text("Edit Patient Details",
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
                        const Text("First Name"),
                        const SizedBox(height: 5),
                        // first name
                        TextFormField(
                          onTap: () {},
                          controller: firstName,
                          focusNode: firstNameFocusNode,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.only(left: 10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter First Name",
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
                              return "Please enter first name";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),
                        const Text("Last Name"),
                        const SizedBox(height: 5),
                        // last name
                        TextFormField(
                          onTap: () {},
                          controller: lastName,
                          focusNode: lastNameFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Last Name",
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
                              return "please enter last name";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        const Text("Email Id"),
                        const SizedBox(height: 5),
                        //email
                        TextFormField(
                          onTap: () {},
                          controller: emailController,
                          focusNode: emailFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Email Id",
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
                              return "Please enter email";
                            }
                            else {
                              if(Provider.of<AddPatientProvider>(context,listen: false).emailStructure(value)){
                                return null;
                              }else{
                                return "Please enter a valid email address";
                              }

                            }
                          },
                          onChanged: (emailValue){
                            Provider.of<AddPatientProvider>(context,listen: false).emailStructure(emailValue);
                            // print(emailValue);
                          },
                        ),
                        const SizedBox(height: 20),

                        const Text("Phone Number"),
                        const SizedBox(height: 5),

                        // phone number
                        TextFormField(
                          maxLength: 10,
                          keyboardType: const TextInputType.numberWithOptions(signed: true),
                          onTap: () {},
                          controller: phoneController,
                          focusNode: phoneFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Phone Number",
                            hintStyle: AppUtils.instance.textStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            // prefixIcon: Container(
                            //   padding: const EdgeInsets.only(left: 11,right: 11),
                            //   child: Image.asset(AppImage.phoneImage,
                            //     scale: 17,
                            //     // color: AppColors.grey,
                            //   ),
                            // ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter phone number";
                            }
                            else{
                              if(value.length == 10){
                                return null;
                              }else{
                                return "Phone number should be 10 digits";
                              }
                            }

                          },
                        ),
                        const SizedBox(height: 20),
                        const Text("Patient Weight"),
                        const SizedBox(height: 5),

                        // weight text field
                        TextFormField(
                          onTap: () {},
                          controller: weightController,
                          focusNode: weightFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter patient weight in KG",
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
                              return "please enter patient weight";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),

                        const Text("Patient Height"),
                        const SizedBox(height: 5),

                        // height text field
                        TextFormField(
                          onTap: () {},
                          controller: heightController,
                          focusNode: heightFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter Enter patient height in CM",
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
                              return "please enter patient height";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        const Text("Patient Address"),
                        const SizedBox(height: 5),
                        // address text field
                        TextFormField(
                          maxLines: 5,
                          onTap: () {},
                          controller: addressController,
                          focusNode: addressFocusNode,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Enter patient Address",
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
                              return "please enter patient address";
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 20),


                        // gender
                        const SizedBox(height: 20),
                        Text("Gender:",
                            style: AppUtils.instance.textStyle(color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )),
                        const SizedBox(height: 10),

                        Consumer<AddPatientProvider>(
                          builder: (_, gender, child) => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  gender.genderCheck("Male");
                                },
                                child: Row(
                                  children: [
                                    gender.isMale
                                        ? const CircleAvatar(
                                      backgroundColor:
                                      AppColors.buttonColor,
                                      radius: 11,
                                    )
                                        : const CircleAvatar(
                                      backgroundColor: AppColors.black,
                                      radius: 11,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                        AppColors.homeScreenColor,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Male",
                                      style: AppUtils.instance.textStyle(
                                          fontSize: 16,
                                          color: AppColors.black),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  gender.genderCheck("Female");
                                },
                                child: Row(
                                  children: [
                                    gender.isFemale
                                        ? const CircleAvatar(
                                      backgroundColor:
                                      AppColors.buttonColor,
                                      radius: 11,
                                    )
                                        : const CircleAvatar(
                                      backgroundColor: AppColors.black,
                                      radius: 11,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                        AppColors.homeScreenColor,
                                      ),
                                    ),

                                    const SizedBox(width: 10),
                                    Text(
                                      "Female",
                                      style: AppUtils.instance.textStyle(
                                          fontSize: 16,
                                          color: AppColors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        isFirstTime?
                        Consumer<AddPatientProvider>(
                            builder: (_, gender, child) =>
                            gender.isMale == false || gender.isFemale == false ?

                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 13),
                              child: Text("Please select gender",
                                style: AppUtils.instance.textStyle(
                                    color: AppColors.darkRed
                                ),
                              ),
                            )
                                :
                            const SizedBox()
                        )
                            :
                        const SizedBox(),


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
                            text: "Edit Patient Details",
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
