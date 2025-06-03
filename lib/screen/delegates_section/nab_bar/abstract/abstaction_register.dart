import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';
class AbstractionRegister extends StatefulWidget {
   String isEdit;
   String title;

   AbstractionRegister({required this.isEdit,required this.title,super.key});

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
  String? conferenceCategoryTitleName;
  List<String> conferenceTitleName = [
    '4th International Science Communication Conference',
    '5th International Tech & Innovation Summit',
  ];
  final GlobalKey<FormFieldState> _abstractPaperFileKey = GlobalKey<FormFieldState>();
  final FocusNode _abstractPaperFileFocusNode = FocusNode();

  TextEditingController abstractPaperFileController = TextEditingController();

  File? abstractPaperFile;
  String? abstractPaperFileName;
  bool isAbstractPaperFileUploaded = false;
  bool isAbstractPaperUploadFocused = false;

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

  final GlobalKey<FormFieldState> _paperTypeKey = GlobalKey<FormFieldState>();
  final FocusNode _selectPaperTypeFocusNode = FocusNode();

  String? selectedPaperType;

  List<String> paperTypeList = [
    'Oral',
    'Poster',
    'Invited Talk',
    'Review',
    'Short Communication',
    'Other',
  ];
  final GlobalKey<FormFieldState> _authorNameKey = GlobalKey<FormFieldState>();
  final FocusNode _authorNameFocusNode = FocusNode();
  final TextEditingController authorNameController = TextEditingController();
  bool isAuthorNameFocused = false;


  final TextEditingController remarksController = TextEditingController();

  bool isRemarksFocused = false;

  final GlobalKey<FormFieldState> _paperTitleKey = GlobalKey<FormFieldState>();
  final FocusNode _paperTitleFocusNode = FocusNode();

  final TextEditingController paperTitleController = TextEditingController();

  bool isPaperTitleFocused = false;
  final GlobalKey<FormFieldState> _presentingAuthorNameKey = GlobalKey<FormFieldState>();
  final FocusNode _presentingAuthorNameFocusNode = FocusNode();
  final TextEditingController presentingAuthorNameController = TextEditingController();
  bool isPresentingAuthorNameFocused = false;

  final GlobalKey<FormFieldState> _keywordsKey = GlobalKey<FormFieldState>();
  final FocusNode _keywordsFocusNode = FocusNode();
  final TextEditingController keywordsController = TextEditingController();
  bool isKeywordsFocused = false;

  final GlobalKey<FormFieldState> _descriptionKey = GlobalKey<FormFieldState>();
  final FocusNode _descriptionFocusNode = FocusNode();
  final TextEditingController descriptionController = TextEditingController();
  bool isDescriptionFocused = false;

  @override
  void initState() {
    super.initState();


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
            widget.isEdit.isNotEmpty ? 'Edit Abstract Session/Themes' : 'Create Abstract Session/Themes',

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
                    widget.title,
                    style: FTextStyle.subheading,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  // Padding(
                  //   padding:
                  //   const EdgeInsets.symmetric(vertical: 10.0),
                  //   child: DropdownButtonFormField<String>(
                  //     key: _conferenceCategoryKey,
                  //     focusNode: _selectconferenceCategoryFocusNode,
                  //     value: conferenceCategoryTitleName,
                  //     isExpanded: true, // ✅ Prevent horizontal overflow
                  //     hint: const Text(
                  //       "Select Conference",
                  //       style: FTextStyle.formhintTxtStyle,
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //     items: conferenceTitleName.map((category) {
                  //       return DropdownMenuItem<String>(
                  //         value: category,
                  //         child: Text(
                  //           category,
                  //           overflow: TextOverflow.ellipsis,
                  //           maxLines: 1,
                  //           style: const TextStyle(fontSize: 14),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (newValue) {
                  //       setState(() {
                  //         conferenceCategoryTitleName = newValue;
                  //       });
                  //       _conferenceCategoryKey.currentState?.validate();
                  //     },
                  //     decoration: FormFieldStyle.dropDown.copyWith(
                  //       errorStyle: const TextStyle(
                  //         color: AppColors.errorColor,  // Or any other color you'd like
                  //         fontSize: 12,
                  //       ),
                  //     ),
                  //     validator: ValidatorUtils.model,
                  //   ),
                  // ),
          SizedBox(height: 20,),
                  Text(
                    "Select Proposal Type",
                    style: FTextStyle.SubHeadingTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: _paperTypeKey,
                      focusNode: _selectPaperTypeFocusNode,
                      value: selectedPaperType,
                      isExpanded: true,
                      hint: const Text(
                        "Select Proposal Type",
                        style: FTextStyle.formhintTxtStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      items: paperTypeList.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedPaperType = newValue;
                        });
                        _paperTypeKey.currentState?.validate();
                      },
                      decoration: FormFieldStyle.dropDown.copyWith(
                        errorStyle: const TextStyle(
                          color: AppColors.errorColor,
                          fontSize: 12,
                        ),
                      ),
                      validator: ValidatorUtils.model,
                    ),
                  ),
                  Text(
                    "Paper Title",
                    style: FTextStyle.SubHeadingTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _paperTitleKey,
                      focusNode: _paperTitleFocusNode,
                      controller: paperTitleController,
                      maxLines: 1,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter Paper Title",
                      ),
                      validator: ValidatorUtils.model,  // Create this validator or reuse an existing one
                      onTap: () {
                        setState(() {
                          isPaperTitleFocused = true;
                          // Reset other field focus flags if you have them
                        });
                      },
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  ),
          
                  Text(
                    "Author(s) Name",
                    style: FTextStyle.SubHeadingTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _authorNameKey, // Define this GlobalKey in your state
                      focusNode: _authorNameFocusNode, // Define this FocusNode
                      controller: authorNameController, // Define this TextEditingController
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter Author(s) Name",
                      ),
                      validator: ValidatorUtils.model, // Use appropriate validation if needed
                      onTap: () {
                        setState(() {
                          isAuthorNameFocused = true; // Define this variable in your state
                          // Reset other fields focus states if needed
                        });
                      },
                    )
                  ),

                  Text(
                    "Presenting Author's Name",
                    style: FTextStyle.SubHeadingTxtStyle,

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _presentingAuthorNameKey, // Define in your state
                      focusNode: _presentingAuthorNameFocusNode, // Define in your state
                      controller: presentingAuthorNameController, // Define in your state
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter Presenting Author's Name",
                      ),
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isPresentingAuthorNameFocused = true; // Define this bool in your state
                          // Reset other field focus states if necessary
                        });
                      },
                    // Make sure this exists
                    ),
                  ),
                  Text(
                    "Keywords",
                    style: FTextStyle.SubHeadingTxtStyle,

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _keywordsKey, // Define in your state
                      focusNode: _keywordsFocusNode, // Define in your state
                      controller: keywordsController, // Define in your state
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter Keywords (comma separated)",
                      ),
                      validator: ValidatorUtils.model, // Or use a custom validator
                      onTap: () {
                        setState(() {
                          isKeywordsFocused = true; // Define this bool in your state
                          // Reset other field focus states if necessary
                        });
                      },
                    // Ensure this animation exists
                    ),
                  ),
                  Text(
                    "Description",
                    style: FTextStyle.SubHeadingTxtStyle,

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _descriptionKey, // Define in your state
                      focusNode: _descriptionFocusNode, // Define in your state
                      controller: descriptionController, // Define in your state
                      maxLines: 5, // Allows multi-line input
                      minLines: 3,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter Description",
                      ),
                      validator: ValidatorUtils.model, // Or your custom validator
                      onTap: () {
                        setState(() {
                          isDescriptionFocused = true; // Define in your state
                          // Reset other focus flags if needed
                        });
                      },
                    // Ensure animation exists
                    ),
                  ),


                  Text(
                    "Upload Abstract Paper",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    key: _abstractPaperFileKey,
                    focusNode: _abstractPaperFileFocusNode,
                    decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      fillColor: AppColors.formFieldBackColour,
                      hintText: "Upload Abstract Paper File",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.attach_file),
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'doc', 'docx', 'png'],
                          );
                          if (result != null && result.files.isNotEmpty) {
                            setState(() {
                              abstractPaperFileName = result.files.single.name;
                              abstractPaperFile = File(result.files.single.path!);
                              isAbstractPaperFileUploaded = true;
                              abstractPaperFileController.text = abstractPaperFileName!;
                            });
                          }
                        },
                      ),
                    ),
                    controller: abstractPaperFileController,
                    validator: ValidatorUtils.uploadValidator,
                    onChanged: (text) {
                      setState(() {
                        isButtonEnabled = ValidatorUtils.isValidCommon(text);
                      });
                    },
                    onTap: () {
                      setState(() {
                        isAbstractPaperUploadFocused = true;
                      });
                    },
                    onEditingComplete: () {
                      setState(() {
                        isAbstractPaperUploadFocused = false;
                      });
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
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
                            child:  Text(widget.isEdit.isNotEmpty ? "Update" : "Submit", style: FTextStyle.loginBtnStyle),
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


      ),
    );
  }

}
