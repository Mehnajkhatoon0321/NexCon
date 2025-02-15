import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/screen/authFlow/delegate_register.dart';
import 'package:nexcon/screen/delegates_section/delegates_register_process/conference_category.dart';
import 'package:nexcon/screen/delegates_section/delegates_register_process/conference_category_details.dart';
import 'package:nexcon/screen/delegates_section/delegates_register_process/conference_sub_category.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class FeaturedConferences extends StatefulWidget {
  final String selectedRole;
  const FeaturedConferences({required this.selectedRole,super.key});

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
                            decoration: const BoxDecoration(
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
                                  icon: const Icon(
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
                      const SizedBox(
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

                      const SizedBox(
                        height: 5,
                      ),
                  Container(
                    height: height * 0.30,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(), // Disables scrolling
                      scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                      itemCount: FeaturesCategoryList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two items per row
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 13,
                      ),
                      itemBuilder: (context, index) {
                        // Special case for "View All" button
                        if (index == 5 && FeaturesCategoryList.length > 5) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, right: 5),
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
                                    color: Colors.grey.withOpacity(0.5), // Shadow color
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Circular "View All" Button
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ConferenceCategory(
                                              selectedRole: widget.selectedRole,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.appSky, // Button color
                                            shape: BoxShape.circle, // Circular shape
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 6.0,
                                                color: Colors.grey.withOpacity(0.3),
                                                spreadRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => ConferenceCategory(
                                                    selectedRole: widget.selectedRole,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          height: 65,
                                          width: 65,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Spacing between button and text
                                    const Expanded(
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
                          // Display individual categories
                          final category = FeaturesCategoryList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubCategoryScreen(
                                    id: category["id"],
                                    name: category["title"],
                                    selected: widget.selectedRole,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, right: 5),
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
                                      color: Colors.grey.withOpacity(0.5), // Shadow color
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3), // Shadow position (x, y)
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Circular Image
                                      ClipOval(
                                        child: Image.asset(
                                          category["imageConference"],
                                          height: 65,
                                          width: 65,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8), // Spacing between image and text
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
                    height: height * 0.44, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: FeaturesList.length,
                      itemBuilder: (context, index) {
                        final conference = FeaturesList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            height: height * 0.48, // Fixed card height
                            width: height * 0.3, // Fixed card width
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10), // Combined radius
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Conference Image and Tag
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      ),
                                      child: Image.asset(
                                        conference["imageConference"],
                                        height: height * 0.19, // Set image height to a fraction
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 4,
                                      child: Container(
                                        width: width / 3,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(60),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            conference["upComing"],
                                            style: FTextStyle.listTitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Conference Details
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.4,
                                    ),
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Title
                                        SizedBox(
                                          height: 40,
                                          child: Text(
                                            conference["title"],
                                            style: FTextStyle.listTitle,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        // Subtitle
                                        SizedBox(
                                          height: 55,
                                          child: Text(
                                            conference["subtitle"],
                                            style: FTextStyle.listTitleSub.copyWith(
                                              fontSize: 13,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        // Organization Details
                                        Row(
                                          children: [
                                            Image.asset(
                                              conference["organizationImage"],
                                              height: 40,
                                              width: 40,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                conference["organizationText"],
                                                style: FTextStyle.listTitleSub.copyWith(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Buttons
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => ConferenceCategoryDetails(
                                                      selectedRole: widget.selectedRole,
                                                    ),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                backgroundColor: AppColors.appSky,
                                                elevation: 2,
                                                minimumSize: const Size(80, 30),
                                              ),
                                              child: Text(
                                                "View",
                                                style: FTextStyle.loginBtnStyle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => DelegateRegister(
                                                      title: conference["title"],
                                                      selectedRole: widget.selectedRole,
                                                    ),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                backgroundColor: AppColors.appSky,
                                                elevation: 2,
                                                minimumSize: const Size(80, 30),
                                              ),
                                              child: Text(
                                                "Register Now",
                                                style: FTextStyle.loginBtnStyle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
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
