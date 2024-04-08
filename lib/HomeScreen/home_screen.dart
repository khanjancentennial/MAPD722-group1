import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapd722_group1/EditPatient/edit_patient_screen.dart';
import 'package:mapd722_group1/HomeScreen/Provider/get_all_critical_patient_provider.dart';
import 'package:mapd722_group1/HomeScreen/Provider/search_by_name_provider.dart';
import 'package:provider/provider.dart';

import '../AddPatient/add_patient_screen.dart';
import '../AllTests/all_clinial_test_screen.dart';
import '../EditProfile/edit_profile_screen.dart';
import '../Login/LoginScreen.dart';
import '../utils/app_color.dart';
import '../utils/app_images.dart';
import '../utils/app_utils.dart';
import '../utils/custome_popup.dart';
import '../utils/preference_key.dart';
import 'Model/home_screen_model.dart';
import 'Provider/delete_patient_data_provider.dart';
import 'Provider/get_all_patient_provider.dart';

class HomeScreen extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? healthCareProvider;
  HomeScreen({this.lastName,this.firstName, this.healthCareProvider,super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  // String heathCareProvider = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => getDetails());
  }

  Future<void>? getDetails() async {
    if (this.mounted) {
      print(widget.healthCareProvider);
      print(widget.healthCareProvider.runtimeType);
      // heathCareProvider = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefUserType);
      // print(heathCareProvider);

      Provider.of<GetAllPatientProvider>(context, listen: false).getAllPatientDetails().then((value) {
        Provider.of<GetAllCriticalPatientProvider>(context, listen: false).getAllCriticalPatientDetails(context);
      });
      // Provider.of<SearchByNameProvider>(context,listen: false).getPatientByName("");
      setState(() {});

    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: AppColors.white,
        child:
        Scaffold(
          backgroundColor: AppColors.white,
          appBar: CommonAppBar(
            leading: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 38,
                ),
                Container(
                  width: 250,
                  child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Hello ",
                              style: AppUtils.instance.textStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            // text: "Caldwell",
                              text: "${widget.firstName ?? ""} ",
                              style: AppUtils.instance.textStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttonColor))
                        ],
                      )
                  ),
                ),
              ],
            ),
            height: 90,
            backgroundColor: AppColors.homeScreenColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 20),
                child: PopupMenuButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    offset: Offset(0, 40),
                    icon: const Icon(
                      Icons.more_horiz,
                      color: AppColors.buttonColor,
                      size: 40,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                          child: Row(
                            children: [
                              Image.asset("${AppImage.user}",
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Edit Profile',
                                style: AppUtils.instance.textStyle(),
                              ),
                            ],
                          ),
                          ),
                      PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: AppUtils.instance.textStyle(
                                    color: AppColors.black),
                              ),
                            ],
                          ),
                          ),
                    ],
                    onSelected: (result) {
                      if (result == 0) {
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()),
                        );
                      } else if (result == 1) {
                        AppUtils.instance.addPref(PreferenceKey.boolKey, PreferenceKey.prefLogin,false);
                        AppUtils.instance.addPref(PreferenceKey.stringKey, PreferenceKey.prefFirstName,"");
                        AppUtils.instance.addPref(PreferenceKey.stringKey, PreferenceKey.prefLastName,"");
                        AppUtils.instance.addPref(PreferenceKey.stringKey, PreferenceKey.prefUserType,"");
                        AppUtils.instance.addPref(PreferenceKey.stringKey, PreferenceKey.prefUserId,"");
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      }
                    }),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  child: SingleChildScrollView(
                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Row(
                              children: [
                                Text("Patient List",
                                style: AppUtils.instance.textStyle(
                                  fontSize: 30,
                                  color: AppColors.buttonColor,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (builder) =>
                                      const AddPatientScreen()
                                      )
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                      width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.buttonColor
                                    ),
                                    child: const Icon(Icons.add,
                                      color: AppColors.white,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Container(
                              // width: MediaQuery.of(context).size.width / 2,
                              // height: 50,
                              child: TextFormField(
                                style: const TextStyle(color: AppColors.labelColor),
                                onTap: () {},
                                controller: searchController,
                                // focusNode: myFocusNodeEmail,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 5,bottom: 5),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.textFieldColor,
                                  hintText: "Search",
                                  hintStyle: AppUtils.instance.textStyle(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: Icon(Icons.search_outlined,)
                                ),

                                onChanged: (value){
                                  Provider.of<SearchByNameProvider>(context,listen: false).getPatientByName(value).then((value) {
                                    Provider.of<GetAllCriticalPatientProvider>(context, listen: false).getAllCriticalPatientDetails(context);
                                  });
                                  // print(emailValue);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          searchController.text.isNotEmpty ?
                          Consumer2<SearchByNameProvider,GetAllCriticalPatientProvider>(
                              builder: (_, searchByName,getAllCriticalPatient, child) =>
                              searchByName.isLoading  == false && getAllCriticalPatient.isLoading == false?

                                  searchByName.searchByNameModel.success == false ?
                                      Center(
                                          child:
                                          Text("No Data Found",
                                          style: AppUtils.instance.textStyle(
                                            color: AppColors.buttonColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold
                                          )
                                          )
                                      )
                                      :
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                  searchByName.searchByNameModel.data!.length
                                  ,
                                  itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            width:MediaQuery.of(context).size.width,
                                            child: Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          fit:FlexFit.tight,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text("${
                                                                  searchByName.searchByNameModel.data![index].firstName!} "
                                                                  "${searchByName.searchByNameModel.data![index].lastName!}",
                                                                  style: AppUtils.instance.textStyle(
                                                                      fontSize: 26,
                                                                      fontWeight: FontWeight.bold
                                                                  )
                                                              ),
                                                              const SizedBox(height: 5),
                                                              Text("Email id:- ${searchByName.searchByNameModel.data![index].email!}",
                                                                style: AppUtils.instance.textStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              const SizedBox(height: 5),
                                                              Text("Patient Status:- ${searchByName.searchByNameModel.data![index].status}",
                                                                style: AppUtils.instance.textStyle(
                                                                  fontSize: 16,
                                                                  color: searchByName.searchByNameModel.data![index].status == "critical" ? AppColors.red : AppColors.green
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: (){
                                                                    Navigator.push(context,
                                                                        MaterialPageRoute(builder: (builder) =>
                                                                            EditPatientDetails(
                                                                              patientId: searchByName.searchByNameModel.data![index].sId,
                                                                              firstName: searchByName.searchByNameModel.data![index].firstName!,
                                                                              lastName: searchByName.searchByNameModel.data![index].lastName!,
                                                                              address: searchByName.searchByNameModel.data![index].address!,
                                                                              emailId: searchByName.searchByNameModel.data![index].email!,
                                                                              phoneNumber: searchByName.searchByNameModel.data![index].phoneNumber!,
                                                                              height: searchByName.searchByNameModel.data![index].height!,
                                                                              weight: searchByName.searchByNameModel.data![index].weight!,
                                                                              gender: searchByName.searchByNameModel.data![index].gender!,

                                                                            )
                                                                        )
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: AppColors.buttonColor
                                                                    ),
                                                                    child: const Icon(Icons.edit,
                                                                      color: AppColors.white,
                                                                      size: 20,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(width: 10),
                                                                InkWell(
                                                                  onTap: (){
                                                                    showDialog<String>(
                                                                      context: context,
                                                                      builder: (BuildContext context) => AlertDialog(
                                                                        title: const Center(child: Text('Are you sure you want to delete patient record?')),
                                                                        actions: <Widget>[
                                                                          Row(
                                                                            mainAxisAlignment : MainAxisAlignment.center,
                                                                            children: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                                                                child: Text('Cancel',
                                                                                    style: AppUtils.instance.textStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 18,
                                                                                        color: AppColors.green
                                                                                    )
                                                                                ),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  Provider.of<DeletePatientDataProvider>(context,listen: false).deletePatient(
                                                                                      searchByName.searchByNameModel.data![index].sId!
                                                                                  ).then((value) {
                                                                                    Navigator.pushReplacement(
                                                                                      context,
                                                                                      MaterialPageRoute(builder: (context) => HomeScreen(lastName: widget.lastName,firstName: widget.firstName,healthCareProvider: widget.healthCareProvider,)),
                                                                                    );
                                                                                  }
                                                                                  );
                                                                                },
                                                                                child:  Text('Yes',
                                                                                    style: AppUtils.instance.textStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 18,
                                                                                        color: AppColors.red
                                                                                    )
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: AppColors.buttonColor
                                                                    ),
                                                                    child: const Icon(Icons.delete,
                                                                      color: AppColors.white,
                                                                      size: 20,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),

                                                            InkWell(
                                                              onTap: (){
                                                                Navigator.push(context,
                                                                    MaterialPageRoute(builder: (builder)=>
                                                                        AllClinicalTestScreen(

                                                                          firstName: searchByName.searchByNameModel.data![index].firstName!,
                                                                          lastName: searchByName.searchByNameModel.data![index].lastName!,
                                                                          address: searchByName.searchByNameModel.data![index].address!,
                                                                          emailId: searchByName.searchByNameModel.data![index].email!,
                                                                          phoneNumber: searchByName.searchByNameModel.data![index].phoneNumber!,
                                                                          height: searchByName.searchByNameModel.data![index].height!,
                                                                          weight: searchByName.searchByNameModel.data![index].weight!,
                                                                          patientId: searchByName.searchByNameModel.data![index].sId!,

                                                                        )
                                                                    )

                                                                );
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets.only(left: 10,right: 10),
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    color: AppColors.buttonColor
                                                                ),
                                                                child: Center(
                                                                  child: Text("View Details",
                                                                    style: AppUtils.instance.textStyle(
                                                                        color: AppColors.white
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),


                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    );

                                  })
                                  :
                              const Center(child: CircularProgressIndicator()
                              )
                          )
                              :

                          Consumer2<GetAllPatientProvider,GetAllCriticalPatientProvider>(
                              builder: (_, getAllPatientDetails,getAllCriticalPatientProvider, __) =>
                              getAllPatientDetails.isLoading  == false && getAllCriticalPatientProvider.isLoading == false?

                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                        getAllPatientDetails.allPatientDetailsModel!.data!.length
                                        ,
                                        itemBuilder: (context,index){
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width:MediaQuery.of(context).size.width,
                                                  child: Card(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(10),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                fit:FlexFit.tight,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text("${
                                                                        getAllPatientDetails.allPatientDetailsModel!.data![index].firstName!} "
                                                                        "${getAllPatientDetails.allPatientDetailsModel!.data![index].lastName!}",
                                                                      style: AppUtils.instance.textStyle(
                                                                        fontSize: 26,
                                                                        fontWeight: FontWeight.bold
                                                                      )
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                    Text("Email id:- ${getAllPatientDetails.allPatientDetailsModel!.data![index].email!}",
                                                                      style: AppUtils.instance.textStyle(
                                                                          fontSize: 16,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                    Text("Patient Status:- ${getAllPatientDetails.allPatientDetailsModel!.data![index].status}",
                                                                      style: AppUtils.instance.textStyle(
                                                                        fontSize: 16,
                                                                        color: getAllPatientDetails.allPatientDetailsModel!.data![index].status == "critical"? AppColors.red : AppColors.green
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: (){
                                                                          Navigator.push(context,
                                                                              MaterialPageRoute(builder: (builder) =>
                                                                                  EditPatientDetails(
                                                                                    patientId: getAllPatientDetails.allPatientDetailsModel!.data![index].sId,
                                                                                    firstName: getAllPatientDetails.allPatientDetailsModel!.data![index].firstName!,
                                                                                    lastName: getAllPatientDetails.allPatientDetailsModel!.data![index].lastName!,
                                                                                    address: getAllPatientDetails.allPatientDetailsModel!.data![index].address!,
                                                                                    emailId: getAllPatientDetails.allPatientDetailsModel!.data![index].email!,
                                                                                    phoneNumber: getAllPatientDetails.allPatientDetailsModel!.data![index].phoneNumber!,
                                                                                    height: getAllPatientDetails.allPatientDetailsModel!.data![index].height!,
                                                                                    weight: getAllPatientDetails.allPatientDetailsModel!.data![index].weight!,
                                                                                    gender: getAllPatientDetails.allPatientDetailsModel!.data![index].gender!,

                                                                                  )
                                                                              )
                                                                          );
                                                                        },
                                                                        child: Container(
                                                                          height: 40,
                                                                          width: 40,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: AppColors.buttonColor
                                                                          ),
                                                                          child: const Icon(Icons.edit,
                                                                            color: AppColors.white,
                                                                            size: 20,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          showDialog<String>(
                                                                            context: context,
                                                                            builder: (BuildContext context) => AlertDialog(
                                                                              title: const Center(child: Text('Are you sure you want to delete patient record?')),
                                                                              actions: <Widget>[
                                                                                Row(
                                                                                  mainAxisAlignment : MainAxisAlignment.center,
                                                                                  children: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                                                                      child: Text('Cancel',
                                                                                          style: AppUtils.instance.textStyle(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontSize: 18,
                                                                                              color: AppColors.green
                                                                                          )
                                                                                      ),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        Provider.of<DeletePatientDataProvider>(context,listen: false).deletePatient(
                                                                                            getAllPatientDetails.allPatientDetailsModel!.data![index].sId!
                                                                                        ).then((value) {
                                                                                          Navigator.pushReplacement(
                                                                                            context,
                                                                                            MaterialPageRoute(builder: (context) => HomeScreen(lastName: widget.lastName,firstName: widget.firstName,healthCareProvider: widget.healthCareProvider,)),
                                                                                          );
                                                                                        }
                                                                                        );
                                                                                      },
                                                                                      child:  Text('Yes',
                                                                                          style: AppUtils.instance.textStyle(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontSize: 18,
                                                                                              color: AppColors.red
                                                                                          )
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),

                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                        child: Container(
                                                                          height: 40,
                                                                          width: 40,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: AppColors.buttonColor
                                                                          ),
                                                                          child: const Icon(Icons.delete,
                                                                            color: AppColors.white,
                                                                            size: 20,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(height: 10),

                                                                  InkWell(
                                                                    onTap: (){
                                                                      Navigator.push(context,
                                                                          MaterialPageRoute(builder: (builder)=>
                                                                          AllClinicalTestScreen(

                                                                            firstName: getAllPatientDetails.allPatientDetailsModel!.data![index].firstName!,
                                                                            lastName: getAllPatientDetails.allPatientDetailsModel!.data![index].lastName!,
                                                                            address: getAllPatientDetails.allPatientDetailsModel!.data![index].address!,
                                                                            emailId: getAllPatientDetails.allPatientDetailsModel!.data![index].email!,
                                                                            phoneNumber: getAllPatientDetails.allPatientDetailsModel!.data![index].phoneNumber!,
                                                                            height: getAllPatientDetails.allPatientDetailsModel!.data![index].height!,
                                                                            weight: getAllPatientDetails.allPatientDetailsModel!.data![index].weight!,
                                                                            patientId: getAllPatientDetails.allPatientDetailsModel!.data![index].sId!,

                                                                          )
                                                                          )

                                                                      );
                                                                    },
                                                                    child: Container(
                                                                      padding: EdgeInsets.only(left: 10,right: 10),
                                                                      height: 40,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          color: AppColors.buttonColor
                                                                      ),
                                                                      child: Center(
                                                                        child: Text("View Details",
                                                                          style: AppUtils.instance.textStyle(
                                                                            color: AppColors.white
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),


                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          );

                                        })
                                  :
                              const Center(child: CircularProgressIndicator()
                              )
                          )
                        ]),
                  )),
            ),
          ),
        ),


      );

    Container();
  }
}
