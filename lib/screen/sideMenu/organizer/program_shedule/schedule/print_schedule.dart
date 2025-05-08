import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../../../../utils/flutter_flow_animations.dart';
import '../../../../../utils/form_field_style.dart';
import '../../../../../utils/validator_utils.dart';
class PrintSchedule extends StatefulWidget {
  const PrintSchedule({super.key});

  @override
  State<PrintSchedule> createState() => _PrintScheduleState();
}

class _PrintScheduleState extends State<PrintSchedule> {
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
  String? timeListTitleName;
  List<String> conferenceTitleName = [
    '4th International Science Communication Conference',
    '5th International Tech & Innovation Summit',
  ];
  List<String> timeTitleName = [
    'All',
    '12-03-2024',
  ];

  late final GlobalKey<FormFieldState<String>> _conferenceCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _selectconferenceCategoryFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  //
  late final GlobalKey<FormFieldState<String>> timeCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _timeListFocusNode = FocusNode();
  final timeController = TextEditingController();
  //
  bool isButtonEnabled = false;

  bool isSelectedConferenceFocused = false;
  bool isWaitlistFieldFocused = false;
  bool isDelegateNumberFieldFocused = false;


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
            'Print Conference Schedule',
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
                  "Select Date For Print",
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
                      "Select date for print",
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
                        child: Text("Print", style: FTextStyle.loginBtnStyle),
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
