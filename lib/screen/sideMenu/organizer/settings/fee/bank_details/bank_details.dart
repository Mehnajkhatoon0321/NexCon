import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../../../../../utils/colours.dart';
import '../../../../../../utils/font_text_Style.dart';
class BankDetails extends StatefulWidget {

  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedConference;
  bool isButtonEnabled=false;
  bool isUpload2Focused = false;
  File? imagesId2;
  String? fileName2;

  bool isUploadFocused = false;
  bool isImage2Uploaded = false;
  late final TextEditingController uploadName2 = TextEditingController();
  late final FocusNode _uploadName2Node = FocusNode();
  late final GlobalKey<FormFieldState<String>> _uploadNameKey2 =
  GlobalKey<FormFieldState<String>>();
  final List<String> conferenceOptions = ['TechConf 2025', 'HealthSummit', 'EduExpo'];
  final TextEditingController _conferenceController = TextEditingController();
  final TextEditingController _nameOfAccountController = TextEditingController();
  final TextEditingController _nameOfBankController = TextEditingController();
  final TextEditingController _bankAddressController = TextEditingController();
  final TextEditingController _typesOfAccountController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _iFSCController = TextEditingController();
  final TextEditingController _swiftCodeController = TextEditingController();
  final TextEditingController _upiIDController = TextEditingController();
  final GlobalKey<FormFieldState<String>> conferenceCategoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> nameOfAccCategoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> nameOfBankCategoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> bankAddressCategoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> typesOfAccountKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> accountNumberKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> iFSCKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> swiftCodeKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> upiIDCodeKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
          'QR Code',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Conference Name", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: selectedConference,
                  isExpanded: true,
                  key: conferenceCategoryKey,
                  hint: const Text("Select Conference", style: FTextStyle.formhintTxtStyle),
                  items: conferenceOptions.map((conf) {
                    return DropdownMenuItem<String>(
                      value: conf,
                      child: Text(conf, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => selectedConference = value);
                    conferenceCategoryKey.currentState?.validate();
                  },
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  validator: (value) => value == null ? "Please select a conference" : null,
                ),

                const SizedBox(height: 16),
                Text("Name of Account", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _nameOfAccountController,
                  key: nameOfAccCategoryKey,
                  keyboardType: TextInputType.name,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter Name Of Account",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    nameOfAccCategoryKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.model,
                ),

                const SizedBox(height: 16),
                Text("Name of the Bank", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _nameOfBankController,
                  key: nameOfBankCategoryKey,
                  keyboardType: TextInputType.name,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter Name of the Bank",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    nameOfBankCategoryKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.bankNameValidator,
                ),

                const SizedBox(height: 16),
                Text("Bank Address", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _bankAddressController,
                  key: bankAddressCategoryKey,
                  keyboardType: TextInputType.streetAddress,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter Bank Address",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    bankAddressCategoryKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.addressValidator,
                ),

                const SizedBox(height: 16),
                Text("Type of Account", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _typesOfAccountController,
                  key: typesOfAccountKey,
                  keyboardType: TextInputType.streetAddress,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter Type of Account",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    typesOfAccountKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.model
                ),
////////



                ////
                const SizedBox(height: 16),
                Text("Account Number", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _accountNumberController,
                  key: accountNumberKey,
                  keyboardType: TextInputType.streetAddress,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter Account Number",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    accountNumberKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.model,
                ),
                const SizedBox(height: 16),
                Text("Type IFSC", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _iFSCController,
                  key: iFSCKey,
                  keyboardType: TextInputType.streetAddress,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter IFSC",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    iFSCKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.model,
                ),
                const SizedBox(height: 16),
                Text("Swift code", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _swiftCodeController,
                  key: swiftCodeKey,
                  keyboardType: TextInputType.streetAddress,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter Swift code",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    swiftCodeKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.model,
                ),
                const SizedBox(height: 16),
                Text("UPI ID", style: FTextStyle.SubHeadingTxtStyle),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _upiIDController,
                  key: upiIDCodeKey,
                  keyboardType: TextInputType.streetAddress,
                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                    hintText: "Enter UPI Id",
                    hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                    errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  ),
                  onChanged: (val) {
                    // Validate only this field on change
                    upiIDCodeKey.currentState?.validate();
                  },
                  validator: ValidatorUtils.model,
                ),
                const SizedBox(height: 16),
                Text("Upload QR File", style: FTextStyle.SubHeadingTxtStyle),

                const SizedBox(height: 6),

                TextFormField(
                    readOnly: true,
                    key: _uploadNameKey2,
                    focusNode: _uploadName2Node,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      fillColor: AppColors.formFieldBackColour,
                      hintText: "Upload QR File",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.attach_file),
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();
                          if (result != null && result.files.isNotEmpty) {
                            setState(() {
                              fileName2 = result.files.single.name;
                              imagesId2= File(result.files.single.path!);
                              isImage2Uploaded = true;
                              uploadName2.text = fileName2!;
                            });
                            _uploadNameKey2.currentState?.validate();
                          }
                        },
                      ),
                    ),
                    controller: uploadName2,
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

                ),
                const SizedBox(height: 30),

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
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          // You can add submission logic here
                        } else {
                          // Handle invalid form state
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
                        child: Text(
                          "Create",
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
      ),
    );
  }
}
