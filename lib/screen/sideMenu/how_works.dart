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
          'How It Works',
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
            Text("How it works for Conference Organizers",  style:FTextStyle.preHeadingBoldStyle),
        Text(
            'Our Conference Management System provides an easy-to-use interface for registration, allowing returning participants to register without creating a new account. We offer abstract submission with customizable submission forms and file uploads. Our submission form allows the entry of proposal type, keywords, topics, preferred sessions, authors, and presenters. The system facilitates the review of abstracts and full papers, and sends system-generated emails to participants upon acceptance or rejection of their papers, along with remarks provided by the reviewers. '
                'Additionally, we offer services such as registration fee payment, accommodation booking, travel information updates, and more. Our system enables conference administrators to set up a detailed conference schedule and program. As a conference organizer, you can manage multiple conferences through a single organizer account.\n\n'

                'To access all these features, you won’t have to pay high web server or software maintenance costs. Organizers only pay per registration, meaning you only incur a cost for each delegate that registers for your conference. We do not charge any fees from delegates.\n\n'

                'Delegates can use a single login for registering at multiple conferences. There is no need for delegates to create a new account for each new conference. They can keep track of upcoming conferences and view conference programs through their delegate panel.\n\n'

                'It takes just five minutes for a conference organizer to register, set up a conference, and start using our conference management system.'
      ,style:FTextStyle.Faqssubtitle  ),

]
      ),
      ));
  }
}
