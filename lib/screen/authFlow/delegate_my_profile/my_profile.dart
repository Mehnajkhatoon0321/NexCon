import 'package:flutter/material.dart';

import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/font_text_Style.dart';




class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  Map<String, dynamic> profileData = {
    "Delegate Registration Number": "00014027",
    "Name": "Ms Mehnaj Khatoon",
    "Sex": "Female",
    "Date of Birth": "2003-08-01",
    "Email": "mehnaj0321@gmail.com",
    "Designation/Profession": "Flutter Developer",
    "Institution/Affiliation": "Webgrade Technology",
    "City": "Lucknow",
    "Country": "India",
    "Address for Correspondence": "DLF my pad India",
    "Telephone (O)": "+43546456456",
    "Telephone (R)": "+43546456456",
    "Mobile": "9695844884",
    "Website": "https://smartconference.in/cms/delegate/dashboard"
  };

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));

    var height = MediaQuery
        .of(context)
        .size
        .height;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(

        backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Container(
                        width: height * 0.13, // Adjust width as needed
                        height: height * 0.13, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200, // Background color for placeholder
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child:
                  Column(
                    children: profileData.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${entry.key}:",
                                style: FTextStyle.style.copyWith(color:Colors.black),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                child: Text(
                                  entry.value.toString(),
                                  style: FTextStyle.style,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )

                ),

                SizedBox(height: 40,)
              ],
            ),
          )

// Helper function to build rows for information display


    ),
    );
  }

}
