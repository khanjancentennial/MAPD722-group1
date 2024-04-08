import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapd722_group1/AllTests/Provider/clinical_test_provider.dart';
import 'package:mapd722_group1/HomeScreen/Provider/get_all_critical_patient_provider.dart';
import 'package:provider/provider.dart';

import '../AddClinicalTest/add_clinical_test.dart';
import '../AddPatient/add_patient_screen.dart';
import '../EditClinicalTest/edit_clinical_test_screen.dart';
import '../EditPatient/edit_patient_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';
import '../utils/preference_key.dart';
import 'Model/clinical_test_model.dart';
import 'Provider/delete_clinical_test_by_id_provider.dart';

class AllClinicalTestScreen extends StatefulWidget {

  String? firstName;
  String? lastName;
  String? emailId;
  String? phoneNumber;
  String? height;
  String? weight;
  String? address;
  String? patientId;


  AllClinicalTestScreen({super.key,this.firstName,this.lastName,this.address,this.height,this.weight,this.emailId,this.phoneNumber,this.patientId});

  @override
  State<AllClinicalTestScreen> createState() => _AllClinicalTestScreenState();
}

class _AllClinicalTestScreenState extends State<AllClinicalTestScreen> {

  String status = '';
  String heathCareProvider = '';
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
      status = '';
      userFirstName = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefFirstName);
      userLastName = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefLastName);
      userType = await AppUtils.instance.getPreferenceValueViaKey(PreferenceKey.prefUserType);

      Provider.of<AllClinicalTestProvider>(context, listen: false).allClinicalTestMethod(context, widget.patientId!);
      Provider.of<GetAllCriticalPatientProvider>(context,listen: false).getAllCriticalPatientDetails(context).then((value) {
        if(Provider.of<GetAllCriticalPatientProvider>(context,listen: false).criticalPatientDetailsModel!.data!.isEmpty){
          status = "Normal";
          setState(() {
          });
        }
        for(int i=0; i< Provider.of<GetAllCriticalPatientProvider>(context,listen: false).criticalPatientDetailsModel!.data!.length;i++){
          if(Provider.of<GetAllCriticalPatientProvider>(context,listen: false).criticalPatientDetailsModel!.data![i].patientInfo!.sId.toString() == widget.patientId){
            status = "Critical";
            setState(() {
            });
          }else{
            status = "Normal";
            setState(() {
            });
          }
        }
      });
      // Provider.of<SearchByNameProvider>(context,listen: false).getPatientByName("");


      setState(() {});

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child:
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Column(

              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen(firstName: userFirstName,lastName: userLastName,healthCareProvider: userType,)),
                          );
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
                        child: Text("All Tests",
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
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("First Name",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold
                      
                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.firstName!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black
                      
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Last Name",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold

                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.lastName!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Email Id",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold

                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.emailId!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Phone Number",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold

                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.phoneNumber!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Height",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold

                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.height!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Weight",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold

                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.weight!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Address",
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black,fontWeight: FontWeight.bold

                                  )
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(widget.address!,
                                  style: AppUtils.instance.textStyle(
                                      fontSize: 16,
                                      color: AppColors.black

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50,left: 50),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) =>
                                AddClinicalTestScreen(
                                  firstName: widget.firstName!,
                                  lastName: widget.lastName!,
                                  address: widget.address!,
                                  height: widget.height!,
                                  weight: widget.weight!,
                                  emailId: widget.emailId,
                                  phoneNumber: widget.phoneNumber,
                                  patientId: widget.patientId!,)
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
                        ),
                      )
                    ),
                  ],
                ),

                Consumer<AllClinicalTestProvider>(
                  builder: (_, getClinicalTests, child) =>
                  getClinicalTests.isLoading?

                      Center(child: Container(
                        child: const CircularProgressIndicator(),
                      ),)
                :
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text("Patient Status:- $status",
                        style: AppUtils.instance.textStyle(
                            fontSize: 20,
                            color: status == "Critical"? AppColors.red : AppColors.green
                        ),
                      ),
                      const SizedBox(height: 5),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: getClinicalTests.allClinicalTestList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          // Padding(
                                          //   padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                                          //   child:
                                          // ),


                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10, bottom: 10, left: 20),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      fit:FlexFit.tight,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [

                                                          Text(
                                                            "Test Date and Time ${getClinicalTests.allClinicalTestListDate[index]}",
                                                            style: AppUtils.instance.textStyle(
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10),

                                                          Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            child: Text(
                                                              "Blood Pressure : ${getClinicalTests.allClinicalTestList[index]!.bloodPressure} ",
                                                              style: AppUtils.instance
                                                                  .textStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            child: Text(
                                                              "Heart Rate : ${getClinicalTests.allClinicalTestList[index]!.heartbeatRate} ",
                                                              style: AppUtils.instance
                                                                  .textStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            child: Text(
                                                              "RespiratoryRate : ${getClinicalTests.allClinicalTestList[index]!.respiratoryRate} ",
                                                              style: AppUtils.instance
                                                                  .textStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            child: Text(
                                                              "Blood Oxygen Level : ${getClinicalTests.allClinicalTestList[index]!.bloodOxygenLevel} ",
                                                              style: AppUtils.instance
                                                                  .textStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),

                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.push(context,
                                                            MaterialPageRoute(builder: (builder) =>
                                                             EditClinicalTest(
                                                               firstName: widget.firstName!,
                                                               lastName: widget.lastName!,
                                                               address: widget.address!,
                                                               height: widget.height!,
                                                               weight: widget.weight!,
                                                               emailId: widget.emailId,
                                                               phoneNumber: widget.phoneNumber,
                                                               patientId: widget.patientId!,
                                                               testId: getClinicalTests.allClinicalTestList[index]!.sId!,
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
                                                            title: const Center(child: Text('Are you sure you want to delete patient test?')),
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
                                                                      Provider.of<DeleteClinicalTestByIdProvider>(context,listen: false).
                                                                      delete(context, getClinicalTests.allClinicalTestList[index]!.sId!).then((value) {
                                                                        Navigator.pop(context);
                                                                        Navigator.pushReplacement(context,
                                                                            MaterialPageRoute(builder: (builder) =>
                                                                                AllClinicalTestScreen(
                                                                                  firstName: widget.firstName!,
                                                                                  lastName: widget.lastName!,
                                                                                  emailId: widget.emailId,
                                                                                  phoneNumber: widget.phoneNumber,
                                                                                  height: widget.height,
                                                                                  weight: widget.weight,
                                                                                  address: widget.address,
                                                                                  patientId: widget.patientId,

                                                                                )
                                                                            )
                                                                        );
                                                                      });
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
                                                    const SizedBox(width: 10),
                                                  ],
                                                ),
                                              ),
                                              Positioned.fill(
                                                left: -11,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: InkWell(
                                                    onDoubleTap: () => null,
                                                    onTap: () {
                                                      // Provider.of<StowDetailProvider>(
                                                      //         context,
                                                      //         listen: false)
                                                      //     .hideShowMenu(index);
                                                      // print(getStowData
                                                      //     .newStowList[index].isExpanded);
                                                      getClinicalTests.allClinicalTestList[index]!.isExpanded = !getClinicalTests.allClinicalTestList[index]!.isExpanded;
                                                      setState(() {});
                                                    },
                                                    child: CircleAvatar(
                                                        radius: 11,
                                                        backgroundColor:
                                                        AppColors.buttonColor,
                                                        child: Center(
                                                          child:
                                                          //   Consumer<StowDetailProvider>(
                                                          // builder: (_, getExpandedData,
                                                          //         child) =>
                                                          Icon(
                                                            getClinicalTests.allClinicalTestList[index]!
                                                                .isExpanded
                                                                ? Icons.remove
                                                                : Icons.add,
                                                            color: AppColors.white,
                                                            size: 15,
                                                          ),
                                                          // ),
                                                        )),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Consumer<StowDetailProvider>(
                                  //     builder: (_, visibleValueGet, child) =>
                                  Visibility(
                                    visible: getClinicalTests.allClinicalTestList[index]!.isExpanded ==
                                        true,
                                    // visible : true,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                      child: Container(
                                        color: AppColors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 20),
                                                height: 30,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Row(children: [
                                                    Container(
                                                      child: Text(
                                                        "Chief Complaint : ",
                                                        style: AppUtils.instance
                                                            .textStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Flexible(
                                                        child: Text(
                                                          "${getClinicalTests.allClinicalTestList[index]!.chiefComplaint}",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .buttonColor),
                                                        ))
                                                  ]),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 20),
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color:
                                                AppColors.dropDownColorExpand,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Row(children: [
                                                    Container(
                                                      child: Text(
                                                        "Past Medical History : ",
                                                        style: AppUtils.instance
                                                            .textStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Flexible(
                                                        child: Text(
                                                          "${getClinicalTests.allClinicalTestList[index]!.pastMedicalHistory}",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: AppColors
                                                                  .buttonColor,
                                                              fontSize: 12),
                                                        ))
                                                  ]),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 20),
                                                height: 30,
                                                // color: AppColors.dropDownColorExpand,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Row(children: [
                                                    Container(
                                                      child: Text(
                                                        "Medical Diagnosis : ",
                                                        style: AppUtils.instance
                                                            .textStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Flexible(
                                                        child: Text(
                                                          "${getClinicalTests.allClinicalTestList[index]!.medicalDiagnosis}",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: AppColors
                                                                  .buttonColor,
                                                              fontSize: 12),
                                                        ))
                                                  ]),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 20),
                                                height: 30,
                                                color:
                                                AppColors.dropDownColorExpand,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Row(children: [
                                                    Container(
                                                      child: Text(
                                                        "Prescription : ",
                                                        style: AppUtils.instance
                                                            .textStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Flexible(
                                                        child: Text(
                                                          "${getClinicalTests.allClinicalTestList[index]!.medicalPrescription}",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: AppColors
                                                                  .buttonColor,
                                                              fontSize: 12),
                                                        ))
                                                  ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  // )
                                ],
                              ),
                            );
                          }),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
