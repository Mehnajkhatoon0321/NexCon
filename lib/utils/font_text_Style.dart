import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_conference/utils/colours.dart';



class FTextStyle {



  static const smallTextBlack =TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static const smallY = TextStyle(
      fontFamily: 'OpenSans-Regular',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.headingTxtColour );

  static TextStyle HeadingTxtStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.headingTxtColour,


      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w500);



  static const searchText = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 13,
    color: Color(0x66000000),
    fontWeight: FontWeight.w400,
  );


  static TextStyle SplashHeadingTab = TextStyle(
      fontSize: 38.sp,
      color: AppColors.primaryColour,


      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w900);

  static TextStyle HeadingTxtWhiteStyle = TextStyle(
      fontSize: 20.sp,
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold);

  static TextStyle preHeadingStyle = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontFamily: 'OpenSans',
  );

  static TextStyle preHeading16BoldStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold
  );

  static TextStyle preHeadingBoldStyle = TextStyle(
      fontSize: 18.sp,
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold
  );


  static TextStyle SubHeadingTxtStyle = const TextStyle(
      fontSize: 16,
      color: AppColors.headingTxtColour,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400);

  //14 normal
  static  TextStyle formLabelTxtStyle = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 15.sp,
     fontWeight: FontWeight.w400,
    color: Colors.black,
  );


  static TextStyle formSubheadingTxtStyle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.FormFieldHintColour,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w600);



  static TextStyle rememberMeTextStyle = TextStyle(
    fontFamily: 'OpenSans',
    //fontSize: 10.sp,

    fontSize: 14.sp,
    color: AppColors.appSky,
    fontWeight: FontWeight.w400,
  );

  static  TextStyle SeeAllTextStyle = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16,
    color: AppColors.primaryColour,
    fontWeight: FontWeight.bold,
  );





  static TextStyle authlogin_signupTxtStyle = TextStyle(

      fontSize: 16.sp,
      color: AppColors.headingTxtColour,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold);


  static TextStyle forgotPasswordTxtStyle = TextStyle(
    //fontSize: 10.sp,

      fontSize: 14.sp,
      color: AppColors.appSky,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400);




  //16 normal
  static TextStyle formErrorTxtStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.FormFielderrorColour,
    fontFamily: 'OpenSans',
  );

  static TextStyle loginBtnStyle = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.0,
    color: Colors.white,
  );
  static TextStyle nameProfile = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16.sp,
    // fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle emailProfile = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Guest user text style

  static TextStyle drawerText = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerTextColor,
  );
  static TextStyle drawerButton1Text = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle drawerButton2Text = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle bottomNavText1 = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle bottomNavText2 = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.bottomNavTextColor,
  );
  static TextStyle aboutUsText2 = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.aboutUsHeadingColor,
  );





  static const TextStyle formhintTxtStyle = TextStyle(
    // fontSize: 11.sp,  //16 normal
      fontSize: 16, //16 normal
      color: AppColors.FormFieldHintColour,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400);

  static const TextStyle listTitle = TextStyle(

letterSpacing: 1.2,
    fontFamily: 'OpenSans',

    fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black,

  );
  static const TextStyle listTitleBig = TextStyle(


    fontFamily: 'OpenSans',

    fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black,

  );
  static const TextStyle listTitleSub = TextStyle(


    fontFamily: "OpenSans",
    letterSpacing: 1.0,

    fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey,

  );
  static const TextStyle listTitleSubBig = TextStyle(


    fontFamily: "OpenSans",

    fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey,

  );

  static TextStyle TextSnakbar = TextStyle(
    fontFamily: 'OpenSans-Regular',
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );














  static  TextStyle FaqsTxtStyle = TextStyle(
      fontSize: 15.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w800);

  static  TextStyle Faqssubtitle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w500);





  static TextStyle cartItemColors = TextStyle(
      fontSize: 14.sp,
      color: AppColors.contactUsTextcolor,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400);




  static  TextStyle headingMiddle = TextStyle(
      fontSize: 15
          .sp,
      letterSpacing: 2.0,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w800);












}
