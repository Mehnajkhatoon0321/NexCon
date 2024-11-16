import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_conference/screen/authFlow/login_screen.dart';
import 'package:smart_conference/screen/dashbord/home_page.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/constant.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
import 'package:smart_conference/utils/form_field_style.dart';
import 'package:smart_conference/utils/no_space_input_formatter_class.dart';

import '../../utils/validator_utils.dart';

class ForgotPassword extends StatefulWidget {
  final  String selectedRole;
  const ForgotPassword({super.key,required this.selectedRole});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isButtonEnabled = false;
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  bool isEmailFieldFocused = false;
  bool isLoading = false;
  final FocusNode _emailFocusNode = FocusNode();
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
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    print('displayType>> $displayType');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColour,
            ),
            Center(
              child: Container(
                // margin: EdgeInsets.only(
                //     top: MediaQuery.of(context).size.height * 0.10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.2,
                          0.5,
                          0.95,
                          0.3
                        ],
                        colors: [
                          Color(0xffffffff),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                        ])),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: (displayType == 'desktop' ||  displayType == 'tablet') ? 50 : 20),
                  children: [

                    SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/applogo.png',
                        width: (displayType == 'desktop' || displayType == 'tablet')
                            ? 450.w
                            : 250,
                        height:
                        (displayType == 'desktop' || displayType == 'tablet')
                            ? 100.h
                            : 140,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Forgot Password",
                        style: FTextStyle.HeadingTxtStyle.copyWith(fontSize: 24,fontWeight: FontWeight.w600),
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    const SizedBox(height:30),
                    Center(
                      child: Text(
                        Constants.ForgotPassSubTxt,
                        style: FTextStyle.formSubheadingTxtStyle,
                        textAlign: TextAlign.center, // Aligning text to center
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: const EdgeInsets.only(top:40,bottom:15),
                      child: Form(
                          key: formKey,
                          onChanged: () {
                            if (ValidatorUtils.isValidEmailOrUsername(_email.text)) {
                              setState(() {
                                isButtonEnabled = true;
                              });
                            } else {
                              setState(() {
                                isButtonEnabled = false;
                              });
                            }
                            if (isEmailFieldFocused == true) {
                              _emailKey.currentState!.validate();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email/UserName",
                                style: FTextStyle.formLabelTxtStyle,
                              ).animateOnPageLoad(animationsMap[
                              'imageOnPageLoadAnimation2']!),
                              const SizedBox(height: 10,),
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: _emailKey,
                                  focusNode: _emailFocusNode,
                                  decoration: FormFieldStyle
                                      .defaultemailDecoration,
                                  inputFormatters: [NoSpaceFormatter()],
                                  controller: _email,
                                  validator: ValidatorUtils.emailOrUsernameValidator,
                                  onTap: () {
                                    setState(() {
                                      isEmailFieldFocused = true;
                                    });
                                  }
                              ),
                              const SizedBox(height: 15,),
                            ],
                          )
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () async {
                          setState(() {
                            if (formKey.currentState!.validate()) {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  HomePage(  selectedRole: widget.selectedRole),
                                ),
                              );
                            } else {
                              // If any field is invalid, trigger validation error display
                              formKey.currentState!.validate();
                            }
                          });
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor:
                            isButtonEnabled ? AppColors.appSky : Colors.white,
                            // Button color depending on the enabled state
                            minimumSize: Size(double.infinity, 50),
                            // Minimum height
                            maximumSize: Size(double.infinity, 50),
                            elevation: 2 // Maximum height
                        ),
                        child: Center(
                          child: Text(
                            "Continue".toUpperCase(),
                            style: FTextStyle.loginBtnStyle,
                          ),
                        ),
                      ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!,
                      ),
                    ),

                    const SizedBox(height:20),

                    GestureDetector(
                      onTap: () {
                      Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go back to",
                            style: FTextStyle.formLabelTxtStyle,
                          ),
                          Text(
                            Constants.signintoAccountTxt,
                            style: FTextStyle.authlogin_signupTxtStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}