import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapd722_group1/EditProfile/Provider/update_profile_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/button_with_progress_idicator.dart';
import '../Widgets/button_with_text.dart';
import '../utils/app_color.dart';
import '../utils/app_images.dart';
import '../utils/app_utils.dart';
import '../utils/preference_key.dart';
import 'Provider/user_profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String emailValue = "";

  bool isFirstTime = false;

  String userId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => getDetails());
  }

  Future<void>? getDetails() async {
    if (this.mounted) {
      userId = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefUserId);
      print(userId);
      setState(() {});
      Provider.of<UserProfileProvider>(context, listen: false).getUserDetails(userId);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Consumer<UserProfileProvider>(
            builder: (_, getUserDetails, child) =>
            getUserDetails.isLoading  == false ?
            Form(
                key: _formKey,
                child:
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 20, left: 20),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),

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
                                child: Text("Profile",
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
                            Consumer<UserProfileProvider>(
                              builder: (_, getUserDetails, child) =>
                                  TextFormField(
                                    onTap: () {},
                                    controller: getUserDetails.firstNameController,
                                    // focusNode: firstNameFocusNode,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.textFieldColor,

                                      prefixIcon: Container(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 11),
                                        child: Image.asset(AppImage.user,
                                          scale: 20,
                                          // color: AppColors.grey,
                                        ),
                                      ),

                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter first name";
                                      } else {
                                        return null;
                                      }
                                    },

                                  ),
                            ),
                            const SizedBox(height: 20),

                            const Text("Last Name"),
                            const SizedBox(height: 5),

                            // last name
                            Consumer<UserProfileProvider>(
                              builder: (_, getUserDetails, child) =>
                                  TextFormField(
                                    onTap: () {},
                                    controller: getUserDetails.lastNameController,
                                    focusNode: lastNameFocusNode,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.textFieldColor,
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 11),
                                        child: Image.asset(AppImage.user,
                                          scale: 20,
                                          // color: AppColors.grey,
                                        ),
                                      ),

                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter last name";
                                      } else {
                                        return null;
                                      }
                                    },

                                  ),
                            ),
                            const SizedBox(height: 20),

                            const Text("Email Id"),
                            const SizedBox(height: 5),
                            //email
                            Consumer<UserProfileProvider>(
                              builder: (_, getUserDetails, child) =>
                                  TextFormField(
                                    enabled: false,
                                    onTap: () {},
                                    controller: getUserDetails.emailController,
                                    focusNode: emailFocusNode,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.textFieldColor,
                                      prefixIcon: Container(
                                        child: Image.asset(AppImage.emailImage,
                                          scale: 3,
                                          // color: AppColors.grey,
                                        ),
                                      ),

                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter email";
                                      } else {
                                        if (Provider.of<UpdateProfileProvider>(
                                            context, listen: false)
                                            .emailStructure(value)) {
                                          return null;
                                        } else {
                                          return "Please enter a valid email address";
                                        }
                                      }
                                    },
                                    onChanged: (emailValue) {
                                      Provider.of<UpdateProfileProvider>(
                                          context, listen: false).emailStructure(
                                          emailValue);
                                      // print(emailValue);
                                    },
                                  ),
                            ),

                            const SizedBox(height: 20),

                            const Text("Phone Number"),
                            const SizedBox(height: 5),
                            // phone number
                            Consumer<UserProfileProvider>(
                              builder: (_, getUserDetails, child) =>
                                  TextFormField(
                                    maxLength: 10,
                                    keyboardType: const TextInputType
                                        .numberWithOptions(signed: true),
                                    onTap: () {},
                                    controller: getUserDetails.phoneController,
                                    focusNode: phoneFocusNode,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.textFieldColor,

                                      prefixIcon: Container(
                                        padding: const EdgeInsets.only(
                                            left: 11, right: 11),
                                        child: Image.asset(AppImage.phoneImage,
                                          scale: 17,
                                          // color: AppColors.grey,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter phone number";
                                      }
                                      else {
                                        if (value.length == 10) {
                                          return null;
                                        } else {
                                          return "Phone number should be 10 digits";
                                        }
                                      }
                                    },
                                  ),
                            ),

                            const SizedBox(height: 20),


                            const Text("Gender:"),
                            const SizedBox(height: 10),

                            Consumer<UserProfileProvider>(
                              builder: (_, getUserDetails, child) =>
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          getUserDetails.genderCheck("Male");
                                        },
                                        child: Row(
                                          children: [
                                            getUserDetails.isMale
                                                ? const CircleAvatar(
                                              backgroundColor:
                                              AppColors.buttonColor,
                                              radius: 11,
                                            )
                                                : const CircleAvatar(
                                              backgroundColor: AppColors
                                                  .black,
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
                                              style: AppUtils.instance
                                                  .textStyle(
                                                  fontSize: 16,
                                                  color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {
                                          getUserDetails.genderCheck("Female");
                                        },
                                        child: Row(
                                          children: [
                                            getUserDetails.isFemale
                                                ? const CircleAvatar(
                                              backgroundColor:
                                              AppColors.buttonColor,
                                              radius: 11,
                                            )
                                                : const CircleAvatar(
                                              backgroundColor: AppColors
                                                  .black,
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
                                              style: AppUtils.instance
                                                  .textStyle(
                                                  fontSize: 16,
                                                  color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                            ),

                            isFirstTime ?
                            Consumer<UpdateProfileProvider>(
                                builder: (_, gender, child) =>
                                gender.isMale == false ||
                                    gender.isFemale == false ?

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 13),
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


                            const SizedBox(height: 30),

                            Consumer<UpdateProfileProvider>(
                                builder: (_, isLoading, child) =>
                                isLoading.isLoading

                                    ?
                                buttonWithProgressIndicator(
                                  widget: const Padding(
                                    padding: EdgeInsets.only(left: 150,
                                        right: 150,
                                        top: 10,
                                        bottom: 10),
                                    child: SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator()),
                                  ),
                                  bgColor: AppColors.buttonColor,
                                  height: 60,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                )
                                    :

                                buttonWithText(
                                    onPress: () {
                                      validations();
                                    },
                                    bgColor: AppColors.buttonColor,
                                    height: 60,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    text: "Update",
                                    textColor: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)
                            ),

                            const SizedBox(height: 50),


                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ) :
            const Center(child: CircularProgressIndicator()
            )
        )
    );
  }
  void validations() async {

    if(Provider.of<UpdateProfileProvider>(context,listen: false).isMale
        || Provider.of<UpdateProfileProvider>(context,listen: false).isFemale
        || Provider.of<UserProfileProvider>(context,listen: false).isFemale
        || Provider.of<UserProfileProvider>(context,listen: false).isMale
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

      Provider.of<UpdateProfileProvider>(context, listen: false).updateUserDetails(
          context,
          Provider.of<UserProfileProvider>(context,listen: false).getUserModel.data!.sId.toString(),
          Provider.of<UserProfileProvider>(context,listen: false).firstNameController.text,
          Provider.of<UserProfileProvider>(context,listen: false).lastNameController.text,
          Provider.of<UserProfileProvider>(context,listen: false).emailController.text,
          Provider.of<UserProfileProvider>(context,listen: false).phoneController.text,


          Provider.of<UserProfileProvider>(context,listen: false).isMale == true ? 0: 1,

          Provider.of<UserProfileProvider>(context,listen: false).getUserModel.data!.healthcareProvider! == 0  ? 0 : 1

      );
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


      // }
    }
  }
}

