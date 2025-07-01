import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/api_services/all_module_role/commons_api/auth_flow/auth_flow_bloc.dart';

import 'package:nexcon/screen/authFlow/organizer_register.dart';
import 'package:nexcon/screen/delegates_section/delegates_home_page.dart';
import 'package:nexcon/screen/guest_flow/delegates_register_process/featured_conferences.dart';
import 'package:nexcon/screen/organizer_section/organizer_home_page.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/no_space_input_formatter_class.dart';
import 'package:nexcon/utils/pref_utils.dart';
import 'package:nexcon/utils/validator_utils.dart';

import 'forgot_password.dart';
import 'dart:developer' as developer;


class LoginScreen extends StatefulWidget {
  final String selectedRole;

  const LoginScreen({super.key, required this.selectedRole});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Future<bool> _checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return false; // No internet connection
  }
  return true; // Internet connection is available
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

  List<dynamic> conferenceManagement=[
    "Register a conference for free"
    "24 x 7 online suppport"
    "Reach out to our large number of registered users"
    "Accept payments in INR, USD & EURO"
    "Get access to Conference Management System"
        "Pay only for delegates registered"
  ];

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
      backgroundColor: AppColors.cardColor,
      body: BlocConsumer<AuthFlowBloc, AuthFlowState>(
        listener: (context, state) {
          if (state is AuthFlowLoading) {
            setState(() {
              isLoading = true;
            });
          }


          else if (state is LogSuccess) {
            setState(() {
              isLoading = false;
              PrefUtils.setIsLogin(true);

              if (checkboxChecked) {
                PrefUtils.setUserEmailLogin(_email.text);
                PrefUtils.setUserPassword(_password.text);
              } else {
                PrefUtils.getUserEmailLogin();  // 🔄 Only keep data if Remember Me
                PrefUtils.getUserPassword();
              }
            });

            Map<String, dynamic> data = state.logResponse;
            developer.log('LoginResponse>>>>>>>>$data');

            if (data.containsKey('token') && data.containsKey('user')) {
              String bearerToken = data['token'];
              Map<String, dynamic> user = data['user'];

              if (user.containsKey('role')) {
                String email = user['email'];
                print("Email>>>>>>>>$email");
                PrefUtils.setToken(bearerToken);
                PrefUtils.setUserEmailLogin(email);  // still ok for session only



                if (widget.selectedRole == 'isselect organizer') {
                  setState(() {
                    PrefUtils.setIsLogin(true);
                    PrefUtils.setRoleSelection(widget.selectedRole);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrganizerHomePage(selectedRole: widget.selectedRole, isOrganizer: false,),
                    ),
                  );
                }

                else {
                  setState(() {
                    PrefUtils.setIsLogin(true);
                    PrefUtils.setRoleSelection("isselect delegate");
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeDelegates( selectedRole: widget.selectedRole,),
                    ),
                  );
                }

              }
              }
            }

          else if (state is LogFailure) {
            setState(() {
              isLoading = false;
            });

            CommonPopups.showCustomPopup(context, state.failureMessage);

          }
          else if(state is AuthServerFailure){
            setState(() {
              isLoading = false;
            });
            String errorMessage = state.error;
            if (errorMessage.contains('SocketException') || errorMessage.contains('ClientException')) {
              CommonPopups.showCustomPopup(
                context,
                "Network Error: Unable to connect to the server. Please check your internet connection.",
              );
            } else {
              // Show the failure message for other errors
              CommonPopups.showCustomPopup(context, errorMessage);
            }


          }
        else  if (state is CheckNetworkLoginConnection) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
  builder: (context, state) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (displayType == 'desktop' || displayType == 'tablet')
              ? 50
              : 20,
        ),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
                          // print('Checkbox checked: $checkboxChecked');

                          PrefUtils.setRememberMe(checkboxChecked);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconTheme(
                          data: const IconThemeData(
                            color: AppColors.appSky,
                            size: 18,

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
                        builder: (context) => ForgotPassword(selectedRole: '',


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
                onPressed: isButtonEnabled
                    ? () async {
                  FocusScope.of(context).unfocus(); // Dismiss keyboard

                  final hasInternet = await _checkInternetConnection();
                  if (!hasInternet) {
                    CommonPopups.showCustomPopup(context, "Please check internet connection");
                    return;
                  }

                  if (formKey.currentState!.validate()) {

                    if (widget.selectedRole == 'isselect organizer') {
                      setState(() {
                        PrefUtils.setIsLogin(true);
                        PrefUtils.setRoleSelection(widget.selectedRole);
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrganizerHomePage(selectedRole: widget.selectedRole, isOrganizer: false,),
                        ),
                      );
                    }

                    else {
                      setState(() {
                        PrefUtils.setIsLogin(true);
                        PrefUtils.setRoleSelection("isselect delegate");
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeDelegates( selectedRole: widget.selectedRole,),
                        ),
                      );
                    }
                    // BlocProvider.of<AuthFlowBloc>(context).add(
                    //   LogEventHandler(
                    //     email: _email.text.trim(),
                    //     password: _password.text.trim(),
                    //
                    //   ),
                    // );
                  }
                  else {
                    // If any field is invalid, trigger validation error display
                    formKey.currentState!.validate();
                  }
                }
                    : null,

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: isButtonEnabled
                        ? AppColors.appSky
                        : AppColors.formFieldBorderColour,
                    // Button color depending on the enabled state
                    minimumSize: const Size(double.infinity, 50),
                    // Minimum height
                    maximumSize: const Size(double.infinity, 50),
                    // elevation: 1 // Maximum height
                    ),
                child: Center(
                  child: isLoading
    ? CircularProgressIndicator(
    color: Colors.white)
        : Text(
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
                              // PrefUtils.setIsLogin(true);
                              // PrefUtils.setRoleSelection("");
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
      );
  },
),
    );
  }

}
