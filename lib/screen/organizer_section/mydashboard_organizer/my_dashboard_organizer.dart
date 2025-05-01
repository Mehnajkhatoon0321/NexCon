import 'package:flutter/material.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/upgrade_plan.dart';

import 'package:nexcon/utils/colours.dart';
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
                  _buildStatCard("Credits Balance", "200", Icons.account_balance_wallet),
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
                          AppColors.primaryColour, // Green 0DB050
                          AppColors.secondaryColour, // Blue 023E8A
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
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
                            Text("Upgrade Membership", style: FTextStyle.subheading.copyWith(color: Colors.white)),
                            SizedBox(height: 4),
                            Text("Basic Plan", style: FTextStyle.body.copyWith(color: Colors.white70)),
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
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryColour, size: 28),
            SizedBox(height: 8),
            Text(value, style: FTextStyle.subheading),
            SizedBox(height: 4),
            Text(title, style: FTextStyle.label),
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
        children: [
          Text(item['conferenceName'] ?? '', style: FTextStyle.subheading),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.date_range, size: 18, color: AppColors.primaryColour),
              SizedBox(width: 6),
              Text("${item['fromDate']} - ${item['toDate']}", style: FTextStyle.body),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.how_to_reg, size: 18, color: AppColors.primaryColour),
                  SizedBox(width: 4),
                  Text("Registrations: ${item['registration']}", style: FTextStyle.body),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18, color: Colors.orange),
                  SizedBox(width: 4),
                  Text("Waiting: ${item['registrationWait']}", style: FTextStyle.body),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}




