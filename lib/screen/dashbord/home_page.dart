import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_conference/screen/authFlow/login_screen.dart';
import 'package:smart_conference/screen/authFlow/selection_role.dart';
import 'package:smart_conference/screen/sideMenu/about.dart';
import 'package:smart_conference/screen/sideMenu/conference.dart';
import 'package:smart_conference/screen/sideMenu/contact.dart';
import 'package:smart_conference/screen/sideMenu/how_works.dart';
import 'package:smart_conference/screen/sideMenu/plan_pricing.dart';
import 'package:smart_conference/screen/sideMenu/services.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class HomePage extends StatefulWidget {
  final  String selectedRole;
  const HomePage({super.key,required this.selectedRole});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLogoutDialogVisible = false;
  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> listItem = [
    {'subtitle': 'About', 'icon': Icons.book_outlined},
    {'subtitle': 'Services', 'icon': Icons.miscellaneous_services_rounded},
    {'subtitle': 'How Its Works Organizer', 'icon': Icons.policy},
    {'subtitle': 'Plans & Pricing', 'icon': Icons.next_plan_outlined},
    {'subtitle': 'Conferences', 'icon': Icons.night_shelter},
    {'subtitle': 'Contact', 'icon': Icons.contact_phone_rounded},
    {'subtitle': 'Login', 'icon': Icons.login},
    {'subtitle': 'Logout', 'icon': Icons.logout},
  ];
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 32,
          ), // Menu icon
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Open the drawer
          },
        ),
        title: Text(
          'Home Page',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ), // Title of the app bar
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 180,
              child: UserAccountsDrawerHeader(
                accountName: Text("", style: FTextStyle.nameProfile),
                accountEmail:
                Text("Smart Conference", style: FTextStyle.nameProfile),

                decoration: const BoxDecoration(
                  color: AppColors.appSky,
                ),
              ),
            ),




            ...listItem.map((item) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon'],color: AppColors.aboutUsHeadingColor

                      ,),
                    title: Text(item['subtitle'], style: FTextStyle.FaqsTxtStyle),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer

                      switch (item['subtitle']) {
                        case 'About':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AboutScreen()),
                          );
                          break;
                        case 'Services':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ServicesScreen()),
                          );
                          break;
                        case 'How Its Works Organizer':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HowWorksScreen()),
                          );
                          break;
                        case 'Plans & Pricing':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PlanPricingScreen()),
                          );
                          break;
                        case 'Conferences':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ConferenceCategory()),
                          );
                          break;
                          case 'Contact':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen()),
                          );
                          break; case 'Login':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
                          );
                          break;
                        case 'Logout':
                          _showLogDialog(-1);
                          break;
                        default:
                        // Handle default case if needed
                          break;
                      }
                    },
                  ),
                  const Divider(height: 1,color: AppColors.appSky,thickness: 0.5,), // Add a divider after each ListTile
                ],
              );
            }),

          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard Page',style: FTextStyle.preHeadingBoldStyle,).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),



          ],
        ),
      ),
    );
  }

  void _showLogDialog(int index) {
    if (_isLogoutDialogVisible) return; // Prevent showing multiple dialogs

    _isLogoutDialogVisible = true; // Set the flag when showing the dialog

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Are you sure you want to logout?", style: FTextStyle.preHeadingStyle),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.formFieldBackColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _isLogoutDialogVisible = false; // Reset the flag when closed
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColourDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("OK", style: TextStyle(color: Colors.white)),
                      onPressed: () {

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen(selectedRole: widget.selectedRole)),
                              (route) => false, // This will remove all previous routes
                        ); // Close the dialog
                        _isLogoutDialogVisible = false; // Reset the flag
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      _isLogoutDialogVisible = false; // Reset the flag when the dialog is closed
    });
  }
}
