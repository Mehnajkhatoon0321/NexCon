import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/qr_code/attendance_confirmation_screen.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';
import '../../../../../utils/colours.dart';
import '../../../../../utils/font_text_Style.dart';

class ManualAttendance extends StatefulWidget {
  const ManualAttendance({super.key});

  @override
  State<ManualAttendance> createState() => _ManualAttendanceState();
}

class _ManualAttendanceState extends State<ManualAttendance> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final _userNameFocusNode = FocusNode();
  final userNameKey = GlobalKey<FormFieldState>();
  final _userNameController = TextEditingController();
  bool isUserNameFieldFocused = false;

  late String formattedDate;
  late String formattedTime;
  final formKey = GlobalKey<FormState>();
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
  final FocusNode _userIdFocusNode = FocusNode();
  final GlobalKey<FormFieldState> userIdKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState<String>> dateKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> timeKey = GlobalKey<FormFieldState<String>>();

  final TextEditingController _userIdController = TextEditingController();
  bool isUserIdFieldFocused = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override

  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateController.text = DateFormat('d MMM yyyy').format(now);
    _timeController.text = DateFormat('hh:mm a').format(now);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        title:  Text("Manual Attendance", style:FTextStyle.HeadingTxtWhiteStyle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Enter User Name",
                style: FTextStyle.SubHeadingTxtStyle,
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  focusNode: _userNameFocusNode,
                  key: userNameKey,
                  keyboardType: TextInputType.text,
                  controller: _userNameController,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter User Name",

                  ),
                  validator: ValidatorUtils.model,
                  onChanged: (value) {
                    setState(() {
                      userNameKey.currentState?.validate();
                    });
                  },
                  onTap: () {
                    setState(() {
                      isUserNameFieldFocused = true;
                    });
                  },
                ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!,
                ),
              ),

              Text(
                "Enter User ID",
                style: FTextStyle.SubHeadingTxtStyle,
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  focusNode: _userIdFocusNode,
                  key: userIdKey,
                  keyboardType: TextInputType.text,
                  controller: _userIdController,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter User ID",

                  ),
                  validator: ValidatorUtils.model,
                  onChanged: (value) {
                    setState(() {
                      userIdKey.currentState?.validate();
                    });
                  },
                  onTap: () {
                    setState(() {
                      isUserIdFieldFocused = true;
                    });
                  },
                ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!,
                ),
              ),

              Text(
                "Select Date",
                style: FTextStyle.SubHeadingTxtStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: _pickDate,
                  key: dateKey,
                  validator: (value) => (value == null || value.isEmpty) ? "Please select date" : null,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Select Date",
                    suffixIcon: const Icon(Icons.calendar_today_outlined),
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
              ),

              Text(
                "Select Time",
                style: FTextStyle.SubHeadingTxtStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _timeController,
                  readOnly: true,
                  key: timeKey,
                  onTap: _pickTime,
                  validator: (value) => (value == null || value.isEmpty) ? "Please select time" : null,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Select Time",
                    suffixIcon: const Icon(Icons.access_time_outlined),
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
              ),



              const SizedBox(height: 40),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [AppColors.appSky, AppColors.secondaryColour],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: (){
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
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Mark Attendance", style: FTextStyle.loginBtnStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        dateKey.currentState?.validate();
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      _timeController.text = DateFormat('hh:mm a').format(dt);
      setState(() {
        timeKey.currentState?.validate();
      });
    }
  }

}
