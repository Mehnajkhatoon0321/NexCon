import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/sideMenu/common_section/privacy_policy.dart';
import 'package:nexcon/screen/sideMenu/common_section/term_condition.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';

import 'package:nexcon/utils/pref_utils.dart';
import 'package:nexcon/utils/validator_utils.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> data = [
    'Conference listing',
    'Support Request',
  ];
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
  final formKey = GlobalKey<FormState>();
  String? selectCountryNamesCategories;
  String? selectTitleName;
  String? selectCategoryName;
  String? genderTitleName;
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _messageController = TextEditingController();
  late final TextEditingController _first = TextEditingController();

  late final TextEditingController _mobileNumber = TextEditingController();


  late final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();  late final GlobalKey<FormFieldState<String>> _messageKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _countryKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _firstKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _mobileKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _genderKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _emailFocusNode = FocusNode();
  late final FocusNode _messageFocusNode = FocusNode();
  late final FocusNode _mobileFocusNode = FocusNode();
  late final FocusNode _firstFocusNode = FocusNode();

  late final FocusNode _selectGenderFocusNode = FocusNode();
  late final FocusNode _countryFocusNode = FocusNode();
  bool checkboxChecked = false;
  bool isButtonEnabled = false;
  bool passwordVisible = false;
  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;
  bool isFirstFieldFocused = false;
  bool isLastFieldFocused = false;
  bool isMobileFieldFocused = false;
  bool isDateBirthFieldFocused = false;
  bool isCityBirthFieldFocused = false;
  bool isCountryFieldFocused = false;
  bool isCategoryFieldFocused = false;
  bool isLoading = false;
  bool rememberMe = false;
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
          'Contact Us',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Text("Sales:",style: FTextStyle.headingMiddle,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ",style: FTextStyle.listTitleSub,),
                      Text("+91 8090367090",style: FTextStyle.listTitle,),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ",style: FTextStyle.listTitleSub,),
                      Text("ravi@smartconference.in",style: FTextStyle.listTitle,),
                    ],

                  ),

                ],
              ),
            ),
            Divider(height: 1,thickness: 1.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Text("Support:",style: FTextStyle.headingMiddle,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ",style: FTextStyle.listTitleSub,),
                      Text("+91 9935237183",style: FTextStyle.listTitle,),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ",style: FTextStyle.listTitleSub,),
                      Text("support@smartconference.in",style: FTextStyle.listTitle,),
                    ],

                  ),


                ],
              ),
            ),
            Divider(height: 1,thickness: 1.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Text("Corporate Office:",style: FTextStyle.headingMiddle,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('B2-1211, DLF My Pad,\nVibhuti Khand, Gomti Nagar\nLucknow - 226010 (U.P.)\nIndia',style: FTextStyle.listTitleSub,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ",style: FTextStyle.listTitleSub,),
                      Text("+91 9935237183",style: FTextStyle.listTitle,),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ",style: FTextStyle.listTitleSub,),
                      Text("support@smartconference.in",style: FTextStyle.listTitle,),
                    ],

                  ),


                ],
              ),
            ),
            Divider(height: 1,thickness: 1.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Text("Regd. Office:",style: FTextStyle.headingMiddle,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('315/41, Bagh Maha Narayan, Chowk\nLucknow - 226003\n(U.P.), India',style: FTextStyle.listTitleSub,),


                ],
              ),
            ),
            Divider(height: 1,thickness: 1.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Text("Fill in a few details and we'll get back to you at the earliest!",style: FTextStyle.listTitleSub,),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Query Type Field
                    Text("Query Type", style: FTextStyle.SubHeadingTxtStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _genderKey,
                        focusNode: _selectGenderFocusNode,
                        value: genderTitleName,
                        hint: const Text("Query Type", style: FTextStyle.formhintTxtStyle),
                        items: data.map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        )).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            genderTitleName = newValue;
                          });
                          _genderKey.currentState?.validate(); // Validate only this field
                        },
                        decoration: FormFieldStyle.dropDown,
                        validator: ValidatorUtils.model,
                      ),
                    ),

                    // Country Field
                    Text("Country", style: FTextStyle.SubHeadingTxtStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField<String>(
                        key: _countryKey,
                        focusNode: _countryFocusNode,
                        value: selectCountryNamesCategories,
                        hint: const Text("Select country", style: FTextStyle.formhintTxtStyle),
                        items: Constants.countryNamesCategories.map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        )).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectCountryNamesCategories = newValue;
                          });
                          _countryKey.currentState?.validate(); // Validate only this field
                        },
                        decoration: FormFieldStyle.dropDown,
                        validator: ValidatorUtils.model,
                      ),
                    ),

                    // Name Field
                    Text("Name", style: FTextStyle.SubHeadingTxtStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _firstKey,
                        focusNode: _firstFocusNode,
                        keyboardType: TextInputType.name,
                        controller: _first,
                        decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                          fillColor: AppColors.formFieldBackColour,
                          hintText: "Enter Name",
                        ),
                        validator: ValidatorUtils.nameValidator,
                        onChanged: (value) {
                          setState(() {
                            // Validate only the name field
                            _firstKey.currentState?.validate();
                          });
                        },
                        onFieldSubmitted: (_) {
                          _firstFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(_mobileFocusNode);
                        },
                      ),
                    ),

                    // Mobile Number Field
                    Text("Mobile Number", style: FTextStyle.SubHeadingTxtStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _mobileKey,
                        focusNode: _mobileFocusNode,
                        keyboardType: TextInputType.number,
                        controller: _mobileNumber,
                        decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                          fillColor: AppColors.formFieldBackColour,
                          hintText: "Enter Mobile Number",
                        ),
                        validator: ValidatorUtils.phoneNumberValidator,
                        onChanged: (value) {
                          setState(() {
                            // Validate only the mobile field
                            _mobileKey.currentState?.validate();
                          });
                        },
                        onFieldSubmitted: (_) {
                          _mobileFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        },
                      ),
                    ),

                    // Email Field
                    Text(Constants.emailLabel, style: FTextStyle.SubHeadingTxtStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _emailKey,
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                          fillColor: AppColors.formFieldBackColour,
                          hintText: "Enter Email",
                        ),
                        validator: ValidatorUtils.emailValidator,
                        onChanged: (value) {
                          setState(() {
                            // Validate only the email field
                            _emailKey.currentState?.validate();
                          });
                        },
                        onFieldSubmitted: (_) {
                          _emailFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(_messageFocusNode);
                        },
                      ),
                    ),

                    // Message Field
                    Text("Message", style: FTextStyle.SubHeadingTxtStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _messageKey,
                        focusNode: _messageFocusNode,
                        keyboardType: TextInputType.multiline,
                        controller: _messageController,
                        maxLines: 4,
                        decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                          fillColor: AppColors.formFieldBackColour,
                          hintText: "Enter your message...",
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Message cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            // Validate only the message field
                            _messageKey.currentState?.validate();
                          });
                        },
                        onFieldSubmitted: (_) {
                          _messageFocusNode.unfocus();
                        },
                      ),
                    ),

                    // Terms & Conditions
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              checkboxChecked = !checkboxChecked;
                              PrefUtils.setRememberMe(checkboxChecked);
                            });
                          },
                          child: Icon(
                            checkboxChecked ? Icons.check_box : Icons.check_box_outline_blank,
                            color: AppColors.appSky,
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: "I accept ", style: FTextStyle.listTitleSub.copyWith(fontSize: 13, color: Colors.black)),
                                TextSpan(
                                  text: "Terms & Conditions",
                                  style: FTextStyle.listTitleSub.copyWith(fontSize: 13, color: Colors.red),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TermCondition()));
                                  },
                                ),
                                TextSpan(text: " and ", style: FTextStyle.listTitleSub.copyWith(fontSize: 13, color: Colors.black)),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: FTextStyle.listTitleSub.copyWith(fontSize: 13, color: Colors.red),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    // Submit Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Form is valid, show success dialog
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.all(20),
                                // title: Center(
                                //   child: Text(
                                //     "Success!",
                                //     style: FTextStyle.listTitleSub.copyWith(    fontSize: 24,
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.green,)
                                //   ),
                                // ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 60,
                                      color: Colors.green,
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: Text(
                                          "Success!",
                                          style: FTextStyle.listTitleSub.copyWith(    fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,)
                                      ),
                                    ),
                                    Text(
                                      "Form submitted successfully!",
                                      style: FTextStyle.listTitleSub,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(height: 10),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        clearFormFields(); // Clear the form fields
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                        backgroundColor: Colors.green,

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Text(
                                        "OK",
                                        style:FTextStyle.listTitleSub.copyWith(color: Colors.white)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );

                          } else {
                            // Form is invalid

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          backgroundColor:  AppColors.appSky ,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Center(child: Text("Submit", style: FTextStyle.loginBtnStyle)),
                      ),
                    ),
                  ],
                ),
              ),
            ),





          ],
        ),
      ),
    );
  }
  void clearFormFields() {
    _first.clear();
    _mobileNumber.clear();
    _email.clear();
    _messageController.clear();
    setState(() {
      genderTitleName = null;
      selectCountryNamesCategories = null;
    });
    _firstFocusNode.unfocus();
    _mobileFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _messageFocusNode.unfocus();
  }
}
