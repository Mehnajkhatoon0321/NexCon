import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_conference/screen/delegates_section/delegates_home_page.dart';
import 'package:smart_conference/screen/delegates_section/featured_conferences.dart';
import 'package:smart_conference/screen/authFlow/forgot_password.dart';
import 'package:smart_conference/screen/authFlow/organizer_register.dart';

import 'package:smart_conference/screen/organizer_section/organizer_home_page.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/constant.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
import 'package:smart_conference/utils/form_field_style.dart';
import 'package:smart_conference/utils/no_space_input_formatter_class.dart';
import 'package:smart_conference/utils/pref_utils.dart';
import 'package:smart_conference/utils/validator_utils.dart';

class LoginScreen extends StatefulWidget {
  final String selectedRole;

  const LoginScreen({super.key, required this.selectedRole});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _emailKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _passwordKey =
      GlobalKey<FormFieldState<String>>();
  late final FocusNode _emailFocusNode = FocusNode();
  late final FocusNode _passwordFocusNode = FocusNode();

  bool checkboxChecked = false;
  bool isButtonEnabled = false;

  bool passwordVisible = false;
  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;



  bool isLoading = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    checkboxChecked = PrefUtils.getRememberMe();
    if (checkboxChecked) {
      _email.text = PrefUtils.getUserEmailLogin();
      _password.text = PrefUtils.getUserPassword();
    }

    _email.addListener(_updateButtonState);
    _password.addListener(_updateButtonState);
    _updateButtonState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = checkboxChecked &&
          _email.text.isNotEmpty &&
          _password.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (displayType == 'desktop' || displayType == 'tablet')
                  ? 50
                  : 20,
            ),
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.appSky,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Align(
                      alignment: Alignment.center, // Center the icon within the container
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          ), // Menu icon
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                    child: Text(
                      "Welcome to NexCon! Let's get you signed in",
                      style: FTextStyle.headingMiddle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Form(
                    key: formKey,
                    onChanged: () {
                      if (ValidatorUtils.isValidEmailOrUsername(_email.text) &&
                          ValidatorUtils.isValidPass(_password.text)) {
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
                      if (isPasswordFieldFocused == true) {
                        _passwordKey.currentState!.validate();
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${Constants.emailLabel}/UserName",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 5),
                        TextFormField(
                          key: _emailKey,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          decoration: FormFieldStyle.defaultemailDecoration,
                          inputFormatters: [NoSpaceFormatter()],
                          controller: _email,
                          validator: ValidatorUtils.emailOrUsernameValidator,
                          onTap: () {
                            setState(() {
                              isEmailFieldFocused = true;
                              isPasswordFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 15),
                        Text(
                          "Password",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          key: _passwordKey,
                          focusNode: _passwordFocusNode,
                          decoration: FormFieldStyle
                              .defaultPasswordInputDecoration
                              .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black45,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          controller: _password,
                          obscureText: !passwordVisible,
                          inputFormatters: [NoSpaceFormatter()],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }

                            if (!ValidatorUtils.isValidPass(value)) {
                              return 'Password must be at least 8 characters';
                            }

                            return null; // Password is valid
                          },
                          onTap: () {
                            setState(() {
                              isPasswordFieldFocused = true;
                              isEmailFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              checkboxChecked = !checkboxChecked;
                              print('Checkbox checked: $checkboxChecked');

                              PrefUtils.setRememberMe(checkboxChecked);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: IconTheme(
                              data: const IconThemeData(
                                color: AppColors.appSky,
                                size: 20,
                              ),
                              child: Icon(
                                checkboxChecked
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          Constants.rememberMeTxt,
                          style: FTextStyle.listTitleSub.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(
                              selectedRole: widget.selectedRole,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: FTextStyle.listTitleSub.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        // All fields are valid, proceed with submission
                        setState(() {
                          isLoading = true; // Start loading
                        });
                        if (widget.selectedRole == 'isselect organizer') {
                          setState(() {
                            PrefUtils.setIsLogin(true);
                            PrefUtils.setRoleSelection(widget.selectedRole);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                               OrganizerHomePage(selectedRole: widget.selectedRole,),
                            ),
                          );
                        } else {
                          setState(() {
                            PrefUtils.setIsLogin(true);
                            PrefUtils.setRoleSelection("");
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeDelegates( selectedRole: widget.selectedRole,),
                            ),
                          );
                        }

                      } else {
                        // If any field is invalid, trigger validation error display
                        formKey.currentState!.validate();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: isButtonEnabled
                            ? AppColors.primaryColour
                            : AppColors.formFieldBorderColour,
                        // Button color depending on the enabled state
                        minimumSize: const Size(double.infinity, 50),
                        // Minimum height
                        maximumSize: const Size(double.infinity, 50),
                        // elevation: 1 // Maximum height
                        ),
                    child: Center(
                      child: Text(
                        "Log in",
                        style: FTextStyle.loginBtnStyle,
                      ),
                    ),
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "New here ? ",
                        style: FTextStyle.listTitleSub.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.selectedRole == 'isselect organizer') {
                              setState(() {
                                PrefUtils.setIsLogin(true);
                                PrefUtils.setRoleSelection(widget.selectedRole);
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OrganizerRegister(),
                                ),
                              );
                            }

                            else {
                              setState(() {
                                setState(() {
                                  PrefUtils.setIsLogin(true);
                                  PrefUtils.setRoleSelection("");
                                });
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                       FeaturedConferences( selectedRole: widget.selectedRole,),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Create an Account",
                            style: FTextStyle.listTitleSub.copyWith(
                                color: AppColors.appSky,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
