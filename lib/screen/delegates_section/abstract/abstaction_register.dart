import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/delegates_section/abstract/abstract.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/custom_popup.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/no_space_input_formatter_class.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../../utils/font_text_Style.dart';

class AbstractionRegister extends StatefulWidget {
  const AbstractionRegister({super.key});

  @override
  State<AbstractionRegister> createState() => _AbstractionRegisterState();
}

class _AbstractionRegisterState extends State<AbstractionRegister> {
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
  String? selectedConferenceId;
  String? selectedPaymentId;
  String? selectedTopicId;
  bool isUploadFocused = false;
  bool isImageUploaded = false;
  String? fileName1;
  File? imagesId;
  bool _hasPressedSaveButton = false;
  bool hasPaymentButton = false;
  List<Map<String, String>> conferenceNameList = [
    {"name": '30th ISCB International Conference (ISCBC-2025)', "id": "1"},
    {
      "name":
      '4th International Science Communication Conference & 24th Indian Science Communication Conference',
      "id": "2"
    },
  ];
  late final FocusNode _uploadNameNode = FocusNode();
  late List<String> conferenceNames =
  conferenceNameList.map<String>((item) => item['name']!).toList();

  List<Map<String, String>> paymentModeList = [
    {"name": 'Bank Transfer (NEFT/ IMPS/ UPI/ SWIFT)', "id": "1"},
    {"name": 'Online', "id": "2"},
  ];


  late List<String> paymentNames =
  paymentModeList.map<String>((item) => item['name']!).toList();
  List<Map<String, String>> topicModeList = [
    {"name": 'Chemistry', "id": "1"},
    {"name": 'Math', "id": "2"},
  ];


  late List<String> topicNames =
  topicModeList.map<String>((item) => item['name']!).toList();

  String? selectCountryNamesCategories;
  String? selectPaymentName;
  String? selectTopicName;
  String? selectCategoryName;
  bool isButtonEnabled = false; // Tracks button state
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController _paperTitle = TextEditingController();
  late final TextEditingController _bank = TextEditingController();
  late final TextEditingController _paymentAmountNumber = TextEditingController();
  late final TextEditingController _codeNumber = TextEditingController();
  late final TextEditingController _dateSubmisision = TextEditingController();
  late final TextEditingController _dateOutSubmissionController = TextEditingController();
  late final TextEditingController _dateBirth = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _transactionNumberKey =
  GlobalKey<FormFieldState<String>>();
  late final TextEditingController uploadName = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _uploadNameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _selectPaymentKey =
  GlobalKey<FormFieldState<String>>();    late final GlobalKey<FormFieldState<String>> _selectTopicKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _dateBirthKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _selectCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _dateOfSubmission =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _dateOutSubmission =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _papertTtileKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _bankKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _paymentAmountKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _codeNumberKey =
  GlobalKey<FormFieldState<String>>();
  late final TextEditingController _transactionNumber = TextEditingController();
  late final FocusNode _paymentAmountFocusNode = FocusNode();
  late final FocusNode _codeNumberFocusNode = FocusNode();
  late final FocusNode _papertTtileFocusNode = FocusNode();
  late final FocusNode _bankFocusNode = FocusNode();
  late final FocusNode _transactionNumberFocusNode = FocusNode();
  late final FocusNode _dateFocusNode = FocusNode();
  late final FocusNode _dateOutFocusNode = FocusNode();
  late final FocusNode _dateBirthFocusNode = FocusNode();

  late final FocusNode _selectPaymentFocusNode = FocusNode();
  late final FocusNode _selectTopicFocusNode = FocusNode();
  late final FocusNode _selectCategoryFocusNode = FocusNode();

  bool checkboxChecked = false;

  bool isTransactionFocused = false;
  bool isPaymentFocused = false;

  bool isDateFieldFocused = false;
  bool isCategoryFieldFocused = false;
  bool isDateBirthFieldFocused = false;
  bool isLoading = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
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
          'Submit Paper',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            onChanged: () {
              if (ValidatorUtils.isValidTransactionNumber(
                  _paperTitle.text) &&
                  ValidatorUtils.isValidAmount(_paymentAmountNumber.text)
                  && ValidatorUtils.isValidTransactionDate(_dateSubmisision.text)
                  && ValidatorUtils.isValidBankName(_bank.text)
                  && ValidatorUtils.isValidCouponCode(_codeNumber.text )&&checkboxChecked


              ) {
                setState(() {
                  isButtonEnabled = true;
                });
              } else {
                setState(() {
                  isButtonEnabled = false;
                });
              }
              if (isTransactionFocused == true) {
                _papertTtileKey.currentState!.validate();
              }
              if (isPaymentFocused == true) {
                _paymentAmountKey.currentState!.validate();
              }
              if (_dateFocusNode == true) {
                _dateOfSubmission.currentState!.validate();
              }
              if (_codeNumberFocusNode == true) {
                _codeNumberKey.currentState!.validate();
              } if (_uploadNameNode == true) {
                _uploadNameKey.currentState!.validate();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Conference",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: AppColors.boarderColour),
                      color: AppColors.formFieldBackColour,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        key: _selectCategoryKey,
                        focusNode: _selectCategoryFocusNode,
                        isExpanded: true,
                        value: conferenceNames.contains(selectCategoryName)
                            ? selectCategoryName
                            : null,
                        hint: const Text(
                          "Select Conference ",
                          style: FTextStyle.formhintTxtStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onChanged: (String? eventValue) {
                          setState(() {
                            selectCategoryName = eventValue;
                            _hasPressedSaveButton = true; // Mark interaction as occurred
                            selectedConferenceId = conferenceNameList.firstWhere(
                                    (item) => item['name'] == eventValue)['id'];
                          });
                        },
                        items: conferenceNames
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

// Show error message if dropdown is not selected and Save button is pressed
                if (_hasPressedSaveButton && (selectCategoryName == null || selectCategoryName!.isEmpty))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
                    child: Text(
                      "Please select a category conference",
                      style: FTextStyle.formErrorTxtStyle,
                    ),
                  ),
                SizedBox(height: 10,),
                Text(
                  "Select Category",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    // Ensure the container width is constrained properly
                    width: double.infinity,
                    // Expand to full width of parent container
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: AppColors.boarderColour),
                      color: AppColors.formFieldBackColour,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        key: _selectTopicKey,
                        focusNode: _selectTopicFocusNode,
                        isExpanded: true,
                        // Make the DropdownButton expand to fill the width of the container
                        value: topicModeList.contains(selectTopicName)
                            ? selectTopicName
                            : null,

                        hint: const Text(
                          "Select Category: ",
                          style: FTextStyle.formhintTxtStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onChanged: (String? eventValue) {
                          setState(() {
                            selectTopicName = eventValue;
                            selectedTopicId = topicModeList.firstWhere(
                                    (item) => item['name'] == eventValue)['id'];
                          });
                        },
                        items: topicNames
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                if (hasPaymentButton && (selectPaymentName == null || selectPaymentName!.isEmpty))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
                    child: Text(
                      "Please select a  category",
                      style: FTextStyle.formErrorTxtStyle,
                    ),
                  ),
                SizedBox(height: 10,),

                Text(
                  "Check-In Date & Time: ",
                  style: FTextStyle.formLabelTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _dateOfSubmission,
                    focusNode: _dateFocusNode,
                    keyboardType: TextInputType.text,
                    decoration:
                    FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "dd-mm-yyyy  hh:mm AM",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.calendar_today, // Calendar icon
                          color: Colors.grey, // Adjust color as needed
                        ),
                        onPressed: () {
                          setState(() {
                            isDateFieldFocused = true;
                          });


                          // Show date picker when the icon is pressed
                          CustomPopUp.selectDateAndTime(context, _dateSubmisision);
                        },
                      ),
                    ),
                    inputFormatters: [NoSpaceFormatter()],
                    controller: _dateSubmisision,
                    validator:  ValidatorUtils.transactionDateValidator,
                    onTap: () {
                      setState(() {
                        isDateFieldFocused = true;

                      });
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  "Check-Out Date & Time : ",
                  style: FTextStyle.formLabelTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _dateOutSubmission,
                    focusNode: _dateOutFocusNode,
                    keyboardType: TextInputType.text,
                    decoration:
                    FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "dd-mm-yyyy  hh:mm AM",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.calendar_today, // Calendar icon
                          color: Colors.grey, // Adjust color as needed
                        ),
                        onPressed: () {
                          setState(() {
                            isDateFieldFocused = true;
                          });


                          // Show date picker when the icon is pressed
                          CustomPopUp.selectDateAndTime(context, _dateOutSubmissionController);
                        },
                      ),
                    ),
                    inputFormatters: [NoSpaceFormatter()],
                    controller: _dateOutSubmissionController,
                    validator:  ValidatorUtils.transactionDateValidator,
                    onTap: () {
                      setState(() {
                        isDateFieldFocused = true;

                      });
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                ),
                Text(
                  "No. of persons",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    key: _papertTtileKey,
                    focusNode: _papertTtileFocusNode,
                    keyboardType: TextInputType.name,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        fillColor: AppColors.formFieldBackColour,
                        hintText: "Enter No. of persons "),
                    controller: _paperTitle,
                    validator: ValidatorUtils.transactionNumberValidator,
                    onTap: () {
                      setState(() {
                        isTransactionFocused = true;
                      });
                    },
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
                const SizedBox(height: 8),


                Text(
                  "Payment Mode",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    // Ensure the container width is constrained properly
                    width: double.infinity,
                    // Expand to full width of parent container
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: AppColors.boarderColour),
                      color: AppColors.formFieldBackColour,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        key: _selectPaymentKey,
                        focusNode: _selectPaymentFocusNode,
                        isExpanded: true,
                        // Make the DropdownButton expand to fill the width of the container
                        value: paymentNames.contains(selectPaymentName)
                            ? selectPaymentName
                            : null,

                        hint: const Text(
                          "Select Payment: ",
                          style: FTextStyle.formhintTxtStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onChanged: (String? eventValue) {
                          setState(() {
                            selectPaymentName = eventValue;
                            selectedPaymentId = paymentModeList.firstWhere(
                                    (item) => item['name'] == eventValue)['id'];
                          });
                        },
                        items: paymentNames
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                if (hasPaymentButton && (selectPaymentName == null || selectPaymentName!.isEmpty))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
                    child: Text(
                      "Please select a payment mode",
                      style: FTextStyle.formErrorTxtStyle,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  "Cheque/ Draft/ Transaction Number",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    key: _transactionNumberKey,
                    focusNode: _transactionNumberFocusNode,
                    keyboardType: TextInputType.name,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        fillColor: AppColors.formFieldBackColour,
                        hintText: "Enter Cheque/ Draft/ Transaction Number"),
                    controller: _transactionNumber,
                    validator: ValidatorUtils.transactionNumberValidator,
                    onTap: () {
                      setState(() {
                        isTransactionFocused = true;
                      });
                    },
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
                const SizedBox(height: 8),
                Text(
                  "Cheque/ Draft/ Transaction Date",
                  style: FTextStyle.formLabelTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _dateBirthKey,
                    focusNode: _dateBirthFocusNode,
                    keyboardType: TextInputType.text,
                    decoration:
                    FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "dd-mm-yyyy",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.calendar_today, // Calendar icon
                          color: Colors.grey, // Adjust color as needed
                        ),
                        onPressed: () {
                          setState(() {
                            isDateBirthFieldFocused = true;
                          });


                          // Show date picker when the icon is pressed
                          CustomPopUp.selectDate(context, _dateBirth);
                        },
                      ),
                    ),
                    inputFormatters: [NoSpaceFormatter()],
                    controller: _dateBirth,
                    validator:  ValidatorUtils.transactionDateValidator,
                    onTap: () {
                      setState(() {
                        isDateBirthFieldFocused = true;

                      });
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Upload",
                  style: FTextStyle.formLabelTxtStyle,
                ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                    readOnly: true,
                    key: _uploadNameKey,
                    focusNode: _uploadNameNode,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      fillColor: AppColors.formFieldBackColour,
                      hintText: "Upload File",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.attach_file),
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();
                          if (result != null && result.files.isNotEmpty) {
                            setState(() {
                              fileName1 = result.files.single.name;
                              imagesId = File(result.files.single.path!);
                              isImageUploaded = true;
                              uploadName.text = fileName1!;
                            });
                          }
                        },
                      ),
                    ),
                    controller: uploadName,
                    validator: ValidatorUtils.uploadValidator,
                    onChanged: (text) {
                      setState(() {
                        isButtonEnabled = ValidatorUtils.isValidCommon(text);
                      });
                    },
                    onTap: () {
                      setState(() {
                        isUploadFocused = true;
                      });
                    },
                    onEditingComplete: () {
                      setState(() {
                        isUploadFocused = false;
                      });
                    }

                ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!,
                ),

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
                            print('Checkbox checked: $checkboxChecked');

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
                                  text: "Please upload scan/print copy of Cheque/ Draft/ Bank Transfer Receipt/ Cash Deposit Receipt",
                                  style: FTextStyle.listTitleSub.copyWith(
                                      fontSize: 13, color: Colors.black),
                                ),

                              ],
                            ),
                          ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()) {

                        // All fields are valid, proceed with submission
                        setState(() {
                          isLoading = true;
                          _hasPressedSaveButton = true; /// Start loading
                          hasPaymentButton = true; /// Start loading
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AbstractScreen(),
                          ),
                        );

                      } else {
                        // If any field is invalid, trigger validation error display
                        formKey.currentState!.validate();
                        setState(() {
                          _hasPressedSaveButton = true; /// Start loading
                          hasPaymentButton = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: isButtonEnabled
                          ? AppColors.primaryColour
                          : AppColors.formFieldBorderColour,
                      // Button color depending on the enabled state
                      minimumSize: const Size(double.infinity, 50),
                      // Minimum height
                      maximumSize: const Size(double.infinity, 50),
                      // elevation: 1 // Maximum height
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: FTextStyle.loginBtnStyle,
                      ),
                    ),
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
