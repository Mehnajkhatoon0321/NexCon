import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/utils/colours.dart';




class FTextStyle {



  static const smallTextBlack =TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static const smallY = TextStyle(
      fontFamily: 'Montserrat-Regular',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.headingTxtColour );

  static TextStyle HeadingTxtStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.headingTxtColour,


      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500);



  static const searchText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 13,
    color: Color(0x66000000),
    fontWeight: FontWeight.w400,
  );


  static TextStyle SplashHeadingTab = TextStyle(
      fontSize: 38.sp,
      color: AppColors.appSky,


      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w900);

  static TextStyle HeadingTxtWhiteStyle = TextStyle(
      fontSize: 18.sp,
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold);

  static TextStyle preHeadingStyle = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );

  static TextStyle preHeading16BoldStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold
  );

  static TextStyle preHeadingBoldStyle = TextStyle(
      fontSize: 18.sp,
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold
  );


  static TextStyle SubHeadingTxtStyle = const TextStyle(
      fontSize: 16,
      color: AppColors.headingTxtColour,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400);

  //14 normal
  static  TextStyle formLabelTxtStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
     fontWeight: FontWeight.w400,
    color: Colors.black,
  );


  static TextStyle formSubheadingTxtStyle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.FormFieldHintColour,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600);



  static TextStyle rememberMeTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    //fontSize: 10.sp,

    fontSize: 14.sp,
    color: AppColors.appSky,
    fontWeight: FontWeight.w400,
  );

  static  TextStyle SeeAllTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    color: AppColors.appSky,
    fontWeight: FontWeight.bold,
  );





  static TextStyle authlogin_signupTxtStyle = TextStyle(

      fontSize: 16.sp,
      color: AppColors.headingTxtColour,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold);


  static TextStyle forgotPasswordTxtStyle = TextStyle(
    //fontSize: 10.sp,

      fontSize: 14.sp,
      color: AppColors.appSky,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400);




  //16 normal
  static TextStyle formErrorTxtStyle = TextStyle(
    fontSize: 10.sp,
    color: AppColors.FormFielderrorColour,
    fontFamily: 'Montserrat',
  );

  static TextStyle loginBtnStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.0,
    color: Colors.white,
  );
  static TextStyle nameProfile = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    // fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle emailProfile = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Guest user text style

  static TextStyle drawerText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerTextColor,
  );
  static TextStyle drawerButton1Text = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle drawerButton2Text = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle bottomNavText1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle bottomNavText2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.bottomNavTextColor,
  );
  static TextStyle aboutUsText2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.aboutUsHeadingColor,
  );





  static const TextStyle formhintTxtStyle = TextStyle(
    // fontSize: 11.sp,  //16 normal
      fontSize: 15, //16 normal
      color: AppColors.FormFieldHintColour,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400);
  static const TextStyle style = TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  static const TextStyle listTitle = TextStyle(

// letterSpacing: 1.2,
    fontFamily: 'Montserrat',

    fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black,

  );
  static const TextStyle listTitleBig = TextStyle(


    fontFamily: 'Montserrat',

    fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black,

  );
  static const TextStyle listTitleSub = TextStyle(


    fontFamily: "Montserrat",
    letterSpacing: 1.0,

    fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey,

  );
  static const TextStyle listTitleSubBig = TextStyle(


    fontFamily: "Montserrat",

    fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey,

  );

  static TextStyle TextSnakbar = TextStyle(
    fontFamily: 'Montserrat-Regular',
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );














  static  TextStyle FaqsTxtStyle = TextStyle(
      fontSize: 15.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800);

  static  TextStyle Faqssubtitle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500);

  static  TextStyle subtitle = TextStyle(
      fontSize: 12.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500);





  static TextStyle cartItemColors = TextStyle(
      fontSize: 14.sp,
      color: AppColors.contactUsTextcolor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400);




  static  TextStyle headingMiddle = TextStyle(
      fontSize: 15
          .sp,
      // letterSpacing: 2.0,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800);


//change ui
//   static  TextStyle HeadingTxtWhiteStyle = TextStyle(
//     color: Colors.white,
//     fontSize: 15.sp,
//     fontWeight: FontWeight.w700, // Bold
//     fontFamily: 'Montserrat', // Use global font
//   );

  // Navigation Bar Selected Style
  static const TextStyle navBarSelectedStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600, // Semi-Bold
    color: Colors.white,
    fontFamily: 'Montserrat',
  );

  // Navigation Bar Unselected Style
  static const TextStyle navBarUnselectedStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular weight
    color: Colors.white70,
    fontFamily: 'Montserrat',
  );

  // Heading Style
  static const TextStyle heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.textPrimaryColor,
    fontFamily: 'Montserrat', // Font family applied globally
  );

  // Subheading Style
  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-Bold
    color: AppColors.textPrimaryColor,
    fontFamily: 'Montserrat',
  );

  // Body Text Style
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondaryColor,
    fontFamily: 'Montserrat',
  );

  // Label Style
  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400, // Regular weight
    fontFamily: "Montserrat", // Specify font family
    color: AppColors.textSecondaryColor,
  );






}
