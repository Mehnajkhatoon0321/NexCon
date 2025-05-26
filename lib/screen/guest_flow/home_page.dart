 import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/authFlow/delegate_register.dart';

import 'package:nexcon/screen/guest_flow/side_menu_navbar.dart';

import 'package:nexcon/screen/sideMenu/organizer/how_works_organizer.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import 'delegates_register_process/conference_category.dart';
import 'delegates_register_process/conference_category_details.dart';
import 'delegates_register_process/conference_sub_category.dart';

class HomePage extends StatefulWidget {
  final  String selectedRole;
  const HomePage({super.key,required this.selectedRole});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  bool _isLogoutDialogVisible = false;
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// 🧠 Define this at the top of your widget or class
  int _currentTextIndex = 0;
  int _currentIndex = 0;
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
  final List<Map<String, dynamic>> messages = [
    {
      'title': 'REGISTER YOUR CONFERENCE',
      'subtitle': 'Register & List your Conference for Free',
      'buttonText': 'Register Now',
      'page': HowWorksScreen(),
    },
    {
      'title': 'FIND THE TOPIC OF YOUR INTEREST',
      'subtitle': 'Search the conference in variour categories and topic of your interest',
      'buttonText': 'Boost Now',
      'page': HowWorksScreen(),
    },
    {
      'title': 'SAAS BASED CONFERENCE MANAGEMENT SYSTEM',
      'subtitle': 'Get access to our Conference Management System',
      'buttonText': 'Learn More',
      'page': HowWorksScreen(),
    },
  ];
  final List<Map<String, dynamic>> horizontalItems = [
    {
      "icon": Icons.event,
      "title": "14+",
      "subtitle": "Conferences",
    },
    {
      "icon": Icons.people,
      "title": "4,000+",
      "subtitle": "Users",
    },
    {
      "icon": Icons.description,
      "title": "1,500+",
      "subtitle": "Research Papers",
    },
  ];
  final List<Map<String, dynamic>> howToWork= [
    {
      "icon": Icons.library_books,
      "title": "Register a Conference+",
      "subtitle": "Register your conference for FREE listing and get our BASIC membership.",
    },
    {
      "icon": Icons.upgrade_outlined,
      "title": "Upgrade to Premium Membership",
      "subtitle": "Upgrade membership from BASIC to PRO or ELITE and get access to our Conference Management System.",
    },
    {
      "icon": Icons.phonelink_setup,
      "title": "Setup your Conference",
      "subtitle": "Setup your conference and start managing all your conference related activities..",
    },
  ];
  final List<String> images = [
    'https://smartconference.in/assets/images/img2.jpg',
    'https://smartconference.in/assets/images/img1.jpg',

  ];
  final List<Map<String, String>> clients = [
    {
      'image': 'https://smartconference.in/assets/clients/srm-logo.jpg',
      'name': 'SRM University, Chennai',
    },
    {
      'image': 'https://smartconference.in/assets/clients/muj-logo.jpg',
      'name': 'Manipal University Jaipur',
    },
    {
      'image': 'https://smartconference.in/assets/clients/iscb-logo.jpg',
      'name': 'Indian Society of Chemists & Biologists',
    },
    {
      'image': 'https://smartconference.in/assets/clients/iscos-logo.jpg',
      'name': 'Indian Science Communication Society',
    },
    {
      'image': 'https://smartconference.in/assets/clients/iswa-logo.jpg',
      'name': "Indian Science Writers' Association",
    },
    {
      'image': 'https://smartconference.in/assets/clients/spjimr-logo.jpg',
      'name': 'SPJIMR, Mumbai',
    },
    {
      'image': 'https://smartconference.in/assets/clients/awoke-logo.jpg',
      'name': 'AWOKE India Foundation',
    },
  ];

  final List<Map<String, String>> testimonials = [
    {
      "quote":
      "We have been using Smart Conference services from last 4 years. The project coordinator from Smart Conference was available 24x7 for queries and always handled everything with ease and confidence...",
      "name": "Dr. PMS Chauhan",
      "position": "General Secretary, ISCB"
    },
    {
      "quote":
      "We are very impressed by the expertise that Smart Conference offers. We have retained Smart Conference services to facilitate our upcoming conference’s online registration process...",
      "name": "Prof. A. P. Singh",
      "position": "Vice Chairman, ISCOS"
    },
  ];
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startAutoSwitching();
  }

  void _startAutoSwitching() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentTextIndex = (_currentTextIndex + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List<Map<String, dynamic>> FeaturesCategoryList = [
    {
      "id": "1",
      "title": "Chemistry",
      "imageConference": "assets/images/chemistry.png",
    },
    {
      "id": "2",
      "title": "Education",
      "imageConference": "assets/images/education.png",
    },
    {
      "id": "3",
      "title": "Social Science",
      "imageConference": "assets/images/social-science.png",
    },
    {
      "id": "4",
      "title": "English",
      "imageConference": "assets/images/english.png",
    },
    {
      "id": "5",
      "title": "Math",
      "imageConference": "assets/images/math.png",
    },
    {
      "id": "6",
      "title": "History",
      "imageConference": "assets/images/IndianConferences.png",
    },
  ];

  List<String> featuresList = [
  "Register a conference for free",
  "Reach out to our large number of registered users",
  "Get access to Conference Management System",
  "24 x 7 online support",
  "Accept payments in INR, USD & EURO",
  "Pay only for delegates registered"
  ];

  List<Map<String, dynamic>> ourClientList =[
    {
      "image":"",
      "title":"SRM University, Chennai"

    },
    {
      "image":"",
      "title":"Indian Science Communication Society"
    },
    {
      "image":"",
      "title":"AWOKE India Foundation"
    },
    {
      "image":"",
      "title":"Indian Science Writers' Association"
    } ,
    {
      "image":"",
      "title":"Manipal University Jaipur"
    } ,
    {
      "image":"",
      "title":"Indian Society of Chemists & Biologists"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 32,
          ), // Menu icon
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Open the drawer
          },
        ),
        title: Text(
          'Home Page',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        // Title of the app bar
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      drawer: SideMenuScreen(selectedRole: widget.selectedRole),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🌄 Banner
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bannerOffers.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(messages[_currentTextIndex]['title'], style: FTextStyle.appBarTitleWhite),
                      SizedBox(height: 6),
                      Text(
                        messages[_currentTextIndex]['subtitle'],
                        style: FTextStyle.appBarTitleWhite.copyWith(fontSize: 15, color: AppColors.backgroundColor),
                        maxLines: 2,
                      ),
                      SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => messages[_currentTextIndex]['page'],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 3,
                        ),
                        child: Text(
                          messages[_currentTextIndex]['buttonText'],
                          style: FTextStyle.appBarTitleWhite.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  messages.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    width: _currentTextIndex == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentTextIndex == index ? Colors.green : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Featured Conferences", style: FTextStyle.headingMiddle.copyWith(fontSize: 16)),
                          Text("View the top rated upcoming conferences", style: FTextStyle.style),
                        ],
                      ),
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Explore Conferences by Topics", style: FTextStyle.headingMiddle.copyWith(fontSize: 16)),
                          Text("View the upcoming conferences in various categories and topics of your interest.", style: FTextStyle.style),
                        ],
                      ),
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                      child: Container(
                        height: height * 0.30,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: FeaturesCategoryList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 13,
                            crossAxisSpacing: 13,
                          ),
                          itemBuilder: (context, index) {
                            if (index == 5 && FeaturesCategoryList.length > 5) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: AppColors.appSky, width: 1.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ConferenceCategory(selectedRole: widget.selectedRole),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: AppColors.appSky,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 6.0,
                                                    color: Colors.grey.withOpacity(0.3),
                                                    spreadRadius: 2.0,
                                                  ),
                                                ],
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ConferenceCategory(selectedRole: widget.selectedRole),
                                                    ),
                                                  );
                                                },
                                              ),
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Expanded(
                                          child: Text("View All", style: FTextStyle.listTitle, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
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
                                        selected: widget.selectedRole,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0, right: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(color: AppColors.appSky, width: 1.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              category["imageConference"],
                                              height: 65,
                                              width: 65,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
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
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green.shade50, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Most trusted and comprehensive conference management system",
                        style: FTextStyle.subheading,
                      ),
                    ),
                    SizedBox(height: 15,),
                    ...featuresList.map((feature) {
                      int index = featuresList.indexOf(feature);
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle_outline, color: Colors.green.shade600, size: 20),
                              SizedBox(width: 12),
                              Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade800,
                                  height: 1.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          if (index != featuresList.length - 1)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Divider(color: Colors.green.shade100, thickness: 0.5),
                            ),
                        ],
                      );
                    }).toList(),
                    SizedBox(height: 15),

                    // Center(
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                    //     child: Row(
                    //       children: horizontalItems.map((item) {
                    //         return Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Icon(
                    //               item["icon"],
                    //               size: 30,
                    //               color: AppColors.appSky,
                    //             ),
                    //
                    //             const SizedBox(height: 14),
                    //             Text(
                    //               item["title"],
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 18,
                    //                 color: Colors.green.shade900,
                    //                 letterSpacing: 0.5,
                    //               ),
                    //               textAlign: TextAlign.center,
                    //               maxLines: 1,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //             const SizedBox(height: 8),
                    //             Text(
                    //               item["subtitle"],
                    //               style: FTextStyle.style.copyWith(
                    //                 fontSize: 12,
                    //                 color: Colors.grey.shade700,
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //               textAlign: TextAlign.center,
                    //               maxLines: 2,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //             VerticalDivider(color: AppColors.appSky,),
                    //           ],
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                Divider(color: AppColors.appSky,thickness: 0.5,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How It Works",
                            style: FTextStyle.headingMiddle.copyWith(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Register your conference for free and start using our Conference Management System.",
                            style: FTextStyle.style,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      child: Row(
                        children: howToWork.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 240,
                              height: 230,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: AppColors.appSky, width: 1.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      item["icon"],
                                      size: 50,
                                      color: AppColors.appSky,
                                    ),
                                    const SizedBox(height: 14),
                                    Text(
                                      item["title"],
                                      style: FTextStyle.subheading.copyWith(height: 1),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item["subtitle"],
                                      style:FTextStyle.style.copyWith(height: 1.4),
                                      textAlign: TextAlign.center,

                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Divider(color: AppColors.appSky,thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How Our Users Feel",
                            style: FTextStyle.headingMiddle.copyWith(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 4,),
                          Text(
                            "Here's what our  satisfied conference organisers and delegates feel after using our conference management system.",
                            style: FTextStyle.style,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CarouselSlider.builder(
                            itemCount: testimonials.length,
                            itemBuilder: (context, index, realIdx) {
                              final testimonial = testimonials[index];
                              return Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '“${testimonial['quote']}”',
                                      textAlign: TextAlign.center,
                                      style: FTextStyle.style.copyWith(
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      testimonial['name']!,
                                      style: FTextStyle.subtitle,
                                    ),
                                    Text(
                                      testimonial['position']!,
                                      style: FTextStyle.style.copyWith(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: height*0.36,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 12,
                            runSpacing: 12,
                            children: images.asMap().entries.map((entry) {
                              final isActive = _currentIndex == entry.key;
                              return GestureDetector(
                                onTap: () => setState(() => _currentIndex = entry.key),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: isActive ? 90.0 : 50.0,
                                  height: isActive ? 90.0 : 50.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isActive ? AppColors.appSky : Colors.grey,
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(entry.value),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          child: Center(
                            child: Text(
                              "Our Clients",
                              style: FTextStyle.headingMiddle.copyWith(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: height*0.19,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.4,
                            enableInfiniteScroll: true,
                          ),
                          items: clients.map((client) {
                            final isActive = _currentIndex == client;
                            return Builder(
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      client['image']!,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      client['name']!,
                                      textAlign: TextAlign.center,
                                      style:isActive?FTextStyle.style:FTextStyle.subtitle,
                                    ),


                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),

                      ],
                    ),



                    SizedBox(height: 25),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: Center(
                        child: Text(
                          "Follow Us",
                          style: FTextStyle.headingMiddle.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        )



    );
  }



}

