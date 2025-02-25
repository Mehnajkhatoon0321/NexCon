import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/screen/organizer_section/organizer_home_page.dart';
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
class OrganizationRegisterDetails extends StatefulWidget {
  String nameOrganization;
  String mobileNumber;
  String  dateBirth;
  String  gender;
  String email;

  String  country;
  String city;
   OrganizationRegisterDetails({required this.nameOrganization,required this.email,required this.city,required this.country,required this.dateBirth,required this.gender,required this.mobileNumber,super.key});

  @override
  State<OrganizationRegisterDetails> createState() => _OrganizationRegisterDetailsState();
}

class _OrganizationRegisterDetailsState extends State<OrganizationRegisterDetails> {
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
  String? selectCountryConference;
  String? selectCityNamesCategories;
  String? selectTitleName;
  String? selectCategoryName;
  String? genderTitleName;
  late final TextEditingController _emailConference = TextEditingController();
  late final TextEditingController _firstConference = TextEditingController();
  late final TextEditingController _gstConference = TextEditingController();
  late final TextEditingController nameVenueConference = TextEditingController();
  late final TextEditingController _conferenceTheme = TextEditingController();

  late final TextEditingController _passwordConference = TextEditingController();
  late final TextEditingController _mobileNumberConference = TextEditingController();
  late final TextEditingController _websiteNumberConferenceNumberConference = TextEditingController();
  late final TextEditingController _dateBirthConference = TextEditingController();
  late final TextEditingController _dateToConference = TextEditingController();
  late final TextEditingController _nameVenueConference = TextEditingController();
  late final TextEditingController addressVenueConference = TextEditingController();
  late final TextEditingController contactPersoneConference = TextEditingController();
  late final TextEditingController organizationNameConference = TextEditingController();


  late final GlobalKey<FormFieldState<String>> _emailConferenceKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _countryKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _dateBirthConferenceKey =
  GlobalKey<FormFieldState<String>>();  late final GlobalKey<FormFieldState<String>> _dateToConferenceKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _cityKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _firstConferenceKey =
  GlobalKey<FormFieldState<String>>() ;
  late final GlobalKey<FormFieldState<String>>_gstConferenceKey =
  GlobalKey<FormFieldState<String>>() ;
  late final GlobalKey<FormFieldState<String>>_nameVenueConferenceKey =
  GlobalKey<FormFieldState<String>>() ;
  late final GlobalKey<FormFieldState<String>>addressVenueConferenceKey =
  GlobalKey<FormFieldState<String>>() ;
  late final GlobalKey<FormFieldState<String>>contactPersoneConferenceKey =
  GlobalKey<FormFieldState<String>>() ;
  late final GlobalKey<FormFieldState<String>>organizationNameConferenceKey =
  GlobalKey<FormFieldState<String>>() ;
  late final GlobalKey<FormFieldState<String>> _conferenceThemeKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _mobileKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _websiteNumberConferenceKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _passwordConferenceKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _genderKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _emailConferenceFocusNode = FocusNode();
  late final FocusNode _mobileFocusNode = FocusNode();
  late final FocusNode _websiteNumberConferenceFocusNode = FocusNode();
  late final FocusNode _firstConferenceFocusNode = FocusNode();
  late final FocusNode _conferenceThemeFocusNode = FocusNode();
  late final FocusNode _gstConferenceFocusNode = FocusNode();
  late final FocusNode _nameVenueConferenceFocusNode = FocusNode();
  late final FocusNode addressVenueConferenceFocusNode = FocusNode();
  late final FocusNode contactPersoneConferenceFocusNode = FocusNode();
  late final FocusNode organizationNameConferenceFocusNode = FocusNode();

  late final FocusNode _passwordConferenceFocusNode = FocusNode();
  late final FocusNode _dateBirthConferenceFocusNode = FocusNode();
  late final FocusNode _dateToConferenceFocusNode = FocusNode();
  late final FocusNode _cityFocusNode = FocusNode();
  late final FocusNode _countryFocusNode = FocusNode();

  late final FocusNode _selectGenderFocusNode = FocusNode();
  bool checkboxChecked = false;
  bool isButtonEnabled = false;
  List<String> sexTitleName = [
    'Human Resource',
    'Computer Science',
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
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        body:
        Stack(
          children: [
            Container(
              color: AppColors.primaryColour,
            ),
            Center(
              child:
              Container(
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
                child:
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: (displayType == 'desktop' ||  displayType == 'tablet') ? 50 : 20),
                  children: [

                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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

                    SizedBox(height: 10,),
                    Text(
                      "Conference Details**",
                      style: FTextStyle.headingMiddle.copyWith(
                          fontSize: 15,color: Colors.red
                      ),
                      textAlign: TextAlign.start,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15),
                      child: Form(
                        key: formKey,
                        onChanged: () {
                          if (ValidatorUtils.isValidEmail(_emailConference.text) &&
                              ValidatorUtils.isValidPass(_passwordConference.text)) {
                            setState(() {
                              isButtonEnabled = true;
                            });
                          } else {
                            setState(() {
                              isButtonEnabled = false;
                            });
                          }
                          if (isEmailFieldFocused == true) {
                            _emailConferenceKey.currentState!.validate();
                          }
                          if (isPasswordFieldFocused == true) {
                            _passwordConferenceKey.currentState!.validate();
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
                              "Conference Category",
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
                                  "Select Conference Category",
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
                                  _genderKey.currentState?.validate(); // Validate only this field
                                },
                                decoration: FormFieldStyle.dropDown,
                                validator: ValidatorUtils.model,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Name of Conference",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: _firstConferenceKey,
                                focusNode: _firstConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Name of Conference"),

                                controller: _firstConference,
                                validator: ValidatorUtils.nameConferenceValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    _firstConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _firstConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_conferenceThemeFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              "Conference Theme",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: _conferenceThemeKey,
                                focusNode: _conferenceThemeFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Conference Theme"),

                                controller: _conferenceTheme,
                                validator: ValidatorUtils.conferenceThemeValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    _conferenceThemeKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _conferenceThemeFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_dateBirthConferenceFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),

                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text(
                                        "From Date",
                                        style: FTextStyle.formLabelTxtStyle,
                                      ).animateOnPageLoad(
                                          animationsMap['imageOnPageLoadAnimation2']!),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                                        child: TextFormField(
                                          key: _dateBirthConferenceKey,
                                          focusNode: _dateBirthConferenceFocusNode,
                                          keyboardType: TextInputType.text,
                                          readOnly: true, // Prevent manual input
                                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                                            hintText: "dd-mm-yyyy",
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.calendar_today, // Calendar icon
                                                color: Colors.grey,   // Adjust color as needed
                                              ),
                                              onPressed: () async {
                                                DateTime? selectedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2100),
                                                );

                                                if (selectedDate != null) {
                                                  setState(() {
                                                    _dateBirthConference.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                                                    _dateBirthConferenceKey.currentState?.validate(); // Remove validation error after selection
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                          controller: _dateBirthConference,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please select a date.";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16), // Spacing between the fields
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text(
                                        "To Date",
                                        style: FTextStyle.formLabelTxtStyle,
                                      ).animateOnPageLoad(
                                          animationsMap['imageOnPageLoadAnimation2']!),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                                        child: TextFormField(
                                          key: _dateToConferenceKey,
                                          focusNode: _dateToConferenceFocusNode,
                                          keyboardType: TextInputType.text,
                                          readOnly: true, // Prevent manual input
                                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                                            hintText: "dd-mm-yyyy",
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.calendar_today, // Calendar icon
                                                color: Colors.grey,   // Adjust color as needed
                                              ),
                                              onPressed: () async {
                                                DateTime? selectedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2100),
                                                );

                                                if (selectedDate != null) {
                                                  setState(() {
                                                   _dateToConference.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                                                   _dateToConferenceKey.currentState?.validate(); // Remove validation error after selection
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                          controller: _dateToConference,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please select a date.";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "GST/VAT",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: _gstConferenceKey,
                                focusNode: _gstConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter GST/VAT"),

                                controller: _gstConference,
                                validator: ValidatorUtils.gstVatValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    _gstConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _gstConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_nameVenueConferenceFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Name of Venue*",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: _nameVenueConferenceKey,
                                focusNode: _nameVenueConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Name of Venue*"),

                                controller: _nameVenueConference,
                                validator: ValidatorUtils.venueNameValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    _nameVenueConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _nameVenueConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(addressVenueConferenceFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Address of Venue*",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: addressVenueConferenceKey,
                                focusNode: addressVenueConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Address of Venue"),

                                controller: addressVenueConference,
                                validator: ValidatorUtils.addressVenueValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    addressVenueConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  addressVenueConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(organizationNameConferenceFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Name of Organizer/ Association/ Society",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: organizationNameConferenceKey,
                                focusNode: organizationNameConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Name of Organizer/ Association/ Society"),

                                controller: organizationNameConference,
                                validator: ValidatorUtils.organizerNameValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    organizationNameConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  organizationNameConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(contactPersoneConferenceFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Contact Person*",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: contactPersoneConferenceKey,
                                focusNode: contactPersoneConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Contact Person"),

                                controller: contactPersoneConference,
                                validator: ValidatorUtils.contactPersonValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the name field
                                    contactPersoneConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  contactPersoneConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_mobileFocusNode);
                                },

                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Contact Number",
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
                                    hintText: "Enter Contact Number"),
                                inputFormatters: [NoSpaceFormatter()],
                                controller: _mobileNumberConference,
                                validator: ValidatorUtils.phoneNumberValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the email field
                                    _mobileKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _mobileFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_emailConferenceFocusNode);
                                },
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),



                            const SizedBox(height: 8),
                            Text("${Constants.emailLabel}", style: FTextStyle.SubHeadingTxtStyle),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: _emailConferenceKey,
                                focusNode: _emailConferenceFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailConference,
                                decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                  fillColor: AppColors.formFieldBackColour,
                                  hintText: "Enter Email",
                                ),
                                validator: ValidatorUtils.emailValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the email field
                                    _emailConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _emailConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_passwordConferenceFocusNode);
                                },
                              ),
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
                                key: _passwordConferenceKey,
                                focusNode: _passwordConferenceFocusNode,
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
                                controller: _passwordConference,
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
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the email field
                                    _passwordConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _passwordConferenceFocusNode.unfocus();
                                  FocusScope.of(context).requestFocus(_countryFocusNode);
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
                                focusNode: _countryFocusNode,
                                value: selectCountryConference,
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
                                    selectCountryConference = newValue;
                                  });
                                  _countryKey.currentState?.validate(); // Validate only this field
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
                              const EdgeInsets.symmetric(vertical: 10.0),
                              child: DropdownButtonFormField<String>(
                                key: _cityKey,
                                focusNode: _cityFocusNode,
                                value: selectCityNamesCategories,
                                hint: const Text(
                                  "Select City",
                                  style: FTextStyle.formhintTxtStyle,
                                ),
                                items: Constants.cityNamesCategories
                                    .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                ))
                                    .toList(),
                                onChanged: (cityValue) {
                                  setState(() {
                                    selectCityNamesCategories = cityValue;
                                  });
                                  _cityKey.currentState?.validate(); // Validate only this field
                                },
                                decoration: FormFieldStyle.dropDown,
                                validator: ValidatorUtils.model,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Website",
                              style: FTextStyle.SubHeadingTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: _websiteNumberConferenceKey,
                                focusNode: _websiteNumberConferenceFocusNode,
                                keyboardType: TextInputType.name,
                                decoration: FormFieldStyle
                                    .defaultemailDecoration
                                    .copyWith(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    fillColor:
                                    AppColors.formFieldBackColour,
                                    hintText: "Enter Website"),
                                inputFormatters: [NoSpaceFormatter()],
                                controller: _websiteNumberConferenceNumberConference,
                                validator: ValidatorUtils.websiteLinkValidator,
                                onChanged: (value) {
                                  setState(() {
                                    // Validate only the email field
                                    _websiteNumberConferenceKey.currentState?.validate();
                                  });
                                },
                                onFieldSubmitted: (_) {
                                  _websiteNumberConferenceFocusNode.unfocus();

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
                                              text: "I/We accept ",
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
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {


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
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>RoleSelectionScreen()
                                                  ),
                                                );

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

                                    print("Form is valid, proceed with submission.");
                                  } else {
                                    // Form is invalid
                                    print("Form is invalid, please fill all required fields.");
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
