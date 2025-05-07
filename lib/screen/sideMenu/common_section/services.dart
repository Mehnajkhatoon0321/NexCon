import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
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
          'Services',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Services We Offer", style: FTextStyle.headingMiddle),
            Text(
              'Conferences are a platform where people from different parts of life come and share their knowledge and expertise with others and learn from their experiences. Our prime focus is to provide a common platform to connect people where they can learn from each other\'s experience, excel their skills, and grow together.\n\n'
                  'Smart Conference is focused on providing online conference management solutions to the conference organizers. Started operations in 2014, our Conference Management System has provided online registration and other services to various national and international conferences. Smart Conference is also recognized under the StartUpIndia initiative by the Government of India.\n\n'
                  'We enable conference organizers to achieve their goals by adopting a technology-inspired approach to innovation. In a highly competitive environment where information is the most valuable asset, we provide excellent solutions to answer all your critical questions. Better information systems assist in more informed decision-making and give you a strategic advantage over the competition.\n\n'
                  'Our team consists of domain experts, system analysts, project managers, and technology experts. We have an excellent support system to provide you with professional assistance. Our strength lies in constant innovation and process refinement practices. We progress towards making world-class products and providing truly exceptional services.',
              style: FTextStyle.style,
            ),
            SizedBox(height: 16.0),
            Text(
              'For Conference Organizers:',
              style: FTextStyle.listTitle,
            ),
            SizedBox(height: 8.0),
            ...[
              'FREE listing of Conference',
              'Manage multiple Conferences from Single Login',
              'Delegate Registration',
              'Fee Payments',
              'Abstract Submission',
              'Full Paper Submission',
              'Review of Abstracts',
              'Accommodation Booking',
              'Travel Information',
              'Minute-to-minute Conference Programme',
              'e-Wallet',
              'Automatic reminders to delegates',
              'Conference Registration Desk Management Services',
              'Live Webcast',
              'Designing and Printing of Conference Kit (invitation cards, banners, brochures, souvenirs, conference bags, caps, T-Shirts, badges, proceedings or other printed materials)',
            ].map((item) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 6,),
                Expanded(
                  child: Text(
                    item,
                    style: FTextStyle.style,
                  ),
                ),

              ],
            )).toList(),

            SizedBox(height: 16.0),

            // Section for Delegates/Attendees
            Text(
              'For Delegates/Attendees:',
              style: FTextStyle.listTitle,
            ),
            SizedBox(height: 8.0),
            ...[
              'Conference searching by topic',
              'Subscribe for conference alerts',
              'Single login for registration for multiple conferences',
              'Keep records of the upcoming & previous conferences',
              'Fee Payments',
              'Abstract Submission',
              'Full Paper Submission',
              'Accommodation Booking',
              'Travel Information',
              'Minute-to-minute Conference Programme',
              'Print Conference Ticket',
              'Print Invoices',
              'View Live Webcast',
            ].map((item) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.circle,
                  size: 12.0,
                  color: Colors.black54,
                ),
                SizedBox(width: 6,),
                Expanded(
                  child: Text(
                    item,
                    style: FTextStyle.style,
                  ),
                ),

              ],
            )).toList(),
          ],
        ),
      ),

    );
  }
}
