import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';
class UpgradeMembership extends StatefulWidget {
  const UpgradeMembership({super.key});

  @override
  State<UpgradeMembership> createState() => _UpgradeMembershipState();
}

class _UpgradeMembershipState extends State<UpgradeMembership> {
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
  String? conferenceCategoryTitleName;
  List<String> conferenceTitleName = [
    '4th International Science Communication Conference',
    '5th International Tech & Innovation Summit',
  ];

  late final GlobalKey<FormFieldState<String>> _conferenceCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _selectconferenceCategoryFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  //
  late final GlobalKey<FormFieldState<String>> _wishlistKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _creditKey = GlobalKey<FormFieldState<String>>();
  late final FocusNode _wishlistFocusNode = FocusNode();
  late final FocusNode __creditFocusNode = FocusNode();
  final wishlistController = TextEditingController();
  final creditController = TextEditingController();
  //
  bool isButtonEnabled = false;
  late final GlobalKey<FormFieldState<String>> _delegateNumberKey = GlobalKey<FormFieldState<String>>();
  late final FocusNode _delegateNumberFocusNode = FocusNode();
  final delegateNumberController = TextEditingController();
  bool isSelectedConferenceFocused = false;
  bool isWaitlistFieldFocused = false;
  bool isCreditFieldFocused = false;
  bool isDelegateNumberFieldFocused = false;


  @override
  void initState() {
    super.initState();

    _wishlistFocusNode.addListener(() {
      if (!_wishlistFocusNode.hasFocus) {
        _wishlistKey.currentState?.validate();
      }
    });

    __creditFocusNode.addListener(() {
      if (!__creditFocusNode.hasFocus) {
        _creditKey.currentState?.validate();
      }
    });

    _delegateNumberFocusNode.addListener(() {
      if (!_delegateNumberFocusNode.hasFocus) {
        _delegateNumberKey.currentState?.validate();
      }
    });

    _selectconferenceCategoryFocusNode.addListener(() {
      if (!_selectconferenceCategoryFocusNode.hasFocus) {
        _conferenceCategoryKey.currentState?.validate();
      }
    });
  }

  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            'Upgrade Membership',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:
        Form(
          key: formKey,
          onChanged: () {
            if ( conferenceCategoryTitleName != null &&
                conferenceCategoryTitleName!.isNotEmpty &&


                ValidatorUtils.isValidCommon(wishlistController.text)&&

                ValidatorUtils.isValidCommon(delegateNumberController.text)
            ) {
              setState(() {
                isButtonEnabled = true;
              });
            } else {
              setState(() {
                isButtonEnabled = false;
              });
            }
            if (isWaitlistFieldFocused == true) {
              _wishlistKey.currentState!.validate();
            }


            if (isDelegateNumberFieldFocused == true) {
              _delegateNumberKey.currentState!.validate();
            }

            if (isCreditFieldFocused == true) {
              _creditKey.currentState!.validate();
            }




          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:height*0.01 ,),
                Text(
                  'Upgrade Membership',
                  style: FTextStyle.headingMiddle,
                ),
                SizedBox(height:height*0.02 ,),
                Text(
                  "Enter Credit Points/ Number of Delegates",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _creditKey,
                    focusNode: __creditFocusNode,
                    controller: creditController,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Credit ",
                    ),
                    validator: ValidatorUtils.model,
                    onTap: () {
                      setState(() {
                        isCreditFieldFocused=true;
                        isWaitlistFieldFocused=false;
                        isDelegateNumberFieldFocused=false;
                        // Reset other fields if needed

                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                ),
                Text(
                  "WaitList",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _wishlistKey,
                    focusNode: _wishlistFocusNode,
                    controller: wishlistController,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Waitlist ",
                    ),
                    validator: ValidatorUtils.model,
                    onTap: () {
                      setState(() {
                        isWaitlistFieldFocused=true;
                        isDelegateNumberFieldFocused=false;
                        // Reset other fields if needed

                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                ),
                Text(
                  "Delegate Number",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _delegateNumberKey,
                    focusNode: _delegateNumberFocusNode,
                    controller: delegateNumberController,
                    keyboardType: TextInputType.phone, // Ensure the correct keyboard is shown for number input
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Delegate Number",
                    ),
                    validator: ValidatorUtils.model,
                    onTap: () {
                      setState(() {
                        isDelegateNumberFieldFocused=true;
                        isWaitlistFieldFocused=false;
                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {


                        Navigator.pop(context);

                        // print("Form is valid, proceed with submission.");
                      } else {
                        // Form is invalid
                        // print("Form is invalid, please fill all required fields.");
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: AppColors.appSky,

                      // Button color depending on the enabled state
                      minimumSize: const Size(double.infinity, 50),
                      // Minimum height
                      maximumSize: const Size(double.infinity, 50),
                      // elevation: 1 // Maximum height
                    ),
                    child: Text("Update", style: FTextStyle.loginBtnStyle),
                  ),
                )
              ],
            ),
          ),
        ),


      ),
    );
  }
}