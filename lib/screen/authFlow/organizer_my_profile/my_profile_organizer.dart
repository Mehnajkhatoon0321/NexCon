import 'package:flutter/material.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class MyProfileOrganizer extends StatefulWidget {
  const MyProfileOrganizer({super.key});

  @override
  State<MyProfileOrganizer> createState() => _MyProfileOrganizerState();
}

class _MyProfileOrganizerState extends State<MyProfileOrganizer> {

  Map<String, dynamic> profileData = {
    "Organization Name": "Webgrade Technology",
    "Name": "Ms Mehnaj  Khatoon",
    "Email": "mehnaj0321@gmail.com",
    "Country": "India",
    "State": "Uttar Pradesh",
    "City": "Lucknow",
    "Mobile": "9695844884",
    "GST/VST": "2135",
    "Address for Correspondence": "DLF my pad India",

  };

  @override
  Widget build(BuildContext context) {


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
                  height: MediaQuery.of(context).size.height * 0.23,
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

              ],
            ),
          )

// Helper function to build rows for information display


      ),
    );
  }

}
