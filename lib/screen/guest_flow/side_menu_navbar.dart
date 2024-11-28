import 'package:flutter/material.dart';
import 'package:smart_conference/screen/authFlow/change_password.dart';
import 'package:smart_conference/screen/authFlow/login_screen.dart';
import 'package:smart_conference/screen/authFlow/selection_role.dart';
import 'package:smart_conference/screen/delegates_section/abstract.dart';
import 'package:smart_conference/screen/delegates_section/accomodation.dart';
import 'package:smart_conference/screen/delegates_section/conference_category.dart';
import 'package:smart_conference/screen/delegates_section/featured_conferences.dart';
import 'package:smart_conference/screen/delegates_section/my_receipt.dart';
import 'package:smart_conference/screen/delegates_section/paper_delegates.dart';
import 'package:smart_conference/screen/sideMenu/about.dart';
import 'package:smart_conference/screen/sideMenu/contact.dart';
import 'package:smart_conference/screen/sideMenu/how_works.dart';
import 'package:smart_conference/screen/sideMenu/how_works_delegates.dart';
import 'package:smart_conference/screen/authFlow/my_profile.dart';
import 'package:smart_conference/screen/sideMenu/plan_pricing.dart';
import 'package:smart_conference/screen/sideMenu/services.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
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
        // Remove default padding
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
            return Column(
              children: [
                ListTile(

                  dense: true, // Makes ListTile more compact
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
                    Navigator.pop(context); // Close drawer on tap
                    // Handle navigation logic
                    switch (item['subtitle']) {
                      case 'Change Password':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChangePassword()),
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
                        break;  case 'Accommodation':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AccommodationScreen()),
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
                      // No action for Conferences yet
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
                  },
                ),
                const Divider(
                  height: 0, // Minimize height between items
                  color: AppColors.appSky,
                  thickness: 0.5,
                ),
              ],
            );
          }).toList(),
        ],
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
            padding:  EdgeInsets.all(16.0),
            child: Container(
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
          ),
        );
      },
    ).then((_) {
      _isLogoutDialogVisible = false; // Reset the flag when the dialog is closed
    });
  }
}
