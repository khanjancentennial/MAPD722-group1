import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapd722_group1/EditPatient/edit_patient_screen.dart';
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

class HomeScreen extends StatefulWidget {
  String? firstName;
  String? lastName;
  HomeScreen({this.lastName,this.firstName, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<HomeScreenData> homeScreenData = [
    HomeScreenData("Khanjan Dave", "khanjan@gmail.com", "Critical"),
    HomeScreenData("Khanjan Dave", "khanjan@gmail.com", "Normal"),
    HomeScreenData("Khanjan Dave", "khanjan@gmail.com", "Normal")
  ];


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
                                // controller: emailController,
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

                                // onChanged: (emailValue){
                                //   Provider.of<LoginProvider>(context,listen: false).emailStructure(emailValue);
                                //   // print(emailValue);
                                // },
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: homeScreenData.length,
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
                                                          Text(homeScreenData[index].name!,
                                                            style: AppUtils.instance.textStyle(
                                                              fontSize: 26,
                                                              fontWeight: FontWeight.bold
                                                            )
                                                          ),
                                                          const SizedBox(height: 5),
                                                          Text("Email id:- ${homeScreenData[index].emailId!}",
                                                            style: AppUtils.instance.textStyle(
                                                                fontSize: 16,
                                                            ),
                                                          ),
                                                          const SizedBox(height: 5),
                                                          Text("Patient Status:- ${homeScreenData[index].status!}",
                                                            style: AppUtils.instance.textStyle(
                                                              fontSize: 16,
                                                              color: homeScreenData[index].status! == "Critical" ? AppColors.red : AppColors.green
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
                                                                    const EditPatientDetails()
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
                                                          ],
                                                        ),
                                                        const SizedBox(height: 10),
                                                        InkWell(
                                                          onTap: (){
                                                            Navigator.push(context,
                                                                MaterialPageRoute(builder: (builder)=>
                                                                AllClinicalTestScreen()
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
                                                        ),
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

                              }),
                        ]),
                  )),
            ),
          ),
        ),


      );

    Container();
  }
}



//
//
// ListView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: getStowData.newStowList.length,
// itemBuilder: (context,index){
// return Padding(
// padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
// child: Column(
// children: [
// Container(
// child: Card(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// padding: EdgeInsets.only(left: 20,right: 15,top: 10,bottom: 10),
//
// child: RichText(
// text: TextSpan(
// children: [
// TextSpan(
// text:  "PO number: ",
// style: AppUtils.instance.textStyle(
// color: AppColors.buttonColor,
// fontSize: 12)
// ),
// TextSpan(
// text:  "${getStowData.newStowList[index].poNumber} ",
// style: AppUtils.instance.textStyle(
// color: AppColors.buttonColor,
// fontSize: 12,
// fontWeight: FontWeight.bold)
// ),
// TextSpan(
// text:  "/ Line Item No. ",
// style: AppUtils.instance.textStyle(
// color: AppColors.buttonColor,
// fontSize: 12)
// ),
// TextSpan(
// text:  "${getStowData.newStowList[index].lineItemNo} ",
// style: AppUtils.instance.textStyle(
// color: AppColors.buttonColor,
// fontSize: 12,
// fontWeight: FontWeight.bold)
// ),
// TextSpan(
// text:  "/ ",
// style: AppUtils.instance.textStyle(
// color: AppColors.buttonColor,
// fontSize: 12)
// ),
// TextSpan(
// text:  "${getStowData.newStowList[index].vendorName}",
// style: AppUtils.instance.textStyle(
// color: AppColors.buttonColor,
// fontSize: 12,
// fontWeight: FontWeight.bold)
// ),
// ],
// ),
// ),
//
// // child: Text(
// //       "PO number: ${provider.stowItemDetailModel!.data![index].poNumber} / Line Item No. ${provider.searchPOModel!.data![index].lineItemNo} / ${provider.searchPOModel!.data![index].vendorName}"
// //   ),
//
// ),
// SizedBox(
// height: 1,
// width: MediaQuery.of(context).size.width,
// child: Container(
// color: AppColors.grey,
// ),
// ),
// Stack(
// clipBehavior:Clip.none ,
// children: [
// Container(
// padding: EdgeInsets.only(top: 10,bottom: 10,left: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Flexible(
// child: Container(
// width: MediaQuery.of(context).size.width,
// child: Text("Vendor Part : ${getStowData.newStowList[index].vendorPartNumber} ",
// style: AppUtils.instance.textStyle(
// fontSize: 13,fontWeight: FontWeight.bold
// ),
// ),
// ),
// ),
// SizedBox(width: 5),
//
// Padding(
// padding: const EdgeInsets.only(right: 20),
// child: InkWell(
// onDoubleTap: () => null,
// onTap: (){
// print(index);
// getStowData.checkItem(index,context);
//
// print(getStowData.newStowList[index].isChecked);
// },
// child: Consumer<StowDetailProvider>(
// builder: (_,selectValueGet,child) {
// return CircleAvatar(
// radius: 11,
// backgroundColor: selectValueGet.newStowList[index].isChecked?
// AppColors.green:Colors.grey[400],
// child: Center(
// child: Icon(
// Icons.check,
// color: AppColors.white,
// size: 15,
// )
// )
// );
// }
// ),
// ),
// ),
//
// ],
// ),
// /* SizedBox(height: 5),
//                                                                       RichText(
//                                                                         text: TextSpan(
//                                                                           children: [
//                                                                             TextSpan(
//                                                                                 text:  "Description : ",
//                                                                                 style: AppUtils.instance.textStyle(
//                                                                                     fontSize: 12)
//                                                                             ),
//                                                                             TextSpan(
//                                                                                 text:  "${provider.stowItemDetailModel!.data![index].vendorName}",
//                                                                                 style: AppUtils.instance.textStyle(
//                                                                                     fontSize: 12,
//                                                                                     fontWeight: FontWeight.bold)
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),*/
// ],
// ),
// ),
// Positioned.fill(
// left: -11,
// child: Align(
// alignment: Alignment.centerLeft,
// child: InkWell(
// onDoubleTap: () => null,
// onTap: (){
// Provider.of<StowDetailProvider>(context,listen: false).hideShowMenu(index);
// print(getStowData.newStowList[index].isExpanded);
// },
// child: CircleAvatar(
// radius: 11,
// backgroundColor: AppColors.buttonColor,
// child: Center(
// child: Consumer<StowDetailProvider>(
// builder: (_,getExpandedData,child) =>  Icon(
// getExpandedData.newStowList[index].isExpanded ?
// Icons.remove :
// Icons.add,
// color: AppColors.white,
// size: 15,
// ),
// ),
// )
// ),
// ),
// ),
// )
// ],
// ),
// ],
// ),
// ),
// ),
// Consumer<StowDetailProvider>(
// builder: (_,visibleValueGet,child) => Visibility(
// visible: visibleValueGet.newStowList[index].isExpanded == true,
// // visible : true,
// child: Padding(
// padding: const EdgeInsets.only(left: 5,right: 5),
// child: Container(
// color: AppColors.white,
// child:Padding(
// padding: const EdgeInsets.only(top: 15),
// child: Column(
// children: [
// Container(
// padding: EdgeInsets.only(left: 20),
// height: 30,
// child: Align(
// alignment: Alignment.centerLeft,
// child:  Row(
// children: [
// Container(
// child: Text("Item Status : ",
// style: AppUtils.instance.textStyle(
// fontSize: 12
// ),
// ),
// ),
// Flexible(
// child: Text("${getStowData.newStowList[index].itemStatus == "0" ? "Normal":"Damaged"}",
// style: AppUtils.instance.textStyle(
// fontWeight: FontWeight.bold,
// fontSize: 12,color: AppColors.buttonColor
// ),
// )
// )
// ]
// ),
// ),
// ),
// Container(
// padding: EdgeInsets.only(left: 20),
// height: 30,
// width: MediaQuery.of(context).size.width,
// color: AppColors.dropDownColorExpand,
// child: Align(
// alignment:Alignment.centerLeft ,
// child: Row(
// children: [
// Container(
// child: Text("Received Date, Time : ",
// style: AppUtils.instance.textStyle(
// fontSize: 12
// ),
// ),
// ),
// Flexible(
// child: Text("${getStowData.addDate.isEmpty ? "":getStowData.addDate[index]}"
// "${getStowData.addDate.isEmpty ? "":getStowData.addDate[index] == "01" ||
// getStowData.addDate.isEmpty ? "":getStowData.addDate[index] == "21" ||
// getStowData.addDate.isEmpty ? "":getStowData.addDate[index] == "31"? "st"
//     :
// getStowData.addDate.isEmpty ? "":getStowData.addDate[index] == "02" ||
// getStowData.addDate.isEmpty ? "":getStowData.addDate[index] == "22"? "nd"
//     :
// getStowData.addDate.isEmpty ? "":getStowData.addDate[index] == "03" ? "rd":"th"} "
// "${getStowData.addMonth.isEmpty ? "":getStowData.addMonth[index]} "
// "${getStowData.addMonth.isEmpty ? "":getStowData.addTime[index]}",
// style: AppUtils.instance.textStyle(
// fontWeight: FontWeight.bold,
// color: AppColors.buttonColor,
// fontSize: 12
// ),
// )
// )
// ]
// ),
// ),
// ),
// Container(
// padding: EdgeInsets.only(left: 20),
// height: 30,
// // color: AppColors.dropDownColorExpand,
// child: Align(
// alignment: Alignment.centerLeft,
// child: Row(
// children: [
// Container(
// child: Text("Update Location : ",
// style: AppUtils.instance.textStyle(
// fontSize: 12
// ),
// ),
// ),
// Flexible(
// child: Text("${getStowData.newStowList[index].locationId == "" || getStowData.newStowList[index].locationId == null
// ? "Not Assigned" :getStowData.newStowList[index].locationId}",
// style: AppUtils.instance.textStyle(
// fontWeight: FontWeight.bold,
// color: AppColors.buttonColor,
// fontSize: 12
// ),
// )
// )
// ]
// ),
// ),
// ),
// Container(
// padding: EdgeInsets.only(left: 20),
// height: 30,
// color: AppColors.dropDownColorExpand,
// child: Align(
// alignment:Alignment.centerLeft ,
// child: Row(
// children: [
// Container(
// child: Text("Location Status : ",
// style: AppUtils.instance.textStyle(
// fontSize: 12
// ),
// ),
// ),
// Flexible(
// child: Text("${getStowData.newStowList[index].itemLocationStatus}",
// style: AppUtils.instance.textStyle(
// fontWeight: FontWeight.bold,
// color: AppColors.buttonColor,
// fontSize: 12
// ),
// )
// )
// ]
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// )
// )
// ],
// ),
// );
//
// }),