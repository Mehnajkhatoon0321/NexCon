import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../../../../utils/colours.dart';
import '../../../../../utils/custom_popup.dart';
import '../../../../../utils/font_text_Style.dart';
import '../../../../../utils/no_space_input_formatter_class.dart';
class AccommodationDeadlines extends StatefulWidget {
  const AccommodationDeadlines({super.key});

  @override
  State<AccommodationDeadlines> createState() => _AccommodationDeadlinesState();
}

class _AccommodationDeadlinesState extends State<AccommodationDeadlines> {
  String? conferenceTitleName;
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
  final GlobalKey<FormFieldState> _deadlineDateKey = GlobalKey<FormFieldState>();
  final FocusNode _deadlineDateFocusNode = FocusNode();
  final TextEditingController _deadlineDateController = TextEditingController();
  bool isSubmissionEnabled = true;
  final formKey = GlobalKey<FormState>();
  late final GlobalKey<FormFieldState<String>> _conferenceKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _selectconferenceFocusNode = FocusNode();
  List<String> conferenceCategory = [
    'Human Resource',
    'Computer Science',
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Accommodation Deadlines',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conference Category",
                style: FTextStyle.SubHeadingTxtStyle,
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0),
                child: DropdownButtonFormField<String>(
                  key: _conferenceKey,
                  focusNode: _selectconferenceFocusNode,
                  value: conferenceTitleName,
                  hint: const Text(
                    "Select Conference Category",
                    style: FTextStyle.formhintTxtStyle,
                  ),
                  items: conferenceCategory
                      .map((category) => DropdownMenuItem(
                    value: category,
                    child: Container(
                        constraints:  BoxConstraints(maxWidth: 200),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Text(category),
                        )),
                  ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      conferenceTitleName = newValue;
                    });
                    _conferenceKey.currentState?.validate(); // Validate only this field
                  },
                  decoration: FormFieldStyle.dropDown,
                  validator: ValidatorUtils.model,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                "Deadline Date",
                style: FTextStyle.formLabelTxtStyle,
              ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  key: _deadlineDateKey,
                  focusNode: _deadlineDateFocusNode,
                  keyboardType: TextInputType.text,
                  controller: _deadlineDateController,
                  inputFormatters: [NoSpaceFormatter()],
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "dd-mm-yyyy",
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      onPressed: () async {
                        await CustomPopUp.selectDate(context, _deadlineDateController);

                        // ✅ Trigger validation after date is picked
                        if (_deadlineDateKey.currentState != null) {
                          _deadlineDateKey.currentState!.validate();
                        }
                      },
                    ),
                  ),
                  validator: ValidatorUtils.dateValidator,
                  onTap: () {
                    setState(() {});
                  },
                ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!,
                ),
              ),



              const SizedBox(height: 16),
              Text("Enable Accommodation Submission:", style: FTextStyle.formLabelTxtStyle),
              const SizedBox(height: 8),
              SwitchListTile(
                title: Text(
                  isSubmissionEnabled ? "On" : "Off",
                  style: TextStyle(
                    color: isSubmissionEnabled ? AppColors.appSky : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                activeColor: AppColors.appSky, // switch thumb color when ON
                activeTrackColor: Colors.blueAccent.shade100, // track color when ON
                value: isSubmissionEnabled,
                onChanged: (val) {
                  setState(() {
                    isSubmissionEnabled = val;
                  });
                },
              ),

              const SizedBox(height: 26),
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
                      // Validate entire form on submit button pressed
                      if (formKey.currentState!.validate()) {
                        // All validations passed, proceed
                        // Navigator.pop(context);
                      } else {
                        // Errors will show for all invalid fields
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      // minimumSize: const Size(93, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                      child: Text(
                       "Submit",
                        style: FTextStyle.loginBtnStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
