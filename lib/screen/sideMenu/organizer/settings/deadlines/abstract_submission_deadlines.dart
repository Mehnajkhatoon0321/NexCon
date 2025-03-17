import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class AbstractSubmissionDeadlines extends StatefulWidget {
  const AbstractSubmissionDeadlines({super.key});

  @override
  State<AbstractSubmissionDeadlines> createState() => _AbstractSubmissionDeadlinesState();
}

class _AbstractSubmissionDeadlinesState extends State<AbstractSubmissionDeadlines> {
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
          'Abstract Submission Deadlines',
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
