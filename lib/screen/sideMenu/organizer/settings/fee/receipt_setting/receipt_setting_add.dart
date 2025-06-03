import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../../../../../utils/colours.dart';
import '../../../../../../utils/font_text_Style.dart';
class ReceiptSettingAdd extends StatefulWidget {
  String isEdit;
   ReceiptSettingAdd({required this.isEdit,super.key});

  @override
  State<ReceiptSettingAdd> createState() => _ReceiptSettingAddState();
}

class _ReceiptSettingAddState extends State<ReceiptSettingAdd> {
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
  late final FocusNode _conferenceFocusNode = FocusNode();
  final GlobalKey<FormFieldState<String>> conferenceCategoryKey = GlobalKey<FormFieldState<String>>();
  String? fileName1;

  File? imagesId;

  bool isUploadFocused = false;

  bool isImageUploaded = false;
  bool isUpload2Focused = false;
  File? imagesId2;
  String? fileName2;
  bool isImage2Uploaded = false;
  late final FocusNode _uploadNameNode = FocusNode();
  late final FocusNode _uploadName2Node = FocusNode();
  String? selectedConference;
  bool isButtonEnabled=false;
  final List<String> conferenceOptions = ['TechConf 2025', 'HealthSummit', 'EduExpo'];
  final TextEditingController _conferenceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController uploadName = TextEditingController();
  late final TextEditingController uploadName2 = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _uploadNameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _uploadNameKey2 =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> validFromKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> validToKey = GlobalKey<FormFieldState<String>>();
  final TextEditingController _validFromController = TextEditingController();
  final TextEditingController _validToController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          widget.isEdit.isNotEmpty ?"Edit Receipt Setting":  ' Create Receipt Setting',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            final isValid =
                selectedConference != null &&
                _conferenceController.text.isNotEmpty && uploadName.text.isNotEmpty && uploadName2.text.isNotEmpty;
            ;

            setState(() {
              isButtonEnabled = isValid;
            });
          },
          child: ListView(
            children: [
              /// Conference Name Dropdown
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

              Text("Upload Seal/Stamp", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
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
                          _uploadNameKey.currentState?.validate();
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

              ),
              const SizedBox(height: 16),
              Text("Upload Signature", style: FTextStyle.SubHeadingTxtStyle),

              const SizedBox(height: 6),

              TextFormField(
                  readOnly: true,
                  key: _uploadNameKey2,
                  focusNode: _uploadName2Node,
                  decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    fillColor: AppColors.formFieldBackColour,
                    hintText: "Upload Signature File",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result != null && result.files.isNotEmpty) {
                          setState(() {
                            fileName2 = result.files.single.name;
                            imagesId2= File(result.files.single.path!);
                            isImage2Uploaded = true;
                            uploadName2.text = fileName1!;
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

              const SizedBox(height: 16),
              Text("Generation Receipt Date-Organizer", style: FTextStyle.SubHeadingTxtStyle),

              const SizedBox(height: 6),

              TextFormField(
                key: validFromKey,
                controller: _validFromController,
                readOnly: true,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Select Start Date",
                  suffixIcon: const Icon(Icons.calendar_today, size: 20),
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _validFromController.text = DateFormat('yyyy-MM-dd').format(picked);
                      // _validFromController.text = picked.toIso8601String().split('T').first;
                    });
                    validFromKey.currentState?.validate();


                  }
                },
                validator: ValidatorUtils.model,
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

              const SizedBox(height: 16),
              Text("Generation Receipt Date-Delegate", style: FTextStyle.SubHeadingTxtStyle),

              TextFormField(
                key: validToKey,
                controller: _validToController,
                readOnly: true,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Select End Date",
                  suffixIcon: const Icon(Icons.calendar_today, size: 20),
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _validToController.text = DateFormat('yyyy-MM-dd').format(picked);
                      // _validToController.text = picked.toIso8601String().split('T').first;
                    });
                    validToKey.currentState?.validate();

                  }
                },

                validator: ValidatorUtils.model,
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),



              const SizedBox(height: 30),

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
                        widget.isEdit.isNotEmpty ? "Edit" : "Create",
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
