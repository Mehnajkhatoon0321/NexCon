import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class MyConferenceOrganizerEdit extends StatefulWidget {
  final String conferenceName;
  final String fromdata;
  final String todata;

  const MyConferenceOrganizerEdit({
    super.key,
    required this.conferenceName,
    required this.fromdata,
    required this.todata,
  });

  @override
  State<MyConferenceOrganizerEdit> createState() => _MyConferenceOrganizerEditState();
}

class _MyConferenceOrganizerEditState extends State<MyConferenceOrganizerEdit> {
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
          'Conference Edits',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [

        ],
      ),

    );
  }
}
