import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../../utils/flutter_flow_animations.dart';
import '../../../utils/form_field_style.dart';
import '../../../utils/validator_utils.dart';
class UpgradeWaitList extends StatefulWidget {
  const UpgradeWaitList({super.key});

  @override
  State<UpgradeWaitList> createState() => _UpgradeWaitListState();
}

class _UpgradeWaitListState extends State<UpgradeWaitList> {
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
  late final FocusNode _wishlistFocusNode = FocusNode();
  final wishlistController = TextEditingController();
  //
 bool isButtonEnabled = false;
  late final GlobalKey<FormFieldState<String>> _delegateNumberKey = GlobalKey<FormFieldState<String>>();
  late final FocusNode _delegateNumberFocusNode = FocusNode();
  final delegateNumberController = TextEditingController();
  bool isSelectedConferenceFocused = false;
  bool isWaitlistFieldFocused = false;
  bool isDelegateNumberFieldFocused = false;


  @override
  void initState() {
    super.initState();

    _wishlistFocusNode.addListener(() {
      if (!_wishlistFocusNode.hasFocus) {
        _wishlistKey.currentState?.validate();
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
            'Upgrade Wait List',
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




          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:height*0.01 ,),
                  Text(
                    "Select Conference Category",
                    style: FTextStyle.SubHeadingTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: _conferenceCategoryKey,
                      focusNode: _selectconferenceCategoryFocusNode,
                      value: conferenceCategoryTitleName,
                      isExpanded: true, // ✅ Prevent horizontal overflow
                      hint: const Text(
                        "Select Conference Category",
                        style: FTextStyle.formhintTxtStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      items: conferenceTitleName.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          conferenceCategoryTitleName = newValue;
                        });
                        _conferenceCategoryKey.currentState?.validate();
                      },
                      decoration: FormFieldStyle.dropDown.copyWith(
                        errorStyle: const TextStyle(
                          color: AppColors.errorColor,  // Or any other color you'd like
                          fontSize: 12,
                        ),
                      ),
                      validator: ValidatorUtils.model,
                    ),
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
            
                  SizedBox(height:height*0.13 ,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.appSky,
                            AppColors.secondaryColour,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),


      ),
    );
  }
}
