import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/screen/authFlow/delegate_register.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import 'package:url_launcher/url_launcher.dart';
class ConferenceCategoryDetails extends StatefulWidget {
 final String selectedRole;
  const ConferenceCategoryDetails({required this.selectedRole,super.key});

  @override
  State<ConferenceCategoryDetails> createState() => _ConferenceCategoryDetailsState();
}

class _ConferenceCategoryDetailsState extends State<ConferenceCategoryDetails> {
  Map<String, dynamic>featuresCategoryDetails =
    {
      "id": "1",
      "title": "30th ISCB International Conference (ISCBC-2025)",
      "subTitle":"Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29",
      "imageConference": "assets/images/IndianConferences.png",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationName": "Indian Society of Chemists and Biologists",
      "startDate":"2025-01-27",
      "endDate":"2025-01-29",
      "nameVenue":"Lucknow,Utter Pradesh India",
      "addressVenue":"Lucknow,,Utter Pradesh, India",
      "city":"Lucknow,,Utter Pradesh, India",
      "contactPerson":"Dr. P.M.S. Chauhan",
      "phone":"9695844884",
      "email":"iscbconference@gmail.com",
      "siteLink":"www.iscbconference.com"
    };




  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ), // Menu icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Conference Details',
          style: FTextStyle.HeadingTxtWhiteStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.001,
        ),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     stops: [0.2, 0.5, 0.95, 0.3],
        //     colors: [
        //       Color(0xffffffff),
        //       Color(0xf5c6f6da),
        //       Color(0xf5c6f6da),
        //       Color(0xf5c6f6da),
        //     ],
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/time.png",
                            height:45,
                            width: 50,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 20.0, 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Start Date :", style: FTextStyle.listTitle),
                                      const SizedBox(width: 5),
                                      Text(
                                        featuresCategoryDetails["startDate"]!,
                                        style: FTextStyle.listTitleSub,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("End Date :", style: FTextStyle.listTitle),
                                      const SizedBox(width: 5),
                                      Text(
                                        featuresCategoryDetails["endDate"]!,
                                        style: FTextStyle.listTitleSub,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      featuresCategoryDetails["organizationImage"]!,
                      height:60 ,
                      width: 100,
                    ),

                  ],
                ),
              ),

              const Divider(color: Colors.black, thickness: 2, height: 3),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 0.5, 0.95, 0.95],
                    colors: [
                      Color(0xffffffff),
                      Color(0xf5c6f6da),
                      Color(0xf5c6f6da),
                      Color(0xf5c6f6da),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 10.0, 10.0),
                  child: Text(
                    featuresCategoryDetails["title"]!,
                    style: FTextStyle.headingMiddle,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                child: Text(
                  featuresCategoryDetails["subTitle"]!,
                  style: FTextStyle.listTitleSub,
                  textAlign: TextAlign.justify,

                ),
              ),
              SizedBox(height: 5,),

              SizedBox(height: 4,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: height*0.1,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fill color
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: AppColors.appSky,
                      width: 3.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // Shadow color with transparency
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 2), // Shadow position (x, y)
                      ),
                    ],),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/locationConference.png",
                              height: 25,
                              width: 40,
                            ),
                            //  const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                      "Name of Venue  :",
                                        style: FTextStyle.listTitle.copyWith(


                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          featuresCategoryDetails["addressVenue"]!,
                          style: FTextStyle.listTitleSub,

                          overflow: TextOverflow.ellipsis,

                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: height*0.1,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fill color
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: AppColors.appSky,
                      width: 3.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // Shadow color with transparency
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 2), // Shadow position (x, y)
                      ),
                    ],),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/locationConference.png",
                              height: 25,
                              width: 40,
                            ),
                            //  const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                      "Address of Venue  :",
                                        style: FTextStyle.listTitle.copyWith(


                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          featuresCategoryDetails["addressVenue"]!,
                          style: FTextStyle.listTitleSub,

                          overflow: TextOverflow.ellipsis,

                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: height*0.1,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fill color
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: AppColors.appSky,
                      width: 3.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // Shadow color with transparency
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 2), // Shadow position (x, y)
                      ),
                    ],),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/locationConference.png",
                              height: 25,
                              width: 40,
                            ),
                            //  const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                      "City :",
                                        style: FTextStyle.listTitle.copyWith(


                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          featuresCategoryDetails["city"]!,
                          style: FTextStyle.listTitleSub,

                          overflow: TextOverflow.ellipsis,

                        ),
                      ],
                    ),
                  ),
                ),
              ),




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Contact Details :",
                  style: FTextStyle.listTitle.copyWith(
                      fontSize: 17

                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 46,
                              child:
                              Text(
                                "Organized by :",
                                style: FTextStyle.listTitle,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Contact Person :", style: FTextStyle.listTitle),
                            // SizedBox(height: 5),
                            // Text("Phone :", style: FTextStyle.listTitle),
                            // SizedBox(height: 5),
                            // Text("Email :", style: FTextStyle.listTitle),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                featuresCategoryDetails["organizationName"]!,
                                style: FTextStyle.listTitleSub,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 7),
                              Text(
                                featuresCategoryDetails["contactPerson"]!,
                                style: FTextStyle.listTitleSub,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/site.png",
                    height: 25,
                    width: 40,
                  ),
                  //  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          GestureDetector(
                            onTap: () async {
                              final url = "https://${featuresCategoryDetails["siteLink"]}/"!;
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                // Handle the error if the URL cannot be opened
                                debugPrint("Could not launch $url");
                              }
                            },
                            child: Text(
                              featuresCategoryDetails["siteLink"]!,
                              style: FTextStyle.listTitleSub.copyWith(
                                color: Colors.blue,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/email.png",
                    height: 26,
                    width: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final email = featuresCategoryDetails["email"]!;
                              final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: email,
                              );

                              if (await canLaunchUrl(emailUri)) {
                                await launchUrl(emailUri);
                              } else {
                                // Handle the error (e.g., show a Snackbar or Dialog)
                                print("Could not launch email composer.");
                              }
                            },
                            child: Text(
                              featuresCategoryDetails["email"]!,
                              style: FTextStyle.listTitleSub.copyWith(
                                color: Colors.blue,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/phone.png",
                    height: 26,
                    width: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                      child: Text(
                        featuresCategoryDetails["phone"]!,
                        style: FTextStyle.listTitleSub.copyWith(
                          // color: Colors.blue,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding:  EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DelegateRegister(title :featuresCategoryDetails["title"],selectedRole:widget.selectedRole),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: AppColors.appSky,
                    elevation: 2,
                    minimumSize: Size(130, 35),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: Text(
                    "Register Now",
                    style: FTextStyle.loginBtnStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
