import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapd722_group1/AddPatient/Provider/add_patient_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/button_with_text.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';
import '../utils/preference_key.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {

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

  String userFirstName = '';
  String userLastName = '';
  String userType = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => getDetails());
  }

  Future<void>? getDetails() async {
    if (this.mounted) {
      userFirstName = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefFirstName);
      userLastName = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefLastName);
      userType = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefUserType);
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
                            child: Text("Patient Details",
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
                                  validations();
                                },
                                bgColor: AppColors.buttonColor,
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                text: "Add Patient Details",
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

    if(Provider.of<AddPatientProvider>(context,listen: false).isMale ||
        Provider.of<AddPatientProvider>(context,listen: false).isFemale
    ){
      isFirstTime = false;
      setState(() {

      });
    }else{
      isFirstTime = true;
      setState(() {

      });
    }


    if(_formKey.currentState!.validate()){

      if((Provider.of<AddPatientProvider>(context,listen: false).isMale ||
          Provider.of<AddPatientProvider>(context,listen: false).isFemale) ){

        Provider.of<AddPatientProvider>(context, listen: false).addPatient(
            context,
            firstName.text,
            lastName.text,
            emailController.text,
            phoneController.text,
            weightController.text,
            heightController.text,
            addressController.text,
            Provider.of<AddPatientProvider>(context,listen: false).isMale ? "0" : "1",
          userFirstName.toString(),
          userLastName.toString(),
          userType.toString()

        );

      }else{}

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
