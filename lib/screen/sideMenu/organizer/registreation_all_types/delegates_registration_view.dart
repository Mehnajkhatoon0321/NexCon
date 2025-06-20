import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class DelegatesRegistrationView extends StatefulWidget {
  final String id;  // Add the id property
  const DelegatesRegistrationView({super.key,required this.id});

  @override
  State<DelegatesRegistrationView> createState() => _DelegatesRegistrationViewState();
}


class _DelegatesRegistrationViewState
    extends State<DelegatesRegistrationView> {
  final List<Map<String, String>> detail = [
    {
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "Registration No": "1",
      "bookingStatus": "Approved",
      "delegatesName": "Mehnaj ",
      "delegatesCategory": "Speaker",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Delegates Registration Details',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: detail.map((data) {
              return Container(
                // margin: const EdgeInsets.only(bottom: 24),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(20),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black12.withOpacity(0.1),
                //       blurRadius: 12,
                //       offset: const Offset(0, 4),
                //     ),
                //   ],
                // ),
                child: Column(
                  children: [

                    buildDetailRow("Registration No", data["Registration No"]),
                    buildDetailRow("Conference  Name",   data['title']),
                    buildDetailRow("Delegates Category", data["delegatesCategory"]),
                    buildDetailRow("Delegate Name", data["delegatesName"]),
                    buildDetailRow("Gender", data["sex"]),

                    buildDetailRow("Email", data["email"]),
                    buildDetailRow("Country", data["country"]),
                    buildDetailRow("City", data["city"]),

                    buildDetailRow("Registration Date", data["registrationDate"]),
                    // buildDetailRow("Booking Status", data["bookingStatus"],
                    //     valueColor: data["bookingStatus"] == "Approved"
                    //         ? Colors.green
                    //         : Colors.red),


                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String? value, {Color? valueColor}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              "$title:",
              style: FTextStyle.listTitle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 6,
            child: Text(
              value ?? "-",
              style: valueColor != null
                  ? FTextStyle.listTitleSub
                  .copyWith(color: valueColor, fontWeight: FontWeight.bold)
                  : FTextStyle.listTitleSub,
            ),
          ),
        ],
      ),
    );
  }
}


