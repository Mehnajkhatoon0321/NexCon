import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/screen/authFlow/registrationFeePage.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/delegates_section/delegates_home_page.dart';
import 'package:nexcon/screen/sideMenu/common_section/privacy_policy.dart';
import 'package:nexcon/screen/sideMenu/common_section/term_condition.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/custom_popup.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/no_space_input_formatter_class.dart';
import 'package:nexcon/utils/pref_utils.dart';
import 'package:nexcon/utils/validator_utils.dart';

class DelegateRegister extends StatefulWidget {
final  String title;
final  String selectedRole;
const DelegateRegister({required this.title,required this.selectedRole, super.key});
@override
State<DelegateRegister> createState() => _DelegateRegisterState();
}

class _DelegateRegisterState extends State<DelegateRegister> {
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
  late final TextEditingController _first = TextEditingController();
  late final TextEditingController _last = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final TextEditingController _mobileNumber = TextEditingController();
  late final TextEditingController _dateBirth = TextEditingController();
  late final TextEditingController _city = TextEditingController();

  late final GlobalKey<FormFieldState<String>> _emailKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _countryKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _selectTitleKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _selectCategoryKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _dateBirthKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _cityKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _firstKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _lastKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _mobileKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _passwordKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _genderKey =
      GlobalKey<FormFieldState<String>>();
  late final FocusNode _emailFocusNode = FocusNode();
  late final FocusNode _mobileFocusNode = FocusNode();
  late final FocusNode _firstFocusNode = FocusNode();
  late final FocusNode _lastFocusNode = FocusNode();
  late final FocusNode _passwordFocusNode = FocusNode();
  late final FocusNode _dateBirthFocusNode = FocusNode();
  late final FocusNode _cityFocusNode = FocusNode();
  late final FocusNode _countryFocusNode = FocusNode();
  late final FocusNode _selectTitleFocusNode = FocusNode();
  late final FocusNode _selectCategoryFocusNode = FocusNode();
  late final FocusNode _selectGenderFocusNode = FocusNode();

  bool checkboxChecked = false;
  bool isButtonEnabled = false;



  List<String> sexTitleName = [
    'Male',
    'Female',
  ];

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
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body:      ListView(
          padding: EdgeInsets.symmetric(
              horizontal:
              (displayType == 'desktop' || displayType == 'tablet')
                  ? 10
                  : 13),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 42,
                width: 42,
                decoration: const BoxDecoration(
                  color: AppColors.appSky,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  // Center the icon within the container
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
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Registration For Delegates",
                style: FTextStyle.headingMiddle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${widget.title}",
              style: FTextStyle.headingMiddle.copyWith(
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),
            const SizedBox(
              height: 35,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Important Instructions:",
                    style: FTextStyle.listTitle.copyWith(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Click here to view ",
                    style: FTextStyle.listTitleSub
                        .copyWith(fontSize: 13, color: Colors.black),
                  ),
                  TextSpan(
                    text: "Registration Fee",
                    style: FTextStyle.listTitleSub
                        .copyWith(fontSize: 13, color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Action to view registration fee
                        // For example, navigate to another page or open a link
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationFeePage(),
                          ),
                        );
                      },
                  ),
                  TextSpan(
                    text:
                    ". After registration you will receive your login credentials on your registered email id for the conference delegate panel powered by SmartConference. Pay registration fee and submit abstract and other information through your delegate login panel only.",
                    style: FTextStyle.listTitleSub
                        .copyWith(fontSize: 13, color: Colors.black),
                  ),
                ],
              ),
            ).animateOnPageLoad(
              animationsMap['imageOnPageLoadAnimation2']!,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Form(
                key: formKey,
                onChanged: () {
                  if (ValidatorUtils.isValidEmail(_email.text) &&
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
                      height: 20,
                    ),
                    Text(
                      "Delegate Category *",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _selectCategoryKey,
                        focusNode: _selectCategoryFocusNode,
                        value: selectCategoryName,
                        menuMaxHeight: 300,
                        hint: const Text(
                          "Select Category",
                          style: FTextStyle.formhintTxtStyle,
                        ),
                        items:
                        Constants.categoryName
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Container(
                              constraints: const BoxConstraints(maxWidth: 300),
                              child: Text(category)),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectCategoryName = newValue;
                          });

                          isCategoryFieldFocused = true;
                        },
                        decoration: FormFieldStyle.dropDown,
                        validator: ValidatorUtils.model,
                      ),
                    ),
                    Text(
                      "Select Title",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _selectTitleKey,
                        focusNode: _selectTitleFocusNode,
                        value: selectTitleName,
                        hint: const Text(
                          "Select Title",
                          style: FTextStyle.formhintTxtStyle,
                        ),
                        items: Constants.titleName
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Container(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: Text(category)),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectTitleName = newValue;
                          });

                          isCountryFieldFocused = true;
                        },
                        decoration: FormFieldStyle.dropDown,
                        validator: ValidatorUtils.model,
                      ),
                    ),
                    Text(
                      "First Name",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _firstKey,
                        focusNode: _firstFocusNode,
                        keyboardType: TextInputType.name,
                        decoration: FormFieldStyle
                            .defaultemailDecoration
                            .copyWith(
                            contentPadding:
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            fillColor:
                            AppColors.formFieldBackColour,
                            hintText: "Enter First Name"),

                        controller: _first,
                        validator: ValidatorUtils.firstNameValidator,
                        onTap: () {
                          setState(() {
                            isEmailFieldFocused = false;
                            isPasswordFieldFocused = false;
                            isFirstFieldFocused = true;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Last Name",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _lastKey,
                        focusNode: _lastFocusNode,
                        keyboardType: TextInputType.name,
                        decoration: FormFieldStyle
                            .defaultemailDecoration
                            .copyWith(
                            contentPadding:
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            fillColor:
                            AppColors.formFieldBackColour,
                            hintText: "Enter Last Name"),

                        controller: _last,
                        validator: ValidatorUtils.lastNameValidator,
                        onTap: () {
                          setState(() {
                            isEmailFieldFocused = false;
                            isPasswordFieldFocused = false;
                            isLastFieldFocused = true;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Mobile Number",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _mobileKey,
                        focusNode: _mobileFocusNode,
                        keyboardType: TextInputType.number,
                        decoration: FormFieldStyle
                            .defaultemailDecoration
                            .copyWith(
                            contentPadding:
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            fillColor:
                            AppColors.formFieldBackColour,
                            hintText: "Enter Mobile Number"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: _mobileNumber,
                        validator: ValidatorUtils.phoneNumberValidator,
                        onTap: () {
                          setState(() {
                            isEmailFieldFocused = false;
                            isPasswordFieldFocused = false;
                            isFirstFieldFocused = false;
                            isMobileFieldFocused = true;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Date Of Birth",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _dateBirthKey,
                        focusNode: _dateBirthFocusNode,
                        keyboardType: TextInputType.text,
                        decoration: FormFieldStyle
                            .defaultAddressInputDecoration
                            .copyWith(
                          hintText: "dd-mm-yyyy",
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.calendar_today, // Calendar icon
                              color:
                              Colors.grey, // Adjust color as needed
                            ),
                            onPressed: () {
                              // Show date picker when the icon is pressed
                              CustomPopUp.selectDate(context,_dateBirth);
                            },
                          ),
                        ),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: _dateBirth,
                        validator: ValidatorUtils.dateValidator,
                        onTap: () {
                          setState(() {

                          });
                        },
                      ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!,
                      ),
                    ),
                    Text(
                      "Select Gender",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _genderKey,
                        focusNode: _selectGenderFocusNode,
                        value: genderTitleName,
                        hint: const Text(
                          "Select Gender",
                          style: FTextStyle.formhintTxtStyle,
                        ),
                        items: sexTitleName
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            genderTitleName = newValue;
                          });

                          isCountryFieldFocused = true;
                        },
                        decoration: FormFieldStyle.dropDown,
                        validator: ValidatorUtils.model,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${Constants.emailLabel}",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _emailKey,
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: FormFieldStyle
                            .defaultemailDecoration
                            .copyWith(
                            contentPadding:
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            fillColor:
                            AppColors.formFieldBackColour,
                            hintText: "Enter Email"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: _email,
                        validator: ValidatorUtils.emailValidator,
                        onTap: () {
                          setState(() {
                            isEmailFieldFocused = true;
                            isPasswordFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Password",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        key: _passwordKey,
                        focusNode: _passwordFocusNode,
                        decoration: FormFieldStyle
                            .defaultPasswordInputDecoration
                            .copyWith(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
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
                          fillColor: AppColors.formFieldBackColour,
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
                    ),
                    Text(
                      "Country",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _countryKey,
                        focusNode: _cityFocusNode,
                        value: selectCountryNamesCategories,
                        hint: const Text(
                          "Select country",
                          style: FTextStyle.formhintTxtStyle,
                        ),
                        items: Constants.countryNamesCategories
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectCountryNamesCategories = newValue;
                          });

                          isCountryFieldFocused = true;
                        },
                        decoration: FormFieldStyle.dropDown,
                        validator: ValidatorUtils.model,
                      ),
                    ),
                    Text(
                      "City",
                      style: FTextStyle.SubHeadingTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        key: _cityKey,
                        focusNode: _cityFocusNode,
                        keyboardType: TextInputType.name,
                        decoration: FormFieldStyle
                            .defaultemailDecoration
                            .copyWith(
                            contentPadding:
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            fillColor:
                            AppColors.formFieldBackColour,
                            hintText: "Enter City Name"),

                        controller: _city,
                        validator: ValidatorUtils.lastNameValidator,
                        onTap: () {
                          setState(() {
                            isEmailFieldFocused = false;
                            isPasswordFieldFocused = false;
                            isLastFieldFocused = false;
                            isCityBirthFieldFocused = true;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                checkboxChecked = !checkboxChecked;
                                print(
                                    'Checkbox checked: $checkboxChecked');

                                PrefUtils.setRememberMe(
                                    checkboxChecked);
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
                          Expanded(
                            child: Container(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "I accept ",
                                      style: FTextStyle.listTitleSub
                                          .copyWith(
                                          fontSize: 13,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "Terms & Conditions",
                                      style: FTextStyle.listTitleSub
                                          .copyWith(
                                          fontSize: 13,
                                          color: Colors.red),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                              const TermCondition(),
                                            ),
                                          );
                                        },
                                    ),
                                    TextSpan(
                                      text: " and ",
                                      style: FTextStyle.listTitleSub
                                          .copyWith(
                                          fontSize: 13,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "Privacy Policy",
                                      style: FTextStyle.listTitleSub
                                          .copyWith(
                                          fontSize: 13,
                                          color: Colors.red),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Action to view registration fee
                                          // For example, navigate to another page or open a link
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                              const PrivacyPolicy(),
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ).animateOnPageLoad(
                                animationsMap[
                                'imageOnPageLoadAnimation2']!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () async {
                          setState(() {
                            if (formKey.currentState!
                                .validate()) {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  HomeDelegates(  selectedRole: widget.selectedRole),
                                ),
                              );
                            } else {
                              formKey.currentState!.validate();
                            }
                          });
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: isButtonEnabled
                                ? AppColors.appSky
                                : Colors.white,
                            // Button color depending on the enabled state
                            minimumSize:
                            const Size(double.infinity, 50),
                            // Minimum height
                            maximumSize:
                            const Size(double.infinity, 50),
                            elevation: 2 // Maximum height
                        ),
                        child: Center(
                          child: Text(
                            "Register",
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
                            "Existing One's ? ",
                            style: FTextStyle.listTitleSub.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const RoleSelectionScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: FTextStyle.listTitleSub.copyWith(
                                    color: AppColors.appSky,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.08),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Stack(
        //   children: [
        //     Container(
        //       color: Colors.white,
        //     ),
        //     Center(
        //       child: Container(
        //         decoration: const BoxDecoration(
        //             gradient: LinearGradient(
        //                 begin: Alignment.topRight,
        //                 end: Alignment.bottomLeft,
        //                 stops: [
        //               0.2,
        //               0.5,
        //               0.5,
        //               0.3
        //             ],
        //                 colors: [
        //               Color(0xffffffff),
        //               Color(0xf9c6f6da),
        //               Color(0xffc6f6da),
        //               Color(0xffc6f6da),
        //             ])),
        //         child:
        //
        //
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
