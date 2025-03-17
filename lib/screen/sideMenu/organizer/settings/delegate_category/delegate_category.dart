import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class DelegateCategory extends StatefulWidget {
  const DelegateCategory({super.key});

  @override
  State<DelegateCategory> createState() => _DelegateCategoryState();
}

class _DelegateCategoryState extends State<DelegateCategory> {

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType
        .toString()
        .split('.')
        .last;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Delegate Category',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,

      ),
    );
  }
}
