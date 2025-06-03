import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';
class AbstractOrganizerEdit extends StatefulWidget {
  String conferenceName;
  String  abstractSession;
   AbstractOrganizerEdit({required this.conferenceName,required this.abstractSession,super.key});

  @override
  State<AbstractOrganizerEdit> createState() => _AbstractOrganizerEditState();
}

class _AbstractOrganizerEditState extends State<AbstractOrganizerEdit> {
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
            'Create Abstract Session/Themes',
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
                conferenceCategoryTitleName!.isNotEmpty && ValidatorUtils.isAbstract(wishlistController.text)
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
                  "Abstract Session/Themes",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _wishlistKey,
                    focusNode: _wishlistFocusNode,
                    controller: wishlistController,
                    maxLines: 7,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Abstract Session/Themes ",

                    ),
                    validator: ValidatorUtils.Abstract,
                    onTap: () {
                      setState(() {
                        isWaitlistFieldFocused=true;
                        isDelegateNumberFieldFocused=false;
                        // Reset other fields if needed

                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30 ,),
                  child: Center(
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
                          child: Text("Update", style: FTextStyle.loginBtnStyle),
                        ),
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
