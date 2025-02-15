import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          'About Us',
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
            Text("About Smart Conference",  style:FTextStyle.preHeadingBoldStyle),
          SizedBox(height: 10,),
            Text(
                  'Conferences are a platform where people from different parts of life come and share their knowledge and expertise with others and learn from their experiences. Our prime focus is to provide a common platform to connect people where they can learn from each other\'s experience, excel their skills, and grow together.\n\n'
            'Smart Conference is focused on providing online conference management solutions to the conference organizers. Started operations in 2014, our Conference Management System has provided online registration and other services to various national and international conferences. Smart Conference is also recognized under the StartUpIndia initiative by the Government of India.\n\n'
                'We enable conference organizers to achieve their goals by adopting a technology-inspired approach to innovation. In a highly competitive environment where information is the most valuable asset, we provide excellent solutions to answer all your critical questions. Better information systems assist in more informed decision-making and give you a strategic advantage over the competition.\n\n'
                'Our team consists of domain experts, system analysts, project managers, and technology experts. We have an excellent support system to provide you with professional assistance. Our strength lies in constant innovation and process refinement practices. We progress towards making world-class products and providing truly exceptional services.',   style:FTextStyle.Faqssubtitle
            ),
          ],
        ),
      ),
    );
  }
}
