import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class ViewBankDetails extends StatefulWidget {
  const ViewBankDetails({super.key});

  @override
  State<ViewBankDetails> createState() => _ViewBankDetailsState();
}

class _ViewBankDetailsState extends State<ViewBankDetails> {
  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    // Other animations unchanged for brevity
  };

  final List<Map<String, String>> details = [
    {"Account Name": "Indian Society of Chemists and Biologists Science and Technology"},
    {"Bank Name": "State Bank of India"},
    {"Bank Address": "Central Drug Research Institute, Sector-10, Jankipuram Extension, Sitapur Road, Lucknow, UP, INDIA, 226031"},
    {"Type of Account": "Saving"},
    {"Account Number": "10863773532"},
    {"IFSC": "SBIN0010174"},
    {"Swift Code": "SBININBB157"},
    {"UPI ID": "SBININBB157"},
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColour,// Coral for app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'View Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFF7E6), // Light cream background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Account Name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      details[0]["Account Name"]!,
                      style: const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Dynamic List Section
              ...details.skip(1).map(
                    (detail) {
                  final key = detail.keys.first;
                  final value = detail.values.first;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: const Color(0xFFFF8D70), width: 1.2), // Coral for border
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          key,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            value,
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),

              // Button Section
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}