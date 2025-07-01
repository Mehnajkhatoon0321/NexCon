import 'package:flutter/material.dart';
import 'package:nexcon/screen/authFlow/change_password.dart';

import 'package:nexcon/screen/authFlow/organizer_my_profile/my_profile_organizer.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/delegates_section/delegates_conferences/delegates_conference.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/abstract/abstract.dart';


import 'package:nexcon/screen/delegates_section/paper_delegates/paper_delegates.dart';

import 'package:nexcon/screen/organizer_section/upgrade_plan/plan_and_pricing.dart';
import 'package:nexcon/screen/sideMenu/common_section/about.dart';
import 'package:nexcon/screen/sideMenu/common_section/contact.dart';
import 'package:nexcon/screen/sideMenu/common_section/support/disclaimer.dart';
import 'package:nexcon/screen/sideMenu/delegates_side_menu/how_works_delegates.dart';

import 'package:nexcon/screen/sideMenu/common_section/services.dart';
import 'package:nexcon/screen/sideMenu/delegates_side_menu/my_receipt.dart';
import 'package:nexcon/screen/sideMenu/organizer/abstract_and_paper/abstract_organizer/abstract_theam/abstract_organizer.dart';

import 'package:nexcon/screen/sideMenu/organizer/how_works_organizer.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/program/manage_program.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/program/print_program.dart';

import 'package:nexcon/screen/sideMenu/organizer/program_shedule/schedule/manage_schedule.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/schedule/print_schedule.dart';
import 'package:nexcon/screen/sideMenu/organizer/registreation_all_types/delegates_registration.dart';


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

import '../sideMenu/delegates_side_menu/accomondation/accomodation.dart';
import '../sideMenu/delegates_side_menu/bank_details/bank_details.dart';

import 'delegates_register_process/conference_category.dart';
class SideMenuScreen extends StatefulWidget {
  final String selectedRole;
  const SideMenuScreen({required this.selectedRole,super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen>
{

  final List<Map<String, dynamic>> listItem = [
    {'icon': Icons.work_outline, 'subtitle': 'How Its Works Organizer'},

    {'icon': Icons.work_outline, 'subtitle': 'How Its Works Delegate'},
    {'icon': Icons.info, 'subtitle': 'About'},
    {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},
    {'icon': Icons.event, 'subtitle': 'Conferences'},
    {'icon': Icons.price_change, 'subtitle': 'Plans & Pricing'},

    {'icon': Icons.contact_mail, 'subtitle': 'Contact'},
    {'icon': Icons.contact_mail, 'subtitle': 'Disclaimer'},
    // {'icon': Icons.password, 'subtitle': 'Change Password'},
    {'icon': Icons.login, 'subtitle': 'Login'},


  ];
  String? selectedSubSection;
  String? expandedItem;
  String? expandedSubItem;
  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> filteredList;

    if (widget.selectedRole == 'guestFlow') {

      filteredList = listItem;
    } else if (widget.selectedRole == 'isselect organizer') {

      filteredList = [

        {'icon': Icons.work_outline, 'subtitle': 'How Its Works Organizer'},
        {
          'icon': Icons.library_books_sharp,
          'subtitle': 'Attendance',

        },
        {'icon': Icons.person, 'subtitle': 'Delegates Registration'},
        {'icon': Icons.home_work_rounded, 'subtitle': 'Accommodation Organization'},
        {
          'icon': Icons.my_library_books_outlined,
          'subtitle': 'Abstracts & Paper',
          'title': [
            {
              'icon': Icons.featured_play_list_rounded,
              'subtitle': 'Abstracts',
              'sub': [
                {'icon': Icons.library_books_rounded, 'subsection': 'Manage Abstract Session/Themes'},
                {'icon': Icons.rate_review, 'subsection': 'Review Abstracts'}
              ]
            },
            {'icon': Icons.collections_bookmark_rounded, 'subtitle': 'Paper', 'sub': [
              {'icon': Icons.collections_bookmark_sharp, 'subsection': 'Review Full Paper'},

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
              {'icon': Icons.app_registration, 'subsection': 'Registration'},
                {'icon': Icons.home_work_rounded, 'subsection': 'Accommodation Fee'},
                {'icon': Icons.person, 'subsection': 'Bank Details'},
                {'icon': Icons.app_registration, 'subsection': 'Receipt Setting'},

              ]},

            {'icon': Icons.discount, 'subtitle': 'Coupons'},
            {'icon': Icons.punch_clock, 'subtitle': 'Set-Check-In/Check-Out'},


          ]
        },


        {'icon': Icons.info, 'subtitle': 'About'},
        {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},
        {'icon': Icons.contact_mail, 'subtitle': 'Contact'},

      ];
    } else {
      // Default items for other roles
      filteredList = [

        {'icon': Icons.event, 'subtitle': 'All Conferences '},
        {'icon': Icons.padding_rounded, 'subtitle': 'Paper'},
        {'icon': Icons.home_filled, 'subtitle': 'Accommodation'},
        {'icon': Icons.work_outline, 'subtitle': 'How Its Works Delegate'},

        {'icon': Icons.info, 'subtitle': 'About'},
        {'icon': Icons.miscellaneous_services, 'subtitle': 'Services'},

        {'icon': Icons.contact_mail, 'subtitle': 'Contact'},

      ];
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header
          UserAccountsDrawerHeader(
            accountName: Text(
              "",
              style: FTextStyle.nameProfile,
            ),
            accountEmail: Text(
              "Smart Conference",
              style: FTextStyle.nameProfile,
            ),
            decoration: const BoxDecoration(
              color: AppColors.appSky,
            ),
            // currentAccountPicture: Padding(
            //   padding: const EdgeInsets.fromLTRB(8.0,8.0,0.0,0.0,),
            //   child: CircleAvatar(
            //
            //     backgroundColor: Colors.white,
            //
            //     child: Icon(Icons.person, color: AppColors.appSky,c),
            //   ),
            // ),
          ),

          // Menu List
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: filteredList.map((item) {
                if (item['title'] != null) {
                  return Container(
                    color: expandedItem == item['subtitle']
                        ? Colors.grey.shade200
                        : Colors.white,
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        key: PageStorageKey(item['subtitle']),
                        leading: Icon(
                          item['icon'],
                          size: 22,
                          color: expandedItem == item['subtitle']
                              ? AppColors.appSky
                              : AppColors.aboutUsHeadingColor,
                        ),
                        title: Text(
                          item['subtitle'],
                          style: FTextStyle.drawerText.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: expandedItem == item['subtitle']
                                ? AppColors.appSky
                                : AppColors.aboutUsHeadingColor,
                          ),
                        ),
                        initiallyExpanded: expandedItem == item['subtitle'],
                        onExpansionChanged: (isExpanded) {
                          setState(() {
                            expandedItem = isExpanded ? item['subtitle'] : null;
                            expandedSubItem = null;
                          });
                        },
                        children: item['title'].map<Widget>((childItem) {
                          if (childItem['sub'] != null) {
                            return Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                key: PageStorageKey(childItem['subtitle']),
                                leading: Icon(
                                  childItem['icon'],
                                  size: 18,

                                  color: expandedSubItem == childItem['subtitle']
                                      ? Colors.black
                                      : AppColors.aboutUsHeadingColor,
                                ),
                                title: Text(
                                  childItem['subtitle'],
                                  style: FTextStyle.drawerText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: expandedSubItem == childItem['subtitle']
                                        ? Colors.black
                                        : AppColors.aboutUsHeadingColor,
                                  ),
                                ),
                                initiallyExpanded: expandedSubItem == childItem['subtitle'],
                                onExpansionChanged: (isExpanded) {
                                  setState(() {
                                    expandedSubItem = isExpanded ? childItem['subtitle'] : null;
                                  });
                                },
                                children: childItem['sub'].map<Widget>((subItem) {
                                  return Material(
                                    color: selectedSubSection == subItem['subsection']
                                        ? Colors.blue.shade50
                                        : Colors.grey.shade400,
                                    child: ListTile(
                                      dense: true,
                                      leading: Icon(
                                        subItem['icon'],
                                        size: 18,

                                        color: selectedSubSection == subItem['subsection']
                                            ? AppColors.appSky
                                            : AppColors.aboutUsHeadingColor,
                                      ),
                                      title: Text(
                                        subItem['subsection'],
                                        style: FTextStyle.drawerText.copyWith(
                                          fontSize: 14,
                                          fontWeight: selectedSubSection == subItem['subsection']
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: selectedSubSection == subItem['subsection']
                                              ? AppColors.appSky
                                              : AppColors.aboutUsHeadingColor,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedSubSection = subItem['subsection'];
                                        });
                                        _subSectionHandleNavigation(subItem['subsection']);
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          } else {
                            return ListTile(
                              dense: true,
                              leading: Icon(
                                childItem['icon'],
                                size: 18,

                                color: AppColors.aboutUsHeadingColor,
                              ),
                              title: Text(
                                childItem['subtitle'],
                                style: FTextStyle.drawerText.copyWith(fontSize: 14, ),
                              ),
                              onTap: () {
                                _subtitleHandleNavigation(childItem['subtitle']);
                              },
                            );
                          }
                        }).toList(),
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    dense: true,
                    leading: Icon(
                      item['icon'],
                      size: 18,

                      color: AppColors.aboutUsHeadingColor,
                    ),
                    title: Text(
                      item['subtitle'],
                      style: FTextStyle.drawerText.copyWith(fontSize: 14, fontWeight: FontWeight.bold,),
                    ),
                    onTap: () {
                      _handleNavigation(item['subtitle']);
                    },
                  );
                }
              }).toList(),
            ),
          ),
        ],
      ),
    );



  }


// Helper method to handle navigation
  void _handleNavigation(String subtitle) {
    switch (subtitle) {
      case 'Delegates Registration':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'Delegates Registration',)),
        );
        break;
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
      // case 'Accommodation Organizer':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const AccommodationOrganizationScreen()),
      //   );
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
        case 'Disclaimer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Disclaimer()),
        );
        break;
      case 'How Its Works Organizer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HowWorksScreen()),
        );
        break;
        case 'Attendance':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'Attendance',)),
        );
        break;
      case 'Conferences':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ConferenceCategory(selectedRole: widget.selectedRole,)),
        );
        break;
        case 'Accommodation Organization':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'AccommodationOrganization',)),
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const AccommodationCategoryOrganization()),
        // );
        break;
      case 'How Its Works Delegate':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HowWorksDelegates()),
        );
        break;
      case 'Bank Data':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BankDetailsPage()),
        );
        break;
      case 'Plans & Pricing':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  PricingScreen()),
        );
        break;
      case 'All Conferences ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesConference(selectedRole: widget.selectedRole,)),
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
      // case 'Logout':
      //   _showLogDialog(-1);
      //   break;
      default:
        break;
    }
  }
  void _subtitleHandleNavigation(String subtitle) {
    switch (subtitle) {
      // case 'Delegates Registration':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) =>  DelegatesRegistration()),
      //   );
      //   break;


        case 'Manual Attendance':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'ManualAttendance',)),
        );
        break;
        // case 'QR Attendance':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'QRAttendance',)),
        // );
        // break;

        //Deadline-Subtitle
      case 'Delegate Category':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegateCategory()),
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

        case 'Review Full Paper':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'ReviewFullPaper',)),
        );
        // case 'Review Full Paper':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  FullPaperReview()),
        // );
        break;
        case 'Manage Abstract Session/Themes':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AbstractOrganizer()),
        );
        break;
        case 'Review Abstracts':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DelegatesRegistration(pageTypes: 'ReviewAbstracts',)),
        );
        break;
        // case 'Review Abstracts':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  ReviewAbstractOrganizer()),
        // );
        // break;
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

      case 'Registration':
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
  //
  // void _showLogDialog(int index) {
  //   if (_isLogoutDialogVisible) return; // Prevent showing multiple dialogs
  //
  //   _isLogoutDialogVisible = true; // Set the flag when showing the dialog
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         backgroundColor: AppColors.greyLight,
  //         child: Padding(
  //           padding:  EdgeInsets.all(16.0),
  //           child: Container(
  //             color: AppColors.greyLight,
  //             height: MediaQuery.of(context).size.height*0.15,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text("Are you sure you want to logout?", style: FTextStyle.preHeadingStyle),
  //                 SizedBox(height: MediaQuery.of(context).size.height*0.04),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     TextButton(
  //                       style: TextButton.styleFrom(
  //                         backgroundColor: AppColors.boarderColour,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(25.0),
  //                         ),
  //                       ),
  //                       child: const Text("Cancel", style: TextStyle(color: Colors.black)),
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                         _isLogoutDialogVisible = false; // Reset the flag when closed
  //                       },
  //                     ),
  //                     const SizedBox(width: 10),
  //                     TextButton(
  //                       style: TextButton.styleFrom(
  //                         backgroundColor: AppColors.appSky,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(25.0),
  //                         ),
  //                       ),
  //                       child: const Text("OK", style: TextStyle(color: Colors.white)),
  //                       onPressed: () {
  //                         PrefUtils.setIsLogin(false);
  //                         PrefUtils.setToken("");
  //                         // Save user
  //                         PrefUtils.setUserEmailLogin("");
  //                         // Save  role
  //                         // PrefUtils.setUserId(0);
  //
  //                         PrefUtils.setUserPassword("");
  //                         Navigator.pushAndRemoveUntil(
  //                           context,
  //                           MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
  //                               (route) => false, // This will remove all previous routes
  //                         ); // Close the dialog
  //                         _isLogoutDialogVisible = false; // Reset the flag
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   ).then((_) {
  //     _isLogoutDialogVisible = false; // Reset the flag when the dialog is closed
  //   });
  // }

}
