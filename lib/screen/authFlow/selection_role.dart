
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_conference/screen/authFlow/login_screen.dart';
import 'package:smart_conference/screen/guest_flow/home_page.dart';

import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String isSelectedRole = 'isselect organizer';

  bool isRoleCompleted = false;


  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, -80.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: width * 0.39),
                    SizedBox(
                      height: 60,
                      child: Center(
                        child: Image.asset(
                          'assets/images/applogo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // Select role
                    Visibility(
                      visible: !isRoleCompleted,
                      child: Expanded(
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
                                child: Text(
                                  'Pick How You’d Like to Get Started'.toUpperCase(),
                                  style: FTextStyle.headingMiddle.copyWith(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 65.0, 0.0, 70.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSelectedRole = 'isselect organizer';
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: width / 2.7,
                                                width: width / 2.7,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 10.0,
                                                      color: Color(0x0D000000),
                                                      offset: Offset(0.0, 0.0),
                                                    ),
                                                  ],
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: (isSelectedRole == 'isselect organizer')
                                                      ? Border.all(color: Colors.green, width: 1.5)
                                                      : null,
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Center(
                                                  child: Image.asset(
                                                    "assets/images/organizer.png",
                                                    height: 80,
                                                    width: 80,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: (isSelectedRole == 'isselect organizer'),
                                                child: Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/filledTick.png",
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Text('Organizer', style: FTextStyle.Faqssubtitle),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSelectedRole = 'isselect delegate';
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: width / 2.7,
                                                  width: width / 2.7,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 10.0,
                                                        color: Color(0x0D000000),
                                                        offset: Offset(0.0, 0.0),
                                                      ),
                                                    ],
                                                    borderRadius: BorderRadius.circular(78.0),
                                                    border: (isSelectedRole == 'isselect delegate')
                                                        ? Border.all(color: Colors.green, width: 1.5)
                                                        : null,
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Center(
                                                    child: Image.asset(
                                                      "assets/images/delegates.png",
                                                      height: 90,
                                                      width: 90,
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: (isSelectedRole == 'isselect delegate'),
                                                  child: Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Padding(
                                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        child: Image.asset(
                                                          "assets/images/filledTick.png",
                                                          height: 30,
                                                          width: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                                              child: Text('Delegate', style: FTextStyle.Faqssubtitle),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () {
                                    navigatorScreen();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.appSky,
                                    textStyle: FTextStyle.loginBtnStyle,
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                    ),
                                    elevation: 0.5,
                                    shadowColor: AppColors.boarderColour,
                                    side: const BorderSide(color: Colors.white),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "CONTINUE",
                                      style: FTextStyle.listTitleBig.
                                      copyWith(color: Colors.white, letterSpacing: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Continue as a ",
                                    style: FTextStyle.listTitleSub.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(selectedRole: "guestFlow"),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Guest ? ",
                                      style: FTextStyle.listTitleSub.copyWith(color: AppColors.appSky, fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  void navigatorScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return  LoginScreen(  selectedRole: isSelectedRole,); // You can pass the selected role here if needed
    }));
  }




}
