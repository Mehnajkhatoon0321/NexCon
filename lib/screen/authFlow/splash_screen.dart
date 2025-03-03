import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/delegates_section/delegates_home_page.dart';
import 'package:nexcon/screen/organizer_section/organizer_home_page.dart';



import 'dart:async';

import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/pref_utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();

    Timer(
      const Duration(seconds: 3),
          () => navigateUser(context),
    );
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
      child:  Scaffold(
        backgroundColor:Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Container(
              // alignment: Alignment.topCenter,

              child: Image.asset(
                'assets/images/applogo.png',
                width: (displayType == 'desktop' || displayType == 'tablet')
                    ? 450.w
                    : 350,
                height: (displayType == 'desktop' || displayType == 'tablet')
                    ? 100.h
                    : 170,
              ),
            ),
          ),
        ),
      ),

    );
  }
  void navigateUser(BuildContext context) {
    bool isLoggedIn = PrefUtils.getIsLogin();
    String roleSelection = PrefUtils.getRoleSelection();
    // print("isLoggedIn: $isLoggedIn, roleSelection: $roleSelection");

    if (isLoggedIn == true) {
      if (roleSelection == "isselect organizer") {
        // print("Navigating to OrganizerHomePage");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => OrganizerHomePage(
              selectedRole: roleSelection,
            ),
          ),
              (route) => false,
        );
      } else if (roleSelection==""){
        print("Navigating to HomeDelegates");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => HomeDelegates(
              selectedRole: roleSelection,
            ),
          ),
              (route) => false,
        );
      }
    } else {
      // print("Navigating to RoleSelectionScreen");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => const RoleSelectionScreen(),
        ),
            (route) => false,
      );
    }
  }


}
