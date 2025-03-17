import 'package:flutter/material.dart';

import '../../../../../utils/colours.dart';
import '../../../../../utils/font_text_Style.dart';
class RegistrationFeeDeadlines extends StatefulWidget {
  const RegistrationFeeDeadlines({super.key});

  @override
  State<RegistrationFeeDeadlines> createState() => _RegistrationFeeDeadlinesState();
}

class _RegistrationFeeDeadlinesState extends State<RegistrationFeeDeadlines> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          'Registration Fee Deadlines',
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
