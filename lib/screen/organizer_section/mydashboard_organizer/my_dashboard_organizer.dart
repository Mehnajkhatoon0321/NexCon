import 'package:flutter/material.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/my_conference_delegates_view.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/scanner_details.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_edit.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_view.dart';
import 'package:nexcon/screen/organizer_section/organizer_home_page.dart';
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
    },  {
      "id": "4",
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
      backgroundColor: AppColors.searchBack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildStatCard("Total Conferences", "200", Icons.event),
                  _buildStatCard("Total Registrations", "500", Icons.people),
                  _buildStatCard("Total Credits Balance", "200", Icons.account_balance_wallet),
                ],
              ),
              const SizedBox(height: 28),

              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UpgradePlan())),
                child: _buildUpgradeCard(),
              ),

              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Active Conferences", style: FTextStyle.subheading),
                  if (activeConferenceList.length > 2)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>  OrganizerHomePage(selectedRole: 'isOrganizer', isOrganizer: true,)));
                      },
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(0.0,0.0,8.0,0.0),
                        child: Text("View More >" , style: FTextStyle.label.copyWith(    fontSize: 14,
                          fontWeight: FontWeight.w600,color: AppColors.appSky,)),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 17),
              ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 10),
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
    return Flexible(
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: AppColors.appSky),
            const SizedBox(height: 12),
            Text(value, style: FTextStyle.listTitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(title, textAlign: TextAlign.center, style: FTextStyle.label.copyWith(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget _buildUpgradeCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.appSky.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.appSky.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Icon(Icons.workspace_premium_outlined, color: AppColors.appSky, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upgrade Membership", style: FTextStyle.listTitle.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text("Basic Plan", style: FTextStyle.label.copyWith(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade500),
        ],
      ),
    );
  }

  Widget _buildConferenceTile(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['conferenceName'] ?? '', style: FTextStyle.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.date_range, size: 16, color: AppColors.secondYellowColour),
              const SizedBox(width: 6),
              Text("${Constants.formatDate(item['fromDate'])} → ${Constants.formatDate(item['toDate'])}", style: FTextStyle.style),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.how_to_reg, size: 16, color: AppColors.appSky),
                  const SizedBox(width: 4),
                  Text("Reg: ${item['registration']}", style: FTextStyle.style),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text("Waiting: ${item['registrationWait']}", style: FTextStyle.style),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Booking Status: ', style: FTextStyle.style),
                TextSpan(
                  text: item['bookingStatus'],
                  style: FTextStyle.style.copyWith(
                    fontWeight: FontWeight.bold,
                    color: item['bookingStatus'] == "Approved" ? AppColors.appSky : Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _iconActionButton(
                icon: Icons.remove_red_eye_outlined,
                color: AppColors.secondaryColour,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyConferenceOrganizerView(id: item['id'].toString()),
                  ));
                },
              ),
              const SizedBox(width: 12),
              _iconActionButton(
                icon: Icons.edit_outlined,
                color: const Color(0xFF0db050),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyConferenceOrganizerEdit(isEdit: 'yes', title: item['conferenceName']),
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }







}
