import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:url_launcher/url_launcher.dart';
class MyConferenceDelegatesView extends StatefulWidget {
  String id ;
   MyConferenceDelegatesView({required this.id,super.key});

  @override
  State<MyConferenceDelegatesView> createState() => _MyConferenceDelegatesViewState();
}

class _MyConferenceDelegatesViewState extends State<MyConferenceDelegatesView> {
  final Map<String, dynamic> featuresCategoryDetails = {
    "id": "1",
    "title": "30th ISCB International Conference (ISCBC-2025)",
    "subTitle": "Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29",
    "imageConference": "assets/images/IndianConferences.png",
    "organizationImage": "assets/images/conferencesOrganization.png",
    "organizationName": "Indian Society of Chemists and Biologists",
    "startDate": "2025-01-27",
    "endDate": "2025-01-29",
    "nameVenue": "Lucknow, Uttar Pradesh, India",
    "addressVenue": "Lucknow, Uttar Pradesh, India",
    "city": "Lucknow",
    "contactPerson": "Dr. P.M.S. Chauhan",
    "phone": "9695844884",
    "email": "iscbconference@gmail.com",
    "siteLink": "https://www.iscbconference.com"
  };
  bool isLoading = false;
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
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };
  final double _cardPadding = 20;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ), // Menu icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Conference Details',
          style: FTextStyle.HeadingTxtWhiteStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor:AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              featuresCategoryDetails["title"]!,
              style: FTextStyle.subheading
            ).animateOnPageLoad(animationsMap[
            'imageOnPageLoadAnimation2']!),
            const SizedBox(height: 8),

            /// Subtitle
            Text(
              featuresCategoryDetails["subTitle"]!,
              style:FTextStyle.style,
              textAlign: TextAlign.justify,
            ).animateOnPageLoad(animationsMap[
          'imageOnPageLoadAnimation2']!),
      const SizedBox(height: 8),

            const SizedBox(height: 24),

            /// Organizer Info
            _buildInfoTile("Organized By", featuresCategoryDetails["organizationName"]!),

            const SizedBox(height: 16),

            /// Dates & Logo
            _buildCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabelValue("Start Date", Constants.formatDate(featuresCategoryDetails["startDate"])),
                        const SizedBox(height: 12),
                        _buildLabelValue("End Date", Constants.formatDate(featuresCategoryDetails["endDate"])),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      featuresCategoryDetails["organizationImage"]!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap[
              'imageOnPageLoadAnimation2']!),

            ),

            const SizedBox(height: 20),

            /// Venue Info
            _buildMinimalSection(
              icon: Icons.location_on_outlined,

              title: "Venue",
              data: {
                "Venue": featuresCategoryDetails["nameVenue"],
                "Address": featuresCategoryDetails["addressVenue"],
                "City": featuresCategoryDetails["city"],
              },
            ),

            const SizedBox(height: 20),

            /// Contact Info
            _buildMinimalSection(
              icon: Icons.mail_outline,
              title: "Contact",
              data: {
                "Person": featuresCategoryDetails["contactPerson"],
                "Phone": featuresCategoryDetails["phone"],
                "Email": featuresCategoryDetails["email"],
                "Website": featuresCategoryDetails["siteLink"],
              },
              enableLinks: true,
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    ).animateOnPageLoad(animationsMap[
    'imageOnPageLoadAnimation2']!);
  }

  Widget _buildLabelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600])).animateOnPageLoad(animationsMap[
    'imageOnPageLoadAnimation2']!),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)).animateOnPageLoad(animationsMap[
    'imageOnPageLoadAnimation2']!),
      ],
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style:FTextStyle.style),
        const SizedBox(height: 4),
        Text(value, style:FTextStyle.subheading),
      ],
    );
  }

  Widget _buildMinimalSection({
    required IconData icon,
    required String title,
    required Map<String, String?> data,
    bool enableLinks = false,
  }) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.secondYellowColour),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          ...data.entries.map((e) {
            final key = e.key;
            final value = e.value ?? "";
            final isLink = (key.toLowerCase() == "email" || key.toLowerCase() == "website");

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "$key:",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: isLink && enableLinks
                        ? GestureDetector(
                      onTap: () {

                          if (key.toLowerCase() == "email") {
                            Constants.launchEmail;
                          } else if (key.toLowerCase() == "website") {
                            Constants.launchWebsite(value);
                          } else if (key.toLowerCase().contains("phone") || key.toLowerCase().contains("whatsapp")) {
                            Constants.launchWhatsApp(value.replaceAll(RegExp(r'[^0-9]'), '')); // clean phone number
                          }


                      },
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,

                        ),
                      ),
                    )
                        : Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }


}


