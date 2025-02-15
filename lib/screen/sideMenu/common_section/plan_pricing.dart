import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class PlanPricingScreen extends StatefulWidget {
  const PlanPricingScreen({super.key});

  @override
  State<PlanPricingScreen> createState() => _PlanPricingScreenState();
}

class _PlanPricingScreenState extends State<PlanPricingScreen> {
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
          'Plan and Pricing',
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
