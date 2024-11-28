import 'package:flutter/material.dart';
import 'package:smart_conference/screen/authFlow/edit_profile.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/font_text_Style.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
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
            'My Profile',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.23,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Container(
                      width: height*0.15, // Adjust width as needed
                      height: height*0.15, // Adjust height as needed
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200, // Background color for placeholder
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profile.png'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Delegate Registration Number :  ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "00014027",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),

                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Name :  ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "	Ms Mehnaj Khatoon",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Sex :  ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "	female",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Date of Birth : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "2003-08-01",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Email : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "mehnaj0321@gmail.com",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Designation/Profession : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "Flutter Developer",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Institution/ Affiliation : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "Webgrade Technology",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("City : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "Lucknow",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Country : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "India",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Address for Correspondence : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "DLF my pad India",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Telephone (O) : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "+43546456456",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Telephone (R) : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "+43546456456",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ), Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Mobile : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "9695844884",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Website : ", style: FTextStyle.Faqssubtitle),
                        ),
                        const Expanded(
                          child: Text(
                            "https://smartconference.in/cms/delegate/dashboard",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: SizedBox(
                  height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfile(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primaryColour,
                    ),
                    child: Text(
                      "Edit Profile",
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
