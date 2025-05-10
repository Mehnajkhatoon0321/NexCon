import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';

import '../../../../../utils/validator_utils.dart';
class MangeScheduleCreate extends StatefulWidget {
  String isEdit;
   MangeScheduleCreate({required this.isEdit,super.key});

  @override
  State<MangeScheduleCreate> createState() => _MangeScheduleCreateState();
}

class _MangeScheduleCreateState extends State<MangeScheduleCreate>  {
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
  List<String> timeTitleName =  [
    'Monday',
    'Tuesday',
    'Sunday',
  ];
 List<String> showTitleName = [
   'All',
   '12-03-2024',
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
  // Controllers
  final TextEditingController _sessionNameController = TextEditingController();
  final TextEditingController _sessionStartTimeController = TextEditingController();
  final TextEditingController _sessionEndTimeController = TextEditingController();
  final TextEditingController _nameChairController = TextEditingController();
  final TextEditingController _nameCoChairController = TextEditingController();
  final TextEditingController _nameCoordinatorController = TextEditingController();
  final TextEditingController _namePanelistsController = TextEditingController();
  final TextEditingController _sessionVenueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

// Focus Nodes
  final FocusNode _sessionNameFocusNode = FocusNode();
  final FocusNode _sessionStartTimeFocusNode = FocusNode();
  final FocusNode _sessionEndTimeFocusNode = FocusNode();
  final FocusNode _nameChairFocusNode = FocusNode();
  final FocusNode _nameCoChairFocusNode = FocusNode();
  final FocusNode _nameCoordinatorFocusNode = FocusNode();
  final FocusNode _namePanelistsFocusNode = FocusNode();
  final FocusNode _sessionVenueFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();

// Keys
  final GlobalKey<FormFieldState> _sessionNameKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _sessionStartTimeKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _sessionEndTimeKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _nameChairKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _nameCoChairKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _nameCoordinatorKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _namePanelistsKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _sessionVenueKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _dateKey = GlobalKey<FormFieldState>();

// Error Messages (Optional - you can handle them based on validation)
  bool _sessionNameErrorMessage = false;
  bool _sessionStartTimeErrorMessage = false;
  bool _sessionEndTimeErrorMessage = false;
  bool _nameChairErrorMessage = false;
  bool _nameCoChairErrorMessage = false;
  bool _nameCoordinatorErrorMessage = false;
  bool _namePanelistsErrorMessage = false;
  bool _sessionVenueErrorMessage = false;
  bool _dateErrorMessage = false;

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
            widget.isEdit.isNotEmpty ? "Edit New Schedule" : "Create New Schedule",
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),

          centerTitle: true,
        ),
        backgroundColor:AppColors.backgroundColor,
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
                    "Session Name",  // Label for the session name
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    focusNode: _sessionNameFocusNode,
                    key: _sessionNameKey,
                    keyboardType: TextInputType.text,  // Text input for session name
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Session Name",
                    ),
                    controller: _sessionNameController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _sessionNameErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Date",  // Label for date
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),


                  TextFormField(
                    focusNode: _dateFocusNode,
                    key: _dateKey,
                    keyboardType: TextInputType.datetime,  // Input for date
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Date",
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          // Show the date picker when the icon is tapped
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),  // Default to the current date
                            firstDate: DateTime(1900),    // Set the earliest selectable date
                            lastDate: DateTime(2101),     // Set the latest selectable date
                          );

                          if (pickedDate != null) {
                            // Format the date into a string and update the controller
                            String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                            _dateController.text = formattedDate;  // Set the selected date in the TextFormField
                          }
                        },
                        child: Icon(Icons.calendar_today),  // Calendar icon
                      ),
                    ),
                    controller: _dateController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _dateErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                  const SizedBox(height: 5),
      Text(
        "Session Start Time",  // Label for session start time
        style: FTextStyle.formLabelTxtStyle,
      ).animateOnPageLoad(
        animationsMap['imageOnPageLoadAnimation2']!,
      ),

      const SizedBox(height: 5),
                  TextFormField(
                    focusNode: _sessionStartTimeFocusNode,
                    key: _sessionStartTimeKey,
                    keyboardType: TextInputType.datetime,  // Time input for session start
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: " Session Start Time",
                      suffixIcon: GestureDetector(
                        onTap: ()async{
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(), // Default to current time
                          );

                          if (pickedTime != null) {
                            // Set the selected time in the TextFormField in AM/PM format
                            _sessionStartTimeController.text = pickedTime.format(context); // AM/PM format
                          }
                        },

                          child: Icon(Icons.access_time)),
                    ),
                    controller: _sessionStartTimeController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _sessionStartTimeErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Session End Time",  // Label for session end time
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),
                  TextFormField(
                    focusNode: _sessionEndTimeFocusNode,
                    key: _sessionEndTimeKey,
                    keyboardType: TextInputType.datetime,  // Time input for session end
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Session End Time",
                      suffixIcon: GestureDetector(
                        onTap: ()async{
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(), // Default to current time
                          );

                          if (pickedTime != null) {
                            // Set the selected time in the TextFormField in AM/PM format
                            _sessionEndTimeController.text = pickedTime.format(context); // AM/PM format
                          }
                        },
                          child: Icon(Icons.access_time)),
                    ),
                    controller: _sessionEndTimeController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _sessionEndTimeErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),
                  Text(
                    "Days",
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
                        "Select Days",
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
                  const SizedBox(height: 5),
                  Text(
                    "Name of Chair",  // Label for name of chair
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    focusNode: _nameChairFocusNode,
                    key: _nameChairKey,
                    keyboardType: TextInputType.text,  // Text input for chair's name
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Name of Chair",
                    ),
                    controller: _nameChairController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _nameChairErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Name of Co-chair",  // Label for name of co-chair
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    focusNode: _nameCoChairFocusNode,
                    key: _nameCoChairKey,
                    keyboardType: TextInputType.text,  // Text input for co-chair's name
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Name of Co-chair",
                    ),
                    controller: _nameCoChairController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _nameCoChairErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Name of Coordinator",  // Label for name of coordinator
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    focusNode: _nameCoordinatorFocusNode,
                    key: _nameCoordinatorKey,
                    keyboardType: TextInputType.text,  // Text input for coordinator's name
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Name of Coordinator",
                    ),
                    controller: _nameCoordinatorController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _nameCoordinatorErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Name of Panelists",  // Label for name of panelists
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    focusNode: _namePanelistsFocusNode,
                    key: _namePanelistsKey,
                    keyboardType: TextInputType.text,  // Text input for panelists' names
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Name of Panelists",
                    ),
                    controller: _namePanelistsController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _namePanelistsErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Session Venue",  // Label for session venue
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    focusNode: _sessionVenueFocusNode,
                    key: _sessionVenueKey,
                    keyboardType: TextInputType.text,  // Text input for session venue
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Session Venue",
                    ),
                    controller: _sessionVenueController,
                    validator: ValidatorUtils.model,
                    onTap: () {
                      _sessionVenueErrorMessage = true;
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),

                  const SizedBox(height: 15),



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
                        "Select show / hide",
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
