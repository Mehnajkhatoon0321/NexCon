import 'package:flutter/material.dart';
import 'package:nexcon/screen/authFlow/change_password.dart';
import 'package:nexcon/screen/authFlow/delegate_my_profile/my_profile.dart';
import 'package:nexcon/screen/authFlow/organizer_my_profile/my_profile_organizer.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/delegates_section/abstract/abstract.dart';
import 'package:nexcon/screen/delegates_section/accomondation/accomodation.dart';
import 'package:nexcon/screen/delegates_section/featured_conferences.dart';
import 'package:nexcon/screen/delegates_section/paper_delegates/paper_delegates.dart';
import 'package:nexcon/screen/organizer_section/accommodation/accomodation.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/plan_and_pricing.dart';
import 'package:nexcon/screen/sideMenu/common_section/about.dart';
import 'package:nexcon/screen/sideMenu/common_section/contact.dart';
import 'package:nexcon/screen/sideMenu/delegates_side_menu/how_works_delegates.dart';
import 'package:nexcon/screen/sideMenu/common_section/plan_pricing.dart';
import 'package:nexcon/screen/sideMenu/common_section/services.dart';
import 'package:nexcon/screen/sideMenu/delegates_side_menu/my_receipt.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/manual_attendance.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/qr_attendance.dart';
import 'package:nexcon/screen/sideMenu/organizer/how_works_organizer.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/program/manage_program.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/program/print_program.dart';

import 'package:nexcon/screen/sideMenu/organizer/program_shedule/schedule/manage_schedule.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/schedule/print_schedule.dart';
import 'package:nexcon/screen/sideMenu/organizer/registreation_all_types/delegates_registration.dart';
import 'package:nexcon/screen/sideMenu/organizer/registreation_all_types/free_registration.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/accomodation_category/accommodation_category.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/coupon_code/coupon_code.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/deadlines/abstract_submission_deadlines.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/deadlines/accommodation_deadlines.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/deadlines/paper_submission_deadlines.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/deadlines/registration_deadlines.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/deadlines/registration_fee_deadlines.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/delegate_category/delegate_category.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/fee/accomodation/accomodation.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/fee/bank_details/bank_details.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/fee/receipt_setting/receipt_setting.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/fee/registration/registration_fee.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/reports/reports.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/setcheckout-setcheckin/setcheckout.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/pref_utils.dart';



class SideMenuScreen extends StatefulWidget {
  final String selectedRole;
  const SideMenuScreen({required this.selectedRole,super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen>
{
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

  String? expandedItem;
  String? expandedSubItem;
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
        // {'icon': Icons.person, 'subtitle': 'My Profile Details'},




        {
          'icon': Icons.home_filled,
          'subtitle': 'Registration',
          'title': [
            {'icon': Icons.person, 'subtitle': 'Delegates Registration'},
            {'icon': Icons.perm_contact_cal, 'subtitle': 'Free Registration'}
          ]
        },
        {
          'icon': Icons.library_books_sharp,
          'subtitle': 'Attendance',
          'title': [
            {'icon': Icons.punch_clock, 'subtitle': 'Manual Attendance'},
            {'icon': Icons.report, 'subtitle': 'QR Attendance'},
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
            {'icon': Icons.perm_contact_cal, 'subtitle': 'Program', 'sub': [
              {'icon': Icons.person, 'subsection': 'Manage Program'},
              {'icon': Icons.perm_contact_cal, 'subsection': 'Print Program'}
            ]}
          ]
        },
        {
          'icon': Icons.settings,
          'subtitle': 'Settings',
          'title': [
            {'icon': Icons.category, 'subtitle': 'Delegate Category'},

            {'icon': Icons.timelapse_rounded, 'subtitle': 'Deadlines', 'sub': [
              {'icon': Icons.person, 'subsection': 'Total Registration'},
              {'icon': Icons.app_registration, 'subsection': 'Registration Fee'},
              {'icon': Icons.book, 'subsection': 'Abstract Submission'},
              {'icon': Icons.book_outlined, 'subsection': 'Paper Submission'},
              {'icon': Icons.add_home, 'subsection': 'Accommodation'},

            ]},
            { 'icon': Icons.cases_sharp,'subtitle': 'Fee', 'sub': [
              {'icon': Icons.app_registration, 'subsection': 'Registration Fee'},
                {'icon': Icons.home_work_rounded, 'subsection': 'Accommodation Fee'},
                {'icon': Icons.person, 'subsection': 'Bank Details'},
                {'icon': Icons.app_registration, 'subsection': 'Receipt Setting'},

              ]},

            {'icon': Icons.discount, 'subtitle': 'Coupons'},
            {'icon': Icons.punch_clock, 'subtitle': 'Set-Check-In/Check-Out'},
            {'icon': Icons.report, 'subtitle': 'Reports'},

          ]
        },
        {'icon': Icons.home_work_rounded, 'subtitle': 'Accommodation Category'},
        {'icon': Icons.work_outline, 'subtitle': 'How Its Works Organizer'},
        {'icon': Icons.info, 'subtitle': 'About'},
        {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},
        {'icon': Icons.contact_mail, 'subtitle': 'Contact'},
        //
        // {'icon': Icons.password, 'subtitle': 'Change Password'},
        // {'icon': Icons.exit_to_app, 'subtitle': 'Logout'},
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
              return Container(
                color: expandedItem== item['subtitle']? Colors.green[50]
                    : Colors.white,
                child: ExpansionTile(

                  leading:
                  Icon(
                    item['icon'],
                    size: 20,
                    color: expandedItem== item['subtitle']? Colors.green
                      : AppColors.aboutUsHeadingColor,
                  ),

                  title: Text(
                    item['subtitle'],
                    style: FTextStyle.drawerText.copyWith(
                      fontSize: 14,
                      fontWeight: expandedItem == item['subtitle']
                          ? FontWeight.bold
                          : FontWeight.bold,
                      color: expandedItem == item['subtitle']
                          ?  Colors.green
                          : AppColors.aboutUsHeadingColor,
                    ),
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      expandedItem = isExpanded ? item['subtitle'] : null;
                    });
                  },
                  children: item['title'].map<Widget>((childItem) {
                    // Check if the childItem has a 'sub' (nested inside 'title')
                    if (childItem['sub'] != null) {
                      return ExpansionTile(
                        leading: Icon(
                          childItem['icon'],
                          size: 20,
                          color: expandedSubItem== item['subtitle']? Colors.green[300]
                              :  AppColors.aboutUsHeadingColor,
                        ),
                        title: Text(
                          childItem['subtitle'],
                          style: FTextStyle.drawerText.copyWith(
                            fontSize: 14,
                            fontWeight: expandedSubItem == item['subtitle']
                                ? FontWeight.bold
                                : FontWeight.bold,
                            color: expandedSubItem == item['subtitle']
                                ?  Colors.green[300]
                                : AppColors.aboutUsHeadingColor,
                          ),
                        ),
                        onExpansionChanged: (isExpanded) {
                          setState(() {
                            expandedSubItem = isExpanded ? item['subtitle'] : null;
                          });
                        },
                        children: childItem['sub'].map<Widget>((subItem) {
                          return Container(
                            color: expandedSubItem == item['subtitle']? Colors.green[200] :Colors.green[30],
                            child: ListTile(
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
                                _subSectionHandleNavigation(subItem['subsection']);
                              },
                            ),
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
                          _subtitleHandleNavigation(childItem['subtitle']);
                        },
                      );
                    }
                  }).toList(),
                ),
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
      case 'My Profile Details':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MyProfileOrganizer()),
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
          MaterialPageRoute(builder: (context) =>  PricingScreen()),
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

        case 'Manual Attendance':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ManualAttendance()),
        );
        break;
        case 'QR Attendance':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  QrAttendance()),
        );
        break;

        //Deadline-Subtitle
      case 'Delegate Category':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegateCategory()),
        );
        break;

        case 'Accommodation Category':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AccommodationCategory()),
        );
        break;
   case 'Coupons':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  CouponCode()),
        );
        break;
   case 'Set-Check-In/Check-Out':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SetCheckOut()),
        );
        break;
   case 'Reports':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Reports()),
        );
        break;








    }
  }
  void _subSectionHandleNavigation(String subtitle)
  {
    switch (subtitle) {
      case 'Manage Schedule':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ManageSchedule()),
        );
        break;
      case 'Print Schedule':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  PrintSchedule()),
        );
        break;
      case 'Manage Program':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ManageProgram()),
        );
        break;
        case 'Print Program':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  PrintProgram()),
        );
        break;
//deadlines

      case 'Total Registration':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RegistrationDeadlines()),
        );
        break;

      case 'Registration Fee':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RegistrationFeeDeadlines()),
        );
        break;
      case 'Abstract Submission':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AbstractSubmissionDeadlines()),
        );
        break;
      case 'Paper Submission':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  PaperSubmissionDeadlines()),
        );
        break;


      case 'Accommodation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AccommodationDeadlines()),
        );
        break;

        //fee

      case 'Registration Fee':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RegistrationFee()),
        );
        break;
      case 'Accommodation Fee':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Accommodation()),
        );
        break;
      case 'Bank Details':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  BankDetails()),
        );
        break;case 'Receipt Setting':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ReceiptSetting()),
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
