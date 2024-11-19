import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_conference/screen/authFlow/delegate_register.dart';
import 'package:smart_conference/screen/delegates_section/conference_category.dart';
import 'package:smart_conference/screen/delegates_section/conference_category_details.dart';
import 'package:smart_conference/screen/delegates_section/conference_sub_category.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';

class FeaturedConferences extends StatefulWidget {
  const FeaturedConferences({super.key});

  @override
  State<FeaturedConferences> createState() => _FeaturedConferencesState();
}

class _FeaturedConferencesState extends State<FeaturedConferences> {
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

  List<Map<String, dynamic>> FeaturesList = [
    {
      "upComing": "Chemistry",
      "imageConference": "assets/images/IndianConferences.png",
      "title": "30th ISCB International Conference (ISCBC-2025)",
      "subtitle":
          "Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Indian Society of Chemists and Biologists",
    },
    {
      "upComing": "Science Communication",
      "imageConference": "assets/images/conferencesOrganization1.png",
      "title": "Global Science Summit 2025",
      "subtitle":
          "Theme: Innovations in Science and Technology for a Sustainable Future 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Global Science Network",
    },
  ];
  List<Map<String, dynamic>> FeaturesCategoryList = [
    {
      "id": "1",
      "title": "Chemistry",
      "imageConference": "assets/images/IndianConferences.png",
    },
    {
      "id": "2",
      "title": "Education",
      "imageConference": "assets/images/IndianConferences.png",
    },
    {
      "id": "3",
      "title": "Social",
      "imageConference": "assets/images/IndianConferences.png",
    },
    {
      "id": "4",
      "title": "English",
      "imageConference": "assets/images/IndianConferences.png",
    },
    {
      "id": "5",
      "title": "Math",
      "imageConference": "assets/images/IndianConferences.png",
    },
    {
      "id": "6",
      "title": "History",
      "imageConference": "assets/images/IndianConferences.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          backgroundColor: AppColors.formFieldBackColour,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                // decoration: BoxDecoration(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: AppColors.appSky,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              // Center the icon within the container
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 25,
                                  ), // Menu icon
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
                          child: Text(
                            "Which conference topics would you like to join?",
                            style: FTextStyle.headingMiddle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: height * 0.30,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          // Horizontal scroll
                          itemCount: FeaturesCategoryList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 13,
                                  crossAxisSpacing: 13 // Show 2 items per row
                                  ),
                          itemBuilder: (context, index) {
                            if (index == 5 && FeaturesCategoryList.length > 5) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white, // Fill color
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: AppColors.appSky,
                                      width: 1.0,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        // Shadow color with transparency
                                        spreadRadius: 2,
                                        // Spread radius
                                        blurRadius: 5,
                                        // Blur radius
                                        offset: Offset(
                                            0, 3), // Shadow position (x, y)
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Circular Image
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConferenceCategory()),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: AppColors.appSky,
                                                // Button color
                                                shape: BoxShape.circle,
                                                // Circular shape
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 6.0,
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    spreadRadius: 2.0,
                                                  ),
                                                ],
                                              ),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: 30,
                                                ), // Menu icon
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ConferenceCategory()),
                                                  );
                                                },
                                              ),
                                              height: 68,
                                              width: 68,
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(height: 8),
                                        // Spacing between image and text
                                        // Text below the image
                                        Expanded(
                                          child: Text(
                                            "View All",
                                            style: FTextStyle.listTitle,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              final category = FeaturesCategoryList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubCategoryScreen(
                                              id: category["id"],
                                              name: category["title"],
                                            )),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, right: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Fill color
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: AppColors.appSky,
                                        width: 1.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          // Shadow color with transparency
                                          spreadRadius: 2,
                                          // Spread radius
                                          blurRadius: 5,
                                          // Blur radius
                                          offset: Offset(
                                              0, 3), // Shadow position (x, y)
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Circular Image
                                          ClipOval(
                                            child: Image.asset(
                                              category["imageConference"],
                                              height: 70,
                                              width: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          // const SizedBox(height: 8),
                                          // Spacing between image and text
                                          // Text below the image
                                          Expanded(
                                            child: Text(
                                              category["title"],
                                              style: FTextStyle.listTitle,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),

                      // const SizedBox(height: 4),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 14.0),
                        child: Text(
                          "Explore Conferences",
                          style:
                              FTextStyle.headingMiddle.copyWith(fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SizedBox(
                          width: width,
                          height: height * 0.45, // Adjust height as needed
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: FeaturesList.length,
                            itemBuilder: (context, index) {
                              final conference = FeaturesList[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  height: height * 0.35,
                                  // Set fixed height for each card
                                  width: height * 0.3,
                                  // Set fixed width for each card
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(
                                    //   color: Colors.black,
                                    //   width: 1.0,
                                    // ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              // bottomLeft: Radius.circular(10),
                                              // bottomRight: Radius.circular(10),
                                            ),
                                            child: Image.asset(
                                              conference["imageConference"],
                                              height: height * 0.19,
                                              // Set image height to half of the card
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 4,
                                            child: Container(
                                              width: width / 3,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(60),
                                                  bottomRight:
                                                      Radius.circular(60),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Text(
                                                  conference["upComing"],
                                                  style: FTextStyle.listTitle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.4,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              top: 8,
                                              right: 8,
                                              bottom: 4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40,
                                                child: Text(
                                                  conference["title"],
                                                  style: FTextStyle.listTitle,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              // const SizedBox(height: 4),

                                              // const SizedBox(height: 4),
                                              // Subtitle with maxLines set to 2 and ellipsis for overflow
                                              Container(
                                                height: 55,
                                                child: Text(
                                                  conference["subtitle"],
                                                  style: FTextStyle.listTitleSub
                                                      .copyWith(fontSize: 13),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    conference[
                                                        "organizationImage"],
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      conference[
                                                          "organizationText"],
                                                      style: FTextStyle
                                                          .listTitleSub
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ConferenceCategoryDetails(),
                                                        ),
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      backgroundColor:
                                                          AppColors.appSky,
                                                      elevation: 2,
                                                      minimumSize: Size(80, 30),
                                                      // Set minimum width and height
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              10), // Adjust padding
                                                    ),
                                                    child: Text(
                                                      "View",
                                                      style: FTextStyle
                                                          .loginBtnStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DelegateRegister(
                                                                  title: conference[
                                                                      "title"]),
                                                        ),
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      backgroundColor:
                                                          AppColors.appSky,
                                                      elevation: 2,
                                                      minimumSize: Size(80, 30),
                                                      // Set minimum width and height
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              10), // Adjust padding
                                                    ),
                                                    child: Text(
                                                      "Register Now",
                                                      style: FTextStyle
                                                          .loginBtnStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // const SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
