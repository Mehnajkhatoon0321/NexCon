import 'package:flutter/material.dart';
import 'package:nexcon/screen/authFlow/change_password.dart';
import 'package:nexcon/screen/authFlow/my_profile.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/delegates_section/abstract/abstract.dart';
import 'package:nexcon/screen/delegates_section/accomondation/accomodation.dart';
import 'package:nexcon/screen/delegates_section/featured_conferences.dart';
import 'package:nexcon/screen/delegates_section/paper_delegates/paper_delegates.dart';
import 'package:nexcon/screen/organizer_section/accommodation/accomodation.dart';
import 'package:nexcon/screen/organizer_section/registreation_all_types/delegates_registration.dart';
import 'package:nexcon/screen/organizer_section/registreation_all_types/free_registration.dart';
import 'package:nexcon/screen/sideMenu/common_section/about.dart';
import 'package:nexcon/screen/sideMenu/common_section/contact.dart';
import 'package:nexcon/screen/sideMenu/common_section/how_works_delegates.dart';
import 'package:nexcon/screen/sideMenu/common_section/plan_pricing.dart';
import 'package:nexcon/screen/sideMenu/common_section/services.dart';
import 'package:nexcon/screen/sideMenu/delegates_side_menu/my_receipt.dart';
import 'package:nexcon/screen/sideMenu/organizer/how_works_organizer.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/pref_utils.dart';

class SideMenuScreen extends StatefulWidget {
  final String selectedRole;
  const SideMenuScreen({required this.selectedRole,super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  bool _isLogoutDialogVisible = false;
  final List<Map<String, dynamic>> listItem = [
    {'icon': Icons.person, 'subtitle': 'My profile'},
    {'icon': Icons.info, 'subtitle': 'About'},
    {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},
    {'icon': Icons.price_change, 'subtitle': 'Plans & Pricing'},
    {'icon': Icons.event, 'subtitle': 'Conferences'},
    {'icon': Icons.contact_mail, 'subtitle': 'Contact'},
    {'icon': Icons.work_outline, 'subtitle': 'How Its Works Organizer'},
    {'icon': Icons.exit_to_app, 'subtitle': 'Logout'},
    {'icon': Icons.work_outline, 'subtitle': 'How Its Works Delegate'},
    {'icon': Icons.password, 'subtitle': 'Change Password'},
    {'icon': Icons.login, 'subtitle': 'Login'},

  ];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> filteredList;

    if (widget.selectedRole == 'guestFlow') {
      // Show all items for guestFlow
      filteredList = listItem;
    } else if (widget.selectedRole == 'isselect organizer') {
      // Show only organizer-related items
      filteredList = [
        {'icon': Icons.person, 'subtitle': 'My profile'},
        {'icon': Icons.info, 'subtitle': 'About'},
        {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},
        {'icon': Icons.price_change, 'subtitle': 'Plans & Pricing'},
        {'icon': Icons.event, 'subtitle': 'Conferences'},
        {'icon': Icons.home_filled, 'subtitle': 'Accommodation Organizer'},
        {
          'icon': Icons.home_filled,
          'subtitle': 'Registration',
          'title': [
            {'icon': Icons.person, 'subtitle': 'Delegates Registration'},
            {'icon': Icons.perm_contact_cal, 'subtitle': 'Free Registration'}
          ]
        },
        {
          'icon': Icons.timelapse_rounded,
          'subtitle': 'Schedule & Program',
          'title': [
            {
              'icon': Icons.person,
              'subtitle': 'Schedule',
              'sub': [
                {'icon': Icons.person, 'subsection': 'Manage Schedule'},
                {'icon': Icons.perm_contact_cal, 'subsection': 'Print Schedule'}
              ]
            },
            {'icon': Icons.perm_contact_cal, 'subtitle': 'Program'}
          ]
        },
        {'icon': Icons.contact_mail, 'subtitle': 'Contact'},
        {'icon': Icons.work_outline, 'subtitle': 'How Its Works Organizer'},
        {'icon': Icons.password, 'subtitle': 'Change Password'},
        {'icon': Icons.exit_to_app, 'subtitle': 'Logout'},
      ];
    } else {
      // Default items for other roles
      filteredList = [
        {'icon': Icons.person, 'subtitle': 'My profile'},
        {'icon': Icons.event, 'subtitle': 'Conferences'},
        {'icon': Icons.summarize, 'subtitle': 'Abstract'},
        {'icon': Icons.padding_rounded, 'subtitle': 'Paper'},
        {'icon': Icons.home_filled, 'subtitle': 'Accommodation'},
        {'icon': Icons.receipt_long, 'subtitle': 'My Receipt'},
        {'icon': Icons.info, 'subtitle': 'About'},
        {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},
        {'icon': Icons.work_outline, 'subtitle': 'How Its Works Delegate'},
        {'icon': Icons.price_change, 'subtitle': 'Plans & Pricing'},
        {'icon': Icons.contact_mail, 'subtitle': 'Contact'},
        {'icon': Icons.password, 'subtitle': 'Change Password'},
        {'icon': Icons.exit_to_app, 'subtitle': 'Logout'},
      ];
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          SizedBox(
            height: 160,
            child: UserAccountsDrawerHeader(
              accountName: Text("", style: FTextStyle.nameProfile),
              accountEmail: Text("Smart Conference", style: FTextStyle.nameProfile),
              decoration: const BoxDecoration(
                color: AppColors.appSky,
              ),
            ),
          ),
          // Dynamic ListTiles from filteredList
          ...filteredList.map((item) {
            // Check if the item has a 'title' (nested items)
            if (item['title'] != null) {
              return ExpansionTile(
                leading: Icon(
                  item['icon'],
                  size: 20,
                  color: AppColors.aboutUsHeadingColor,
                ),
                title: Text(
                  item['subtitle'],
                  style: FTextStyle.drawerText.copyWith(fontSize: 14),
                ),
                children: item['title'].map<Widget>((childItem) {
                  // Check if the childItem has a 'sub' (nested inside 'title')
                  if (childItem['sub'] != null) {
                    return ExpansionTile(
                      leading: Icon(
                        childItem['icon'],
                        size: 20,
                        color: AppColors.aboutUsHeadingColor,
                      ),
                      title: Text(
                        childItem['subtitle'],
                        style: FTextStyle.drawerText.copyWith(fontSize: 14),
                      ),
                      children: childItem['sub'].map<Widget>((subItem) {
                        return ListTile(
                          dense: true,
                          leading: Icon(
                            subItem['icon'],
                            size: 20,
                            color: AppColors.aboutUsHeadingColor,
                          ),
                          title: Text(
                            subItem['subsection'],
                            style: FTextStyle.drawerText.copyWith(fontSize: 14),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _handleNavigation(subItem['subsection']);
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return ListTile(
                      dense: true,
                      leading: Icon(
                        childItem['icon'],
                        size: 20,
                        color: AppColors.aboutUsHeadingColor,
                      ),
                      title: Text(
                        childItem['subtitle'],
                        style: FTextStyle.drawerText.copyWith(fontSize: 14),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _handleNavigation(childItem['subtitle']);
                      },
                    );
                  }
                }).toList(),
              );
            } else {
              return ListTile(
                dense: true,
                leading: Icon(
                  item['icon'],
                  size: 20,
                  color: AppColors.aboutUsHeadingColor,
                ),
                title: Text(
                  item['subtitle'],
                  style: FTextStyle.drawerText.copyWith(fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavigation(item['subtitle']);
                },
              );
            }
          }).toList(),
        ],
      ),
    );
  }


// Helper method to handle navigation
  void _handleNavigation(String subtitle) {
    switch (subtitle) {
      case 'Change Password':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ChangePassword(selectedRole: widget.selectedRole,)),
        );
        break;
      case 'Abstract':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AbstractScreen()),
        );
        break;
      case 'My Receipt':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyReceipt()),
        );
        break;
      case 'Paper':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaperDelegates()),
        );
        break;
      case 'Accommodation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccommodationScreen()),
        );
        break;
      case 'Accommodation Organizer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccommodationOrganizationScreen()),
        );
        break;
      case 'My profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyProfile()),
        );
        break;
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutScreen()),
        );
        break;
      case 'Services':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServicesScreen()),
        );
        break;
      case 'How Its Works Organizer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HowWorksScreen()),
        );
        break;
      case 'How Its Works Delegate':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HowWorksDelegates()),
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
          MaterialPageRoute(builder: (context) =>  FeaturedConferences(selectedRole: widget.selectedRole,)),
        );
        break;
      case 'Contact':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactScreen()),
        );
        break;
      case 'Login':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
        );
        break;
      case 'Logout':
        _showLogDialog(-1);
        break;
      default:
        break;
    }
  }
  void _subtitleHandleNavigation(String subtitle) {
    switch (subtitle) {
      case 'Delegates Registration':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration()),
        );
        break;
      case 'Free Registration':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  FreeRegistration()),
        );
        break;

    }
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
