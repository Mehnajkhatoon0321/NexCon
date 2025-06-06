

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/my_conference_delegates_view.dart';

import 'package:nexcon/screen/guest_flow/delegates_register_process/conference_category.dart';
import 'package:nexcon/screen/guest_flow/delegates_register_process/conference_category_details.dart';
import 'package:nexcon/screen/guest_flow/delegates_register_process/conference_sub_category.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class DelegatesConference extends StatefulWidget {
  final  String selectedRole;
   const DelegatesConference({required this.selectedRole,super.key});

  @override
  State<DelegatesConference> createState() => _DelegatesConferenceState();
}

class _DelegatesConferenceState extends State<DelegatesConference> {
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
      "id":"1",
      "imageConference": "assets/images/IndianConferences.png",
      "title": "30th ISCB International Conference (ISCBC-2025)",
      "subtitle":
      "Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Indian Society of Chemists and Biologists",
      "allreadyRegister":true,
    },
    {
      "id":"2",
      "upComing": "Science Communication",
      "imageConference": "assets/images/conferencesOrganization1.png",
      "title": "Global Science Summit 2025",
      "subtitle":
      "Theme: Innovations in Science and Technology for a Sustainable Future 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Global Science Network",
      "allreadyRegister":false,
    },
    {
      "id":"3",
      "upComing": "Science Communication",
      "imageConference": "assets/images/conferencesOrganization1.png",
      "title": "Global Science Summit 2025",
      "subtitle":
      "Theme: Innovations in Science and Technology for a Sustainable Future 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Global Science Network",
      "allreadyRegister":false,
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

    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          backgroundColor: AppColors.formFieldBackColour,
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
              'All Conference',
              style: FTextStyle.HeadingTxtWhiteStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(


                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

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
                      SizedBox(
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
                                                          builder: (context) => MyConferenceDelegatesView(id:  conference["id"],

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
                  _showEditDialog(
                    context,
                    conference['id'].toString(), // Pass the selected ID for identification
                        () {
                      // Refresh callback after the dialog is closed
                      print("Dialog Closed, Refresh Callback");
                    },
                    conference['category'], // Pass the initial category of the selected item
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
                                        )



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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
  void _showEditDialog(
      BuildContext context,
      String selectedIds, // Pass the selected ID for identifying the category
      Function refreshCallback,
      String? initialCategory, // Pass the initial category, allowing null
      )
  {
    final formKey = GlobalKey<FormState>();
    String? selectedCategory = initialCategory;

    // Ensure the category list has unique values
    final List<String> uniqueCategoryList = [
      ...Set<String>.from(Constants.categoryName)
    ];

    bool isButtonEnabled = uniqueCategoryList.isNotEmpty;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: const Text(
                "Register Delegate",
                style: FTextStyle.subheading,
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose a Category",
                          style:FTextStyle.subtitle,
                        ),
                        const SizedBox(height: 12),
                        // Dropdown for Category Selection
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          hint: Text(
                            "Select a category",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          items: uniqueCategoryList.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 200), // Set maximum width
                                child: Text(
                                  category,
                                  style: FTextStyle.style,
                                  // overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue; // Update selected value
                              isButtonEnabled = true; // Always enable when dropdown is not empty
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select a category.";
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      child: Text(
                        "Cancel",
                        overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                        softWrap: true, // Enable text wrapping

                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    // Update Button
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () async {
                        if (formKey.currentState!.validate()) {
                          print("Selected Category: $selectedCategory");

                          // Refresh the UI after updating the category
                          refreshCallback();
                          Navigator.of(context).pop();
                        }
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled
                            ? AppColors.appSky
                            : Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Post",
                        style: TextStyle(
                          fontSize: 16,
                          color: isButtonEnabled ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
