import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AddClinicalTest/add_clinical_test.dart';
import '../AddPatient/add_patient_screen.dart';
import '../EditClinicalTest/edit_clinical_test_screen.dart';
import '../EditPatient/edit_patient_screen.dart';
import '../utils/app_color.dart';
import '../utils/app_utils.dart';
import 'Model/clinical_test_model.dart';

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

  List<ClinicalTestModel> clinicalTest = [
    ClinicalTestModel("11", "100", "test", "test", "100", "pastHistory", "prescription", "100",false),
    ClinicalTestModel("11", "100", "test", "test", "100", "pastHistory", "prescription", "100",false),
    ClinicalTestModel("11", "100", "test", "test", "100", "pastHistory", "prescription", "100",false),
    ClinicalTestModel("11", "100", "test", "test", "100", "pastHistory", "prescription", "100",false)
  ];

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
                                const AddClinicalTestScreen()
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

                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: clinicalTest.length,
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

                // // child: Text(
                // //       "PO number: ${provider.stowItemDetailModel!.data![index].poNumber} / Line Item No. ${provider.searchPOModel!.data![index].lineItemNo} / ${provider.searchPOModel!.data![index].vendorName}"
                // //   ),
                //                               ),
                //                               SizedBox(
                //                                 height: 1,
                //                                 width: MediaQuery.of(context).size.width,
                //                                 child: Container(
                //                                   color: AppColors.grey,
                //                                 ),
                //                               ),
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
                                                    Container(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      child: Text(
                                                        "Blood Pressure : ${clinicalTest[index].bloodPressure} ",
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
                                                        "Heart Rate : ${clinicalTest[index].heartBeat} ",
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
                                                        "respiratoryRate : ${clinicalTest[index].respiratoryRate} ",
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
                                                        "blood Oxygen Level : ${clinicalTest[index].bloodOxygen} ",
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
                                                      const EditClinicalTest()
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
                                                              onPressed: () => Navigator.pop(context, 'OK'),
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
                                                clinicalTest[index].isExpanded = !clinicalTest[index].isExpanded;
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
                                                        clinicalTest[index]
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
                                      visible: clinicalTest[index].isExpanded ==
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
                                                          "chief Complaint : ",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                        "${clinicalTest[index].chiefComplaint}",
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
                                                          "past Medical History : ",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                        "${clinicalTest[index].pastHistory}",
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
                                                          "medical Diagnosis : ",
                                                          style: AppUtils.instance
                                                              .textStyle(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                        "${clinicalTest[index].diagnosis}",
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
                                                        "${clinicalTest[index].prescription}",
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
            ),
          ),
        ),
      ),
    );
  }
}
