import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../../../../utils/font_text_Style.dart';
class ManagerProgramEdit extends StatefulWidget {
  String isEdit;
   ManagerProgramEdit({required this.isEdit,super.key});

  @override
  State<ManagerProgramEdit> createState() => _ManagerProgramEditState();
}

class _ManagerProgramEditState extends State<ManagerProgramEdit> {
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
  int _selectedValue = 1;
  String? conferenceCategoryTitleName;
  final TextEditingController _presentationNumberController = TextEditingController();
  final TextEditingController _presentationNameController = TextEditingController();
  String? timeListTitleName;
  String? showListTitleName;
  List<String> conferenceTitleName = [
    '4th International Science Communication Conference',
    '5th International Tech & Innovation Summit',
  ];
  List<String> timeTitleName = [
    'All',
    '12-03-2024',
  ];List<String> showTitleName = [
    'All',
    'Hide',
    'Show',
  ];
  final FocusNode _presentationFocusNode = FocusNode();

  bool _presentationNumberErrorMessage = false;
  bool _presentationNameErrorMessage = false;
  late final GlobalKey<FormFieldState<String>> _conferenceCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _selectconferenceCategoryFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _presentationKey =
  GlobalKey<FormFieldState<String>>();final GlobalKey<FormFieldState<String>> _presentationNameKey =
  GlobalKey<FormFieldState<String>>();
  //
  late final GlobalKey<FormFieldState<String>> timeCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> showHideKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _timeListFocusNode = FocusNode();
  late final FocusNode _showListFocusNode = FocusNode();
  final timeController = TextEditingController();
  final showController = TextEditingController();
  //
  bool isButtonEnabled = false;

  bool isSelectedConferenceFocused = false;
  bool isWaitlistFieldFocused = false;
  bool isDelegateNumberFieldFocused = false;

  final FocusNode _presentationShipFocusNode = FocusNode();
  final FocusNode _presentationNameFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();



    _timeListFocusNode.addListener(() {
      if (!_timeListFocusNode.hasFocus) {
        timeCategoryKey.currentState?.validate();
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
            widget.isEdit.isNotEmpty ? "Edit New Program" : "Create New Program",
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),

          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Form(
            key: formKey,
            onChanged: () {
              if ( conferenceCategoryTitleName != null &&
                  conferenceCategoryTitleName!.isNotEmpty &&timeListTitleName != null &&
                  timeListTitleName!.isNotEmpty
          
          
          
              ) {
                setState(() {
                  isButtonEnabled = true;
                });
              } else {
                setState(() {
                  isButtonEnabled = false;
                });
              }
          
          
          
              _timeListFocusNode.addListener(() {
                if (!_timeListFocusNode.hasFocus) {
                  timeCategoryKey.currentState?.validate();
                }
              });
          
              _selectconferenceCategoryFocusNode.addListener(() {
                if (!_selectconferenceCategoryFocusNode.hasFocus) {
                  _conferenceCategoryKey.currentState?.validate();
                }
              });
          
          
          
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
                    "Session name",
                    style: FTextStyle.SubHeadingTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
          
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: timeCategoryKey,
                      focusNode: _timeListFocusNode,
                      value: timeListTitleName,
                      isExpanded: true, // ✅ Prevent horizontal overflow
                      hint: const Text(
                        "Select Session name",
                        style: FTextStyle.formhintTxtStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      items: timeTitleName.map((category) {
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
                          timeListTitleName = newValue;
                        });
                        timeCategoryKey.currentState?.validate();
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
                    "Presentation(s):- ",
                    style: FTextStyle.SubHeadingTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedValue = value!;
          
          
          
                              });
                            },
                          ),
                          Text(
                            "Abstract",
                            style: FTextStyle.formLabelTxtStyle,
                          ),
                        ],
                      ),
                      SizedBox(width: 20), // Spacing between radio buttons
                      Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedValue = value!;
          
                              });
                            },
                          ),
                          Text(
                            "Other",
                            style: FTextStyle.formLabelTxtStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _selectedValue == 2, // Show only if "Existing presentation" is selected
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Text(
                          "Presentation Title",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          focusNode: _presentationShipFocusNode,
                          key: _presentationKey,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Presentation Title",
                          ),
                          controller: _presentationNumberController,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            _presentationNumberErrorMessage=true;
          
                          },
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Presenter Name",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          focusNode: _presentationNameFocusNode,
                          key: _presentationNameKey,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Presenter Name",
                          ),
                          controller: _presentationNameController,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            _presentationNameErrorMessage=true;
          
                          },
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
          
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Select show / hide",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: showHideKey,
                      focusNode: _showListFocusNode,
                      value: showListTitleName,
                      isExpanded: true, // ✅ Prevent horizontal overflow
                      hint: const Text(
                        "Select Show / Hide",
                        style: FTextStyle.formhintTxtStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      items: showTitleName.map((category) {
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
                          showListTitleName = newValue;
                        });
                        showHideKey.currentState?.validate();
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
          
                  SizedBox(height:height*0.13 ,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColour,
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
                          minimumSize: const Size(95, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                          child: Text( widget.isEdit.isNotEmpty ?"Edit":"Create", style: FTextStyle.loginBtnStyle),
                        ),
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
