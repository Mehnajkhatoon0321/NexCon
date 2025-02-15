import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class HowWorksScreen extends StatefulWidget {
  const HowWorksScreen({super.key});

  @override
  State<HowWorksScreen> createState() => _HowWorksScreenState();
}

class _HowWorksScreenState extends State<HowWorksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
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
          'Work Conference Organizer',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How it works for Conference Organizers",
              style: FTextStyle.preHeadingBoldStyle,
            ),
            SizedBox(height: 20,),
            Text(
              'Our Conference Management System provides an easy-to-use interface for registration, allowing returning participants to register without creating a new account. We offer abstract submission with customizable submission forms and file uploads. Our submission form allows the entry of proposal type, keywords, topics, preferred sessions, authors, and presenters. The system facilitates the review of abstracts and full papers, and sends system-generated emails to participants upon acceptance or rejection of their papers, along with remarks provided by the reviewers.\n\n'
                  'Additionally, we offer services such as registration fee payment, accommodation booking, travel information updates, and more. Our system enables conference administrators to set up a detailed conference schedule and program. As a conference organizer, you can manage multiple conferences through a single organizer account.\n\n'
                  'To access all these features, you won’t have to pay high web server or software maintenance costs. Organizers only pay per registration, meaning you only incur a cost for each delegate that registers for your conference. We do not charge any fees from delegates.\n\n'
                  'Delegates can use a single login for registering at multiple conferences. There is no need for delegates to create a new account for each new conference. They can keep track of upcoming conferences and view conference programs through their delegate panel.\n\n'
                  'It takes just five minutes for a conference organizer to register, set up a conference, and start using our conference management system.',
              style: FTextStyle.Faqssubtitle,
            ),
            SizedBox(height: 20),
            Text(
              "Steps to Follow by Conference Organizers",
              style: FTextStyle.preHeadingBoldStyle,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint("Register your conference for FREE listing and get our BASIC membership."),
                _buildBulletPoint("Upgrade membership from BASIC to PRO or ELITE."),
                _buildBulletPoint("To upgrade membership, purchase Credit Points added to your e-Wallet."),
                _buildBulletPoint("1 Credit Point = 1 Delegate."),
                _buildBulletPoint(
                    "For registering 100 delegates, purchase 100 Credit Points. Each registration deducts 1 Credit Point from your e-Wallet."),
                _buildBulletPoint(
                    "For registrations exceeding the purchased points, buy additional Credit Points to view registered delegates."),
                _buildBulletPoint("Purchase as low as 1 Credit Point."),
                _buildBulletPoint(
                    "Use Credit Points for multiple conferences simultaneously without expiry."),
                _buildBulletPoint("Withdraw unused Credit Points anytime."),
                _buildBulletPoint("Set up your conference details."),
                _buildBulletPoint("Generate registration form link and start registration."),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: const Icon(Icons.circle, size: 8, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: FTextStyle.Faqssubtitle,
            ),
          ),
        ],
      ),
    );
  }
}
