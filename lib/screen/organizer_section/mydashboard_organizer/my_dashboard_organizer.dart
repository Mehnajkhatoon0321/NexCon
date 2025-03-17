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
    {"id":"1",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration":"200",
      "registrationWait":"1200",
    },
    {
      "id":"2",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration":"200",
      "registrationWait":"1200",
    },
    {
      "id":"3",
      'bookingStatus': "Approved",
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26",
      "registration":"200",
      "registrationWait":"1200",
    },
    {"id":"4",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
      ,
      "registration":"200",
      "registrationWait":"1200",
    },

    {
      "id":"5",
      'bookingStatus': "Approved",
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
      ,
      "registration":"200",
      "registrationWait":"1200",
    },
    {
      "id":"6",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
      ,
      "registration":"200",
      "registrationWait":"1200",
    },
    {
      "id":"7",
      'bookingStatus': "Approved",
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
      ,
      "registration":"200",
      "registrationWait":"1200",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(

              width: double.infinity, // Makes the container take full width
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.primaryColourDark,
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primaryColourDark,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 0.5),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Total Conferences",
                          style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                              color: AppColors.formFieldHintColour, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "200",
                          style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                            color: AppColors.primaryColourDark,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),


                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 9,
                    child: Icon(
                      Icons.data_thresholding_rounded,
                      size: 29,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0), // Add horizontal padding
            child: Container(

              width: double.infinity, // Makes the container take full width
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.primaryColour,
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primaryColour,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 0.5),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Total Registrations",
                          style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                              color: AppColors.formFieldHintColour, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 10),
                        Text(
                          "500",
                          style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                            color: AppColors.primaryColour,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 9,
                    child: Icon(
                      Icons.today,
                      size: 29,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(

              width: double.infinity, // Makes the container take full width
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.yellow,
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.yellow,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 0.5),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Credit Balance",
                          style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                              color: AppColors.formFieldHintColour, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "200",
                          style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                            color: AppColors.primaryColourDark,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),


                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 9,
                    child: Icon(
                      Icons.data_thresholding_rounded,
                      size: 29,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(

          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>UpgradePlan())),



            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0), // Add horizontal padding
              child: Container(

                width: double.infinity, // Makes the container take full width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.primaryColour,
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.primaryColour,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 0.5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Upgrade Membership",
                            style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                                color: AppColors.formFieldHintColour, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 10),
                          Text(
                            "500",
                            style: FTextStyle.authlogin_signupTxtStyle.copyWith(
                              color: AppColors.primaryColour,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 9,
                      child: Icon(
                        Icons.today,
                        size: 29,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text("My Active Conferences",style: FTextStyle.headingMiddle,),
),
    Expanded(
      child: ListView.builder(
      itemCount: activeConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
      final item = activeConferenceList[index];
      final bookingStatus = item['bookingStatus'] ?? 'Pending';
      return Container(
      // height: height * 0.16,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
      color: index % 2 == 0
      ? const Color(0xFFFFF7E6)
          : const Color(0xFFFF8D70).withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
      BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 6,
      offset: const Offset(0, 3),
      ),
      ],
      ),
      child: Row(
      children: [
      Expanded(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(
      item['conferenceName']!,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: FTextStyle.listTitle
      ),
      const SizedBox(height: 6),
      Row(
      children: [
      Icon(Icons.confirmation_number, size: 18, color: Colors.grey[600]),
      const SizedBox(width: 3),
      Text(
      "Conference ID: ${item['conferenceId']}",
      style: FTextStyle.listTitleSub
      ),
      ],
      ),
      const SizedBox(height: 6),
        Row(
      children: [
      Icon(Icons.app_registration, size: 18, color: Colors.grey[600]),
      const SizedBox(width: 3),
      Text(
      "Total Registration: ${item['registration']}",
      style: FTextStyle.listTitleSub
      ),
      ],
      ),
        Row(
          children: [
            Icon(Icons.logo_dev, size: 18, color: Colors.grey[600]),
            const SizedBox(width: 3),
            Text(
                "Registration Wait List: ${item['registrationWait']}",
                style: FTextStyle.listTitleSub
            ),
          ],
        ),
      const SizedBox(height: 6),
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text(
      'Booking Status: ', style: FTextStyle.listTitleSub),
      Text(
      bookingStatus,
      style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: bookingStatus == "Approved"
      ? Colors.green
          : Colors.orange,
      ),
      ),
      ],
      ),
      const SizedBox(height: 6),
      Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
      const SizedBox(width: 3),
      Text(
      "${item['fromDate']} - ${item['toDate']}",
      style: FTextStyle.listTitleSub
      ),
      ],
      ),
      SizedBox(height: 10,),
      // Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.end,
      // children: [
      // GestureDetector(
      // onTap: () {
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (context) =>
      // MyConferenceOrganizerView(id: item['id'],
      //
      // ),
      // ),
      // );
      // },
      // child: Container(
      // height: 35,
      // width: 35,
      //
      // decoration: BoxDecoration(
      // color:AppColors.gray_4,
      // // Green for edit
      // borderRadius: BorderRadius.circular(8),
      // boxShadow: [
      // BoxShadow(
      // color: Colors.black.withOpacity(0.1),
      // blurRadius: 6,
      // offset: const Offset(0, 2),
      // ),
      // ],
      // ),
      // child: const Icon(
      // Icons.remove_red_eye_outlined,
      // color: Colors.white,
      // size: 20,
      // ),
      // ),
      // ),
      // SizedBox(width: 20,),
      // Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.end,
      // children: [
      // GestureDetector(
      // onTap: () {
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (context) =>
      // MyConferenceOrganizerEdit(
      // conferenceName: item["conferenceName"],
      // fromdata: item['fromDate'] ?? 'N/A',
      // todata:  item['toDate'] ?? 'N/A',
      //
      // ),
      // ),
      // );
      // },
      // child: Container(
      // height: 35,
      // width: 35,
      //
      // decoration: BoxDecoration(
      // color: const Color(0xFF0db050),
      // // Green for edit
      // borderRadius: BorderRadius.circular(8),
      // boxShadow: [
      // BoxShadow(
      // color: Colors.black.withOpacity(0.1),
      // blurRadius: 6,
      // offset: const Offset(0, 2),
      // ),
      // ],
      // ),
      // child: const Icon(
      // Icons.edit,
      // color: Colors.white,
      // size: 20,
      // ),
      // ),
      // ),
      //
      // ],
      // ),
      // ],
      // ),
      ],
      ),
      ),

      ],
      ),
      );
      }
      ),
    )

        ],
      )


    );
  }
}
