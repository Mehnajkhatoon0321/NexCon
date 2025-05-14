import 'package:flutter/material.dart';
import 'package:nexcon/screen/authFlow/change_password.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';

import 'package:nexcon/screen/guest_flow/side_menu_navbar.dart';

import 'package:nexcon/screen/organizer_section/account/conference_register_here.dart';
import 'package:nexcon/screen/organizer_section/account/upgrade_wait_list.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer.dart';

import 'package:nexcon/screen/organizer_section/mydashboard_organizer/my_dashboard_organizer.dart';
import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/pref_utils.dart';

import '../authFlow/organizer_my_profile/edit_profile_organizer.dart';
import '../authFlow/organizer_my_profile/my_profile_organizer.dart';
import 'account/my_order/my_order.dart';
class OrganizerHomePage extends StatefulWidget {
  final String selectedRole;
  const OrganizerHomePage({required this.selectedRole,super.key});

  @override
  State<OrganizerHomePage> createState() => _OrganizerHomePageState();
}
class _OrganizerHomePageState extends State<OrganizerHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  bool _isLogoutDialogVisible = false;
  final List<Map<String, dynamic>> _navBarItems = [
    {"title": "Organizer Dashboard", "icon": Icons.dashboard},
    {"title": "My Conference", "icon": Icons.event},
    {"title": "My Order", "icon": Icons.receipt_long},
    {"title": "My Profile", "icon": Icons.person},

  ];
  final List<Map<String, dynamic>> _customMenuItems = [
    {"title": "Upgrade Wait List", "icon": Icons.access_alarm_sharp, "value": "upgradeWait"},
    {"title": "Conference Register Here", "icon": Icons.app_registration, "value": "registerHere"},
    {"title": "Edit Profile", "icon": Icons.edit, "value": "edit"},
    {"title": "Change Password", "icon": Icons.password, "value": "changePassword"},

    {"title": "Logout", "icon": Icons.logout, "value": "logout"},
  ];


  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const MyDashboardOrganizer();
      case 1:
        return const MyConferenceOrganizer();
      case 3:
        return  MyProfileOrganizer();
      case 2:
        return const MyOrder();
      default:
        return const MyDashboardOrganizer();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        color: AppColors.primaryColour,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: FTextStyle.navBarSelectedStyle,
        unselectedLabelStyle: FTextStyle.navBarUnselectedStyle,


        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _navBarItems.map((item) {
          int index = _navBarItems.indexOf(item);
          return BottomNavigationBarItem(
            icon: Icon(
              item['icon'],
              size: 24,
              color: _selectedIndex == index ? Colors.white : Colors.white70,
            ),
            label: item['title'],
          );
        }).toList(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColour,
        elevation: 3,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 28, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          _navBarItems[_selectedIndex]['title'],
          style: FTextStyle.appBarTitleWhite,
        ),
        centerTitle: true,
        actions: _selectedIndex == 3
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
                        top: position.dy  ,
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditProfileOrganizer(),
                                        ),
                                      );
                                    } else if (item['value'] == 'registerHere') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ConferenceRegisterHere(),
                                        ),
                                      );
                                    } else if (item['value'] == 'upgradeWait') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpgradeWaitList(),
                                        ),
                                      );
                                    } else if (item['value'] == 'changePassword') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChangePassword(selectedRole: ""),
                                        ),
                                      );
                                    } else if (item['value'] == 'logout') {
                                      _showLogDialog(-1);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 14),
                                    child: Row(
                                      children: [
                                        Icon(item['icon'],
                                            size: 20, color: Colors.black54),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            item['title'],
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 14,

                                              color: Colors.black87,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
          ),


        ]
            : [],


      ),
      drawer: SideMenuScreen(selectedRole: widget.selectedRole),
      backgroundColor: Colors.white,
      body: _getPage(_selectedIndex),
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
                          backgroundColor: AppColors.primaryColour,
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

