import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class MyConferenceOrganizerView extends StatefulWidget {
  final String id;  // Add the id property

  const MyConferenceOrganizerView({super.key, required this.id}); // Accept it via the constructor

  @override
  State<MyConferenceOrganizerView> createState() =>
      _MyConferenceOrganizerViewState();
}

class _MyConferenceOrganizerViewState extends State<MyConferenceOrganizerView> {
  @override
  Widget build(BuildContext context) {
    // You can now use widget.id to access the passed id
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
          'Conference View',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Conference ID: ${widget.id}'), // Example usage of the id
      ),
    );
  }
}

