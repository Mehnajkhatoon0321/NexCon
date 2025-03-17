import 'package:flutter/material.dart';

import '../../../../../utils/colours.dart';
import '../../../../../utils/font_text_Style.dart';
class AccommodationDeadlines extends StatefulWidget {
  const AccommodationDeadlines({super.key});

  @override
  State<AccommodationDeadlines> createState() => _AccommodationDeadlinesState();
}

class _AccommodationDeadlinesState extends State<AccommodationDeadlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Accommodation Deadlines',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
