import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class SubCategoryScreen extends StatefulWidget {
  String id;
  String  name;
   SubCategoryScreen({super.key,required this.id,required this.name});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  List<Map<String, dynamic>> FeaturesList = [
    {
      "id":"1",
      "upComing": "Chemistry",
      "imageConference": "assets/images/IndianConferences.png",
      "title": "30th ISCB International Conference (ISCBC-2025)",
      "subtitle":
      "Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Indian Society of Chemists and Biologists",
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
    },


  ];
  @override
  Widget build(BuildContext context) {
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
          'Conference SubCategory',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
    );
  }
}
