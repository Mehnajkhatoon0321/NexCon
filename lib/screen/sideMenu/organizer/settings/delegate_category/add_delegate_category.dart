import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../../../../utils/form_field_style.dart';
import '../../../../../utils/validator_utils.dart';
class AddDelegateCategory extends StatefulWidget {
  const AddDelegateCategory({super.key});

  @override
  State<AddDelegateCategory> createState() => _AddDelegateCategoryState();
}

class _AddDelegateCategoryState extends State<AddDelegateCategory> {
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
  late final GlobalKey<FormFieldState<String>> _conferenceNameKey = GlobalKey<FormFieldState<String>>();
  late final FocusNode _conferenceNameFocusNode = FocusNode();
  final conferenceNameController = TextEditingController();
  //
  bool isButtonEnabled = false;
  late final GlobalKey<FormFieldState<String>> _delegateNumberKey = GlobalKey<FormFieldState<String>>();
  late final FocusNode _delegateNumberFocusNode = FocusNode();
  final delegateNumberController = TextEditingController();
  bool isSelectedConferenceFocused = false;
  bool isConferenceNameFieldFocused = false;
  bool isDelegateNumberFieldFocused = false;


  @override
  void initState() {
    super.initState();

    _conferenceNameFocusNode.addListener(() {
      if (!_conferenceNameFocusNode.hasFocus) {
        _conferenceNameKey.currentState?.validate();
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
            'Add Delegate Category',
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


                ValidatorUtils.isValidCommon(conferenceNameController.text)&&

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
            if (isConferenceNameFieldFocused == true) {
              _conferenceNameKey.currentState!.validate();
            }


            if (isDelegateNumberFieldFocused == true) {
              _delegateNumberKey.currentState!.validate();
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
                  "Category Name",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _conferenceNameKey,
                    focusNode: _conferenceNameFocusNode,
                    controller: conferenceNameController,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Category Name",
                    ),
                    validator: ValidatorUtils.model,
                    onTap: () {
                      setState(() {
                        isConferenceNameFieldFocused=true;
                        isDelegateNumberFieldFocused=false;
                        // Reset other fields if needed

                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                ),


                SizedBox(height:height*0.11 ,),
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
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: const Size(95, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                        child: Text("Submit", style: FTextStyle.loginBtnStyle),
                      ),
                    ),
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
