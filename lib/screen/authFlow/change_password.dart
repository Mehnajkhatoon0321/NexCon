import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/no_space_input_formatter_class.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../utils/form_field_style.dart';

class ChangePassword extends StatefulWidget {
final  String selectedRole;
  const ChangePassword({required this.selectedRole,super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isButtonEnabled = false;
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  bool isEmailFieldFocused = false;
  bool isLoading = false;
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
  bool oldPasswordVisible = true; // Initial password visibility state
  bool newPasswordVisible = true; // Initial password visibility state
  bool confirmPasswordVisible = true; // Initial password visibility state

  final GlobalKey<FormFieldState<String>> _oldPasswordKey =  GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _newPasswordKey =  GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _confirmPasswordKey = GlobalKey<FormFieldState<String>>();

  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool isOldPasswordFieldFocused = true;
  bool isNewPasswordFieldFocused = false;
  bool isConfirmPasswordFieldFocused = false;

  final  FocusNode _oldPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();


  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    // print('displayType>> $displayType');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor:AppColors.appSky, // Customize app bar color
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.white,
        //       size: 28,
        //     ), // Menu icon
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   title: Text(
        //     'Change Password',
        //     style: FTextStyle.HeadingTxtWhiteStyle,
        //   ),
        //   centerTitle: true,
        // ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: (displayType == 'desktop' ||  displayType == 'tablet') ? 30 : 18),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
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
                 child: Text(
                   "Change Password",
                   style: FTextStyle.HeadingTxtStyle.copyWith(fontSize: 24,fontWeight: FontWeight.w600),
                 ),
                                ).animateOnPageLoad(animationsMap[
                                'imageOnPageLoadAnimation2']!),
                            
                                const SizedBox(height:30),
                            
                            
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
                           Constants.oldPassLabel,
                           style: FTextStyle.formLabelTxtStyle,
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         TextFormField(
                           keyboardType: TextInputType.visiblePassword,
                           key: _oldPasswordKey,
                           focusNode: _oldPasswordFocusNode,
                           decoration:
                           FormFieldStyle.defaultPasswordInputDecoration.copyWith(
                               hintText: "Enter old password",
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   oldPasswordVisible
                                       ? Icons.visibility_off
                                       : Icons.visibility,
                                   color: AppColors.FormFieldHintColour,
                                 ),
                                 onPressed: () {
                                   setState(() {
                                     oldPasswordVisible = !oldPasswordVisible;
                                   });
                                 },
                               ),
                               filled: true,
                               fillColor: Colors.white),
                           controller: _oldPassword,
                           obscureText: oldPasswordVisible,
                           inputFormatters: [NoSpaceFormatter()],
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return "Please enter old password .";
                             } else {
                               return null;
                             }
                           },
                           onTap: () {
                             setState(() {
                               isOldPasswordFieldFocused = true;
                               isNewPasswordFieldFocused = false;
                               isConfirmPasswordFieldFocused = false;
                             });
                           },
                         ),
                         SizedBox(
                           height: 20.h,
                         ),
                         Text(
                           Constants.newPassLabel,
                           style: FTextStyle.formLabelTxtStyle,
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         TextFormField(
                           keyboardType: TextInputType.visiblePassword,
                           key: _newPasswordKey,
                           focusNode: _newPasswordFocusNode,
                           decoration:
                           FormFieldStyle.defaultPasswordInputDecoration.copyWith(
                               hintText: "Enter new password",
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   newPasswordVisible
                                       ? Icons.visibility_off
                                       : Icons.visibility,
                                   color: AppColors.FormFieldHintColour,
                                 ),
                                 onPressed: () {
                                   setState(() {
                                     newPasswordVisible = !newPasswordVisible;
                                   });
                                 },
                               ),
                               filled: true,
                               fillColor: Colors.white),
                           controller: _newPassword,
                           obscureText: newPasswordVisible,
                           inputFormatters: [NoSpaceFormatter()],
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return "Please enter new password .";
                             } else {
                               return null;
                             }
                           },
                           onTap: () {
                             setState(() {
                               isOldPasswordFieldFocused = false;
                               isNewPasswordFieldFocused = true;
                               isConfirmPasswordFieldFocused = false;
                             });
                           },
                         ),
                         SizedBox(
                           height: 20.h,
                         ),
                         Text(
                           Constants.confirmPassLabel,
                           style: FTextStyle.formLabelTxtStyle,
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         TextFormField(
                           keyboardType: TextInputType.visiblePassword,
                           key: _confirmPasswordKey,
                           focusNode: _confirmPasswordFocusNode,
                           decoration:
                           FormFieldStyle.defaultPasswordInputDecoration
                               .copyWith(
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   confirmPasswordVisible
                                       ? Icons.visibility_off
                                       : Icons.visibility,
                                   color: AppColors.FormFieldHintColour,
                                 ),
                                 onPressed: () {
                                   setState(() {
                                     confirmPasswordVisible = !confirmPasswordVisible;
                                   });
                                 },
                               ),
                               filled: true,
                               fillColor: Colors.white),
                           controller: _confirmPassword,
                           obscureText: confirmPasswordVisible,
                           inputFormatters: [NoSpaceFormatter()],
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return "Please enter confirm password .";
                             } else {
                               return null;
                             }
                           },
                           onTap: () {
                             setState(() {
                               isOldPasswordFieldFocused = false;
                               isNewPasswordFieldFocused = false;
                               isConfirmPasswordFieldFocused = true;
                             });
                           },
                         ),
                         SizedBox(
                           height: 20.h,
                         ),
                            
                       ],
                     )
                 ),
                                ).animateOnPageLoad(animationsMap[
                                'imageOnPageLoadAnimation2']!),
                                const SizedBox(height: 25,),
                                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18.0),
                 child: ElevatedButton(
                   onPressed: ()  {
                     setState(() {
                       if (formKey.currentState!.validate()) {
                            
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>  RoleSelectionScreen(
                               // selectedRole:widget.selectedRole
                             ),
                           ),
                         );
                       } else {
                         // If any field is invalid, trigger validation error display
                         formKey.currentState!.validate();
                       }
                     });
                   }
                   ,
                   style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30),
                     ),
                     backgroundColor:
                     isButtonEnabled ? AppColors.appSky :  AppColors.formFieldBorderColour,
                     // Button color depending on the enabled state
                     minimumSize: const Size(double.infinity, 50),
                     // Minimum height
                     maximumSize: const Size(double.infinity, 50),
                     // elevation: 2 // Maximum height
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
                            
                                const SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
