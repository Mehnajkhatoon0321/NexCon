import 'package:flutter/material.dart';

import '../../../../../../utils/colours.dart';
import '../../../../../../utils/font_text_Style.dart';
class ReceiptSetting extends StatefulWidget {
  const ReceiptSetting({super.key});

  @override
  State<ReceiptSetting> createState() => _ReceiptSettingState();
}

class _ReceiptSettingState extends State<ReceiptSetting> {
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
          'Receipt Setting ',
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
