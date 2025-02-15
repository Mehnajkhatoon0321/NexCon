import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/fee_delegates/fee_page.dart';
import 'package:nexcon/screen/sideMenu/common_section/privacy_policy.dart';
import 'package:nexcon/screen/sideMenu/common_section/term_condition.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/custom_popup.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/no_space_input_formatter_class.dart';
import 'package:nexcon/utils/validator_utils.dart';


class PayRegistrationFee extends StatefulWidget {
  final String tnNumber;
  final String date;
  final String amount;
  final String bankName;
  final String image;
  final String title;
  final String paymentMode;

  const PayRegistrationFee(
      {required this.bankName,
      required this.date,
      required this.amount,
      required this.image,
      required this.tnNumber,
      super.key,
      required this.title,
      required this.paymentMode});

  @override
  State<PayRegistrationFee> createState() => _PayRegistrationFeeState();
}

class _PayRegistrationFeeState extends State<PayRegistrationFee> {
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

  String? selectCountryNamesCategories;
  String? selectPaymentName;
  String? selectCategoryName;
  bool isButtonEnabled = false; // Tracks button state
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController _transactionNumber = TextEditingController();
  late final TextEditingController _bank = TextEditingController();
  late final TextEditingController _paymentAmountNumber = TextEditingController();
  late final TextEditingController _codeNumber = TextEditingController();
  late final TextEditingController _dateBirth = TextEditingController();
  late final TextEditingController uploadName = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _uploadNameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _selectPaymentKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _selectCategoryKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _dateBirthKey =
      GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _transactionNumberKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _bankKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _paymentAmountKey =
      GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _codeNumberKey =
      GlobalKey<FormFieldState<String>>();

  late final FocusNode _paymentAmountFocusNode = FocusNode();
  late final FocusNode _codeNumberFocusNode = FocusNode();
  late final FocusNode _transactionNumberFocusNode = FocusNode();
  late final FocusNode _bankFocusNode = FocusNode();

  late final FocusNode _dateBirthFocusNode = FocusNode();

  late final FocusNode _selectPaymentFocusNode = FocusNode();
  late final FocusNode _selectCategoryFocusNode = FocusNode();

  bool checkboxChecked = false;

  bool isTransactionFocused = false;
  bool isPaymentFocused = false;

  bool isDateBirthFieldFocused = false;
  bool isCategoryFieldFocused = false;
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
          'Pay Registration Fee',
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
                      _transactionNumber.text) &&
                  ValidatorUtils.isValidAmount(_paymentAmountNumber.text)
                  && ValidatorUtils.isValidTransactionDate(_dateBirth.text)
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
                _transactionNumberKey.currentState!.validate();
              }
              if (isPaymentFocused == true) {
                _paymentAmountKey.currentState!.validate();
              }
              if (_dateBirthFocusNode == true) {
                _dateBirthKey.currentState!.validate();
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
                const SizedBox(height: 5,),
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
                      "Please select a category",
                      style: FTextStyle.formErrorTxtStyle,
                    ),
                  ),
                const SizedBox(height: 10,),
                Text(
                  "Payment Mode",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                const SizedBox(height: 5,),
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
                const SizedBox(height: 10,),
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
                  "Bank Name",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    key: _bankKey,
                    focusNode: _bankFocusNode,
                    keyboardType: TextInputType.name,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        fillColor: AppColors.formFieldBackColour,
                        hintText: "Enter Bank Name"),
                    controller: _bank,
                    validator: ValidatorUtils.bankNameValidator,
                    onTap: () {
                      setState(() {

                      });
                    },
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
                const SizedBox(height: 8),
                Text(
                  "Coupon Code (if any)",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    readOnly: true,
                    key: _codeNumberKey,
                    focusNode: _codeNumberFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        fillColor: AppColors.formFieldBackColour,
                        hintText: "Enter Coupon Code (if any)"),
                    inputFormatters: [NoSpaceFormatter()],
                    controller: _codeNumber,
                    validator: ValidatorUtils.couponCodeValidator,
                    onTap: () {
                      setState(() {});
                    },
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
                const SizedBox(height: 8),
                Text(
                  "Pay Amount ",
                  style: FTextStyle.SubHeadingTxtStyle,
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    readOnly: true,
                    key: _paymentAmountKey,
                    focusNode: _paymentAmountFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        fillColor: AppColors.formFieldBackColour,
                        hintText: "Enter Pay Amount"),
                    inputFormatters: [NoSpaceFormatter()],
                    controller: _paymentAmountNumber,
                    validator: ValidatorUtils.amountValidator,
                    onTap: () {
                      setState(() {
                        isPaymentFocused = true;
                      });
                    },
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
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
                                  text: "I accept ",
                                  style: FTextStyle.listTitleSub.copyWith(
                                      fontSize: 13, color: Colors.black),
                                ),
                                TextSpan(
                                  text: "Terms & Conditions",
                                  style: FTextStyle.listTitleSub.copyWith(
                                      fontSize: 13, color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TermCondition(),
                                        ),
                                      );
                                    },
                                ),
                                TextSpan(
                                  text: " and ",
                                  style: FTextStyle.listTitleSub.copyWith(
                                      fontSize: 13, color: Colors.black),
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: FTextStyle.listTitleSub.copyWith(
                                      fontSize: 13, color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Action to view registration fee
                                      // For example, navigate to another page or open a link
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PrivacyPolicy(),
                                        ),
                                      );
                                    },
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
                                const FeePage(),
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
