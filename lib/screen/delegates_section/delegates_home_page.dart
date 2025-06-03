import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/authFlow/change_password.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/abstract/abstract.dart';

import 'package:nexcon/screen/delegates_section/nab_bar/fee_delegates/fee_page.dart';

import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/my_conference.dart';
import 'package:nexcon/screen/guest_flow/side_menu_navbar.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/pref_utils.dart';

import '../authFlow/delegate_my_profile/edit_profile.dart';
import '../authFlow/delegate_my_profile/my_profile.dart';




class HomeDelegates extends StatefulWidget {
  final String selectedRole;
  const HomeDelegates({required this.selectedRole,super.key});

  @override
  State<HomeDelegates> createState() => _HomeDelegatesState();
}

class _HomeDelegatesState extends State<HomeDelegates> {
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
  int _selectedIndex = 0;
  bool _isLogoutDialogVisible = false;

  final List<Map<String, dynamic>> _navBarItems = [
    {"title": "My Conference", "icon": Icons.event},
    {"title": "Abstract", "icon": Icons.book},
    {"title": "Fee", "icon": Icons.payment},

    {"title": "My Profile", "icon": Icons.person},
  ];
  final List<Map<String, dynamic>> _customMenuItems = [
    {"title": "Edit Profile", "icon": Icons.edit, "value": "edit"},
    {"title": "Change Password", "icon": Icons.password, "value": "changePassword"},

    {"title": "Logout", "icon": Icons.logout, "value": "logout"},
  ];


  // Pages corresponding to each nav item
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const MyConferencePage();
      case 1:
        return const AbstractScreen();
      case 2:
        return const FeePage();
      case 3:
        return const MyProfile();
      default:
        return const MyConferencePage();
    }
  }

  // Update selected index when nav item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height*0.08,
      decoration: const BoxDecoration(
        color: AppColors.appSky,// Use the theme's primary color
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(25),  // Rounded top-left corner
        //   topRight: Radius.circular(25), // Rounded top-right corner
        // ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent, // Make the background transparent
        selectedItemColor: Colors.white, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        showUnselectedLabels: true,
        items: _navBarItems
            .map(
              (item) => BottomNavigationBarItem(
            icon: Icon(
              item['icon'],
              size: 30,
              color: _selectedIndex == _navBarItems.indexOf(item)
                  ?Colors.white
                  : Colors.grey,
            ),
            label: item['title'],
          ),
        )
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:AppColors.appSky, // Customize app bar color
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
        title:Text(
          _navBarItems[_selectedIndex]['title'],
          style: FTextStyle.appBarTitleWhite,
        ),
        centerTitle: true,

        actions: (_selectedIndex == 3)
            ? [
          IconButton(
            icon: const Icon(Icons.more_vert, size: 28, color: Colors.white),
            onPressed: () {
              final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
              final RenderBox button = context.findRenderObject() as RenderBox;
              final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

              showDialog(
                context: context,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Positioned(
                        top: position.dy,
                        right: 16,
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: 180,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: _customMenuItems.map((item) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pop(context);

                                    if (item['value'] == 'edit') {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfile()));
                                    } else if (item['value'] == 'changePassword') {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => ChangePassword(selectedRole: "")));
                                    } else if (item['value'] == 'logout') {
                                      _showLogDialog(-1);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                                    child: Row(
                                      children: [
                                        Icon(item['icon'], size: 20, color: Colors.black54),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            item['title'],
                                            maxLines: 2,
                                            style: const TextStyle(fontSize: 14, color: Colors.black87, overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ]


            :
        // (_selectedIndex == 2)
        //     ? [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SizedBox(
        //       height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 37,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (_) => PayRegistrationFee(
        //             bankName: '', date: '', amount: '', image: '', tnNumber: '', title: '', paymentMode: '',
        //           )));
        //         },
        //         style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        //           backgroundColor: Colors.white,
        //         ),
        //         child: Text(
        //           "Registration Fee",
        //           style: FTextStyle.loginBtnStyle.copyWith(color: AppColors.appSky, fontSize: 12),
        //         ),
        //       ),
        //     ),
        //   )
        // ]
        //     :
        // (_selectedIndex == 1)
        //     ? [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SizedBox(
        //       height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 37,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (_) => AbstractionRegister(isEdit: '', title: '',),
        //             ),
        //           );
        //         },
        //         style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(26),
        //           ),
        //           backgroundColor: Colors.white,
        //         ),
        //         child: Text(
        //           "Add",
        //           style: FTextStyle.loginBtnStyle.copyWith(
        //             color: AppColors.appSky,
        //             fontSize: 12,
        //           ),
        //         ),
        //       ),
        //     ),
        //   )
        //
        // ] :
        //
        [],
      ),

      drawer: SideMenuScreen(selectedRole: widget.selectedRole),
      backgroundColor: Colors.white,

      body: _getPage(_selectedIndex),  // Dynamic page loading
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  void _showLogDialog(int index) {
    if (_isLogoutDialogVisible) return; // Prevent showing multiple dialogs

    _isLogoutDialogVisible = true; // Set the flag when showing the dialog

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.greyLight,
          child: Padding(
            padding:  EdgeInsets.all(16.0),
            child: Container(
              color: AppColors.greyLight,
              height: MediaQuery.of(context).size.height*0.15,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Are you sure you want to logout?", style: FTextStyle.preHeadingStyle),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.boarderColour,
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
                      const SizedBox(width: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.appSky,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: const Text("OK", style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          PrefUtils.setIsLogin(false);
                          PrefUtils.setToken("");
                          // Save user
                          PrefUtils.setUserEmailLogin("");
                          // Save  role
                          // PrefUtils.setUserId(0);

                          PrefUtils.setUserPassword("");
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
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
          ),
        );
      },
    ).then((_) {
      _isLogoutDialogVisible = false; // Reset the flag when the dialog is closed
    });
  }
}