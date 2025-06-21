import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/plan_and_pricing.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/upgrade_membership.dart';

import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class UpgradePlan extends StatefulWidget {
  const UpgradePlan({super.key});

  @override
  State<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends State<UpgradePlan> {
  int _selectedValue = 1;
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
          'Upgrade Membership',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
body: SingleChildScrollView(

  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'You can upgrade you Membership type in any of the following:\nInstructions for Membership',
            style: FTextStyle.subheading,
          ),
        ),
        SizedBox(height: 8.0),
        ...[
          'Register your conference for FREE listing and get our BASIC membership.',
          'Upgrade membership from BASIC to PRO or ELITE .',
          'To upgrade membership organizer has to purchase Credit Points that will be added in their e-Wallet.',
          '1 Credit Point = 1 Delegate',
          'If you want to subscribe for registration of 100 delegates you have to purchase 100 Credit Points.',
          'Every time a delegate registers for the conference 1 Credit Point will be deducted from the e-Wallet of organizer.',
          'If there are more than 100 registrations then you have to purchase additional credit points to view the details of registered delegates.',
          'You can purchase as low as 1 Credit Point.',
          'Credit Points can be used for the registration of multiple conferences simultaneously by the organizer. There will be no expiry date for the points in the e-Wallet.',
          'You can withdraw the unused Credit Points from your e-Wallet at any time.'
        ].map((item) {
          if (item == '1 Credit Point = 1 Delegate') {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center( // Center the text
                child: Text(
                  item,
                  style: FTextStyle.listTitle.copyWith(color:  AppColors.secondaryColour),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    item,
                    style: FTextStyle.style,
                  ),
                ),
              ],
            );
          }
        }).toList(),

        SizedBox(height: 10,),
        Text("Membership Type",style: FTextStyle.listTitle,),
        Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Row(
    children: [
    Radio<int>(
    value: 1,
    groupValue: _selectedValue,
    onChanged: (int? value) {
    setState(() {
    _selectedValue = value!;
    });
    },
    activeColor: AppColors.appSky, // Highlight selected radio button
    ),
    RichText(
    text: TextSpan(
    text: "Pro ",
    style: FTextStyle.listTitle.copyWith(
   // Selected text turns green
    ),
    children: [
    TextSpan(
    text: "(View Plan)",
      style: FTextStyle.style.copyWith(
          color: AppColors.secondaryColour// Hyperlink color
        // Underline for hyperlink
      ),
    recognizer: TapGestureRecognizer()
    ..onTap = () {

     Navigator.push(context, MaterialPageRoute(builder: (context) => PricingScreen()));
    },
    ),

    ],
    ),
    ),
    ],
    ),
    // const SizedBox(height: 10), // Spacing between options
      Row(
        children: [
          Radio<int>(
            value: 2,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
              });
            },
            activeColor: AppColors.appSky, // Highlight selected radio button
          ),
          RichText(
            text: TextSpan(
              text: "ELITE ",
              style: FTextStyle.listTitle.copyWith(
                // Selected text turns green
              ),
              children: [
                TextSpan(
                  text: "(Request a Quote)",
                  style: FTextStyle.style.copyWith(
                    color: AppColors.secondaryColour// Hyperlink color
                    // Underline for hyperlink
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => PricingScreen()));
                    },
                ),

              ],
            ),
          ),
        ],
      ),
    ],
    ),


        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    AppColors.appSky,
                    AppColors.secondaryColour,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpgradeMembership()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(100, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text("Subscribe", style: FTextStyle.loginBtnStyle),
                ),
              ),
            ),
          ),
        )

      ],
    ),
  ),
),
    );
  }
}
