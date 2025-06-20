import 'package:flutter/material.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/my_conference_delegates_view.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/scanner_details.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_edit.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_view.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/upgrade_plan.dart';

import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class MyDashboardOrganizer extends StatefulWidget {
  const MyDashboardOrganizer({super.key});

  @override
  State<MyDashboardOrganizer> createState() => _MyDashboardOrganizerState();
}

class _MyDashboardOrganizerState extends State<MyDashboardOrganizer> {
  List<dynamic> activeConferenceList = [
    {
      "id": "1",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "1200",
    },
    {
      "id": "2",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "5th International Tech & Innovation Summit",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "1200",
    },
    {
      "id": "3",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "1200",
    },
    // Additional conference data...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard("Total Conferences", "200", Icons.event),
                  _buildStatCard("Total Registrations", "500", Icons.people),
                  _buildStatCard("Total  Credits Balance", "200",
                      Icons.account_balance_wallet),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => UpgradePlan())),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [

                          AppColors.gradient, // Green 0DB050
                          // AppColors.secondYellowColour, // Blue 023E8A
                          AppColors.appSky, // Green 0DB050
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        // stops: [0.2, 0.9],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: AppColors.shadowColor, blurRadius: 6)
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.upgrade, color: Colors.white, size: 28),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Upgrade Membership",
                                style: FTextStyle.listTitle.copyWith(
                                    color: Colors.white)),
                            SizedBox(height: 4),
                            Text("Basic Plan", style: FTextStyle.style.copyWith(
                                color: Colors.white70)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),
              Text("Active Conferences", style: FTextStyle.heading),
              SizedBox(height: 12),
              ListView.separated(
                itemCount: activeConferenceList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = activeConferenceList[index];
                  return _buildConferenceTile(item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        height: 140,
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.appSky, size: 28),
            SizedBox(height: 8),
            Text(value, style: FTextStyle.listTitle),
            SizedBox(height: 4),
            Text(title, style: FTextStyle.label, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

  Widget _buildConferenceTile(Map<String, dynamic> item) {
    return  Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(item['conferenceName'] ?? '',           style: FTextStyle.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.date_range, size: 18,
                  color: AppColors.secondYellowColour),
              SizedBox(width: 6),
              Text("${Constants.formatDate(item['fromDate'])}  → ${Constants
                  .formatDate(item['toDate'])}", style: FTextStyle.style),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.how_to_reg, size: 18, color: AppColors.appSky),
                  SizedBox(width: 4),
                  Text("Registrations: ${item['registration']}",
                      style: FTextStyle.style),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18, color: Colors.orange),
                  SizedBox(width: 4),
                  Text("Waiting: ${item['registrationWait']}",
                      style: FTextStyle.style),
                ],
              ),
            ],
          ),
          SizedBox(height: 2,),
          Row(
            children: [
              const Text(
                  'Booking Status: ', style: FTextStyle.style),
              Text(
                  item['bookingStatus'],
                  style: FTextStyle.style.copyWith(color: item['bookingStatus'] == "Approved"
                      ? AppColors.appSky
                      : Colors.orange,                     fontWeight: FontWeight.bold,)

              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              SizedBox(width: 10,),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) =>
              //               ScannerDetails()
              //       ),
              //     );
              //   },
              //   child: Container(
              //     height: 35,
              //     width: 35,
              //
              //     decoration: BoxDecoration(
              //       color:AppColors.secondYellowColour,
              //       // Green for edit
              //       borderRadius: BorderRadius.circular(8),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.1),
              //           blurRadius: 6,
              //           offset: const Offset(0, 2),
              //         ),
              //       ],
              //     ),
              //     child: const Icon(
              //       Icons.qr_code_scanner,
              //       color: Colors.white,
              //       size: 20,
              //     ),
              //   ),
              // ), SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyConferenceOrganizerView(id: item['id'].toString(),

                          ),
                    ),
                  );
                },
                child: Container(
                  height: 35,
                  width: 35,

                  decoration: BoxDecoration(
                    color:AppColors.secondaryColour,
                    // Green for edit
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyConferenceOrganizerEdit(isEdit: 'yes', title: item['conferenceName'],

                        ),
                      )
                  );  },

                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0db050),
                    // Green background
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         SizedBox(width: 10,),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) =>
          //                     MyConferenceOrganizerView(id: item['id']
          //                         .toString(),
          //
          //                     ),
          //               ),
          //             );
          //           },
          //           child: Container(
          //             height: 32,
          //             width: 35,
          //
          //             decoration: BoxDecoration(
          //               color: AppColors.secondaryColour,
          //               // Green for edit
          //               borderRadius: BorderRadius.circular(8),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.black.withOpacity(0.1),
          //                   blurRadius: 6,
          //                   offset: const Offset(0, 2),
          //                 ),
          //               ],
          //             ),
          //             child: const Icon(
          //               Icons.remove_red_eye_outlined,
          //               color: Colors.white,
          //               size: 20,
          //             ),
          //           ),
          //         ),
          //         SizedBox(width: 10,),
          //
          //       ],
          //     ),
          //     const SizedBox(height: 4),
          //   ],
          // ),
        ],
      ),
    );

  }





}
