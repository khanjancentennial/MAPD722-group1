import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Login/LoginScreen.dart';
import '../utils/app_color.dart';
import '../utils/app_images.dart';
import '../utils/app_utils.dart';
import '../utils/custome_popup.dart';

class HomeScreen extends StatefulWidget {
  String? firstName;
  String? lastName;
  HomeScreen({this.lastName,this.firstName, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return
      // Container(
      //   color: AppColors.white,
      //   child: FutureBuilder(
      //       future: Provider.of<GetProfileDetailProvider>(context, listen: false).userDetails(context,userId, accessToken)
      //           .then((value) {
      //         Provider.of<SelectSiteProvider>(context, listen: false).getListFromToken(context,accessToken)
      //             .then((value) {
      //           Provider.of<AllSiteDetailDataProvider>(context, listen: false).getAllSiteDetailData(accessToken);
      //           Provider.of<AllStorageDetailProvider>(context, listen: false).getAllStorageDetailData(accessToken,context);
      //
      //         });
      //       }),
      //       builder: (contextBuilder, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           return
      //             Consumer<GetProfileDetailProvider>(
      //                 builder: (_,getProfileData,child) {
      //                   return getProfileData.checkInternet == false ?
      //                   Consumer2<SelectSiteProvider,AllStorageDetailProvider>(
      //                       builder: (_,getSelectSiteData,allStorageDetailProvider,child) {
      //                         return getSelectSiteData.checkInternet == false && allStorageDetailProvider.checkInternet ==false?
      //                         Scaffold(
      //                           backgroundColor: AppColors.white,
      //                           appBar: CommonAppBar(
      //                             leading: Column(
      //                               mainAxisSize: MainAxisSize.min,
      //                               crossAxisAlignment: CrossAxisAlignment.start,
      //                               children: [
      //                                 SizedBox(
      //                                   height: 38,
      //                                 ),
      //                                 Container(
      //                                   width: 250,
      //                                   child: Consumer<GetProfileDetailProvider>(
      //                                       builder: (_, detailData, __) {
      //                                         return RichText(
      //                                             text: TextSpan(
      //                                               children: [
      //                                                 TextSpan(
      //                                                     text: "Hello ",
      //                                                     style: AppUtils.instance.textStyle(
      //                                                         fontSize: 18,
      //                                                         fontWeight: FontWeight.bold)),
      //                                                 TextSpan(
      //                                                   // text: "Caldwell",
      //                                                     text: "${detailData.getUserDetail!.data!.firstName ?? ""} ",
      //                                                     style: AppUtils.instance.textStyle(
      //                                                         fontSize: 18,
      //                                                         fontWeight: FontWeight.bold,
      //                                                         color: AppColors.buttonColor))
      //                                               ],
      //                                             )
      //                                         );
      //                                       }
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             height: 90,
      //                             backgroundColor: AppColors.homeScreenColor,
      //                             actions: [
      //                               Padding(
      //                                 padding: const EdgeInsets.only(right: 10, top: 20),
      //                                 child: PopupMenuButton(
      //                                     shape: RoundedRectangleBorder(
      //                                         borderRadius: BorderRadius.all(Radius.circular(5.0))),
      //                                     offset: Offset(0, 40),
      //                                     icon: Icon(
      //                                       Icons.more_horiz,
      //                                       color: AppColors.buttonColor,
      //                                       size: 40,
      //                                     ),
      //                                     itemBuilder: (context) => [
      //                                       PopupMenuItem(
      //                                           child: Row(
      //                                             children: [
      //                                               Image.asset("${AppImage.user}",
      //                                                 height: 20,
      //                                                 width: 20,
      //                                               ),
      //                                               SizedBox(width: 10),
      //                                               Text(
      //                                                 'Edit Profile',
      //                                                 style: AppUtils.instance.textStyle(),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           value: 0),
      //                                       PopupMenuItem(
      //                                           child: Row(
      //                                             children: [
      //                                               Image.asset("${AppImage.logoutButton}",
      //                                                 height: 20,
      //                                                 width: 20,
      //                                               ),
      //                                               SizedBox(width: 10),
      //                                               Text(
      //                                                 'Logout',
      //                                                 style: AppUtils.instance.textStyle(
      //                                                     color: AppColors.darkRed),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           value: 1),
      //                                     ],
      //                                     onSelected: (result) {
      //                                       if (result == 0) {
      //                                         Navigator.push(context,
      //                                           MaterialPageRoute(
      //                                               builder: (context) => EditProfile()),
      //                                         );
      //                                       } else if (result == 1) {
      //
      //                                         Navigator.pushReplacement(context,
      //                                           MaterialPageRoute(
      //                                               builder: (context) => const LoginScreen()),
      //                                         );
      //                                       }
      //                                     }),
      //                               )
      //                             ],
      //                           ),
      //                           body: SingleChildScrollView(
      //                             child: Padding(
      //                               padding: const EdgeInsets.only(bottom: 30),
      //                               child: Container(
      //                                   width: MediaQuery.of(context).size.width,
      //                                   // color: Colors.green,
      //                                   child: SingleChildScrollView(
      //                                     child: Column(
      //                                         crossAxisAlignment: CrossAxisAlignment.start,
      //                                         children: [
      //
      //                                         ]),
      //                                   )),
      //                             ),
      //                           ),
      //                         )
      //                             :
      //                         Center(child: CircularProgressIndicator());
      //                       }
      //                   )
      //                       :
      //                   Center(child: CircularProgressIndicator());
      //                 }
      //             );
      //         } else {
      //           return Center(child: CircularProgressIndicator());
      //         }
      //       }),
      // );

    Container();
  }
}
