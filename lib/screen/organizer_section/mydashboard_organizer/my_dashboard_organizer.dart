import 'package:flutter/material.dart';
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
                  _buildStatCard("Total  Credits Balance", "200", Icons.account_balance_wallet),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UpgradePlan())),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gradient, // Green 0DB050
                          AppColors.secondYellowColour, // Blue 023E8A

                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.2, 0.9],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.upgrade, color: Colors.white, size: 28),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Upgrade Membership", style: FTextStyle.listTitle.copyWith(color: Colors.white)),
                            SizedBox(height: 4),
                            Text("Basic Plan", style: FTextStyle.style.copyWith(color: Colors.white70)),
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
            Text(title, style: FTextStyle.label,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

  Widget _buildConferenceTile(Map<String, dynamic> item) {
    return Container(
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
          Text(item['conferenceName'] ?? '', style: FTextStyle.subtitle),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.date_range, size: 18, color: AppColors.secondYellowColour),
              SizedBox(width: 6),
              Text("${Constants.formatDate(item['fromDate'])}  → ${Constants.formatDate(item['toDate'])}", style: FTextStyle.style),
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
                  Text("Registrations: ${item['registration']}", style: FTextStyle.style),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18, color: Colors.orange),
                  SizedBox(width: 4),
                  Text("Waiting: ${item['registrationWait']}", style: FTextStyle.style),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}




