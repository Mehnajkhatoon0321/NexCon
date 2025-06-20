import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/validator_utils.dart';

import '../../../../../utils/form_field_style.dart';
class AddCouponCode extends StatefulWidget {
  String isEdit;
  String title;
   AddCouponCode({required this.isEdit,required this.title,key});

  @override
  State<AddCouponCode> createState() => _AddCouponCodeState();
}

class _AddCouponCodeState extends State<AddCouponCode> {
  @override


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

  late final FocusNode _titleFocusNode = FocusNode();

  String? conferenceCategoryTitleName;
  List<String> conferenceTitleName = [
    '4th International Science Communication Conference',
    '5th International Tech & Innovation Summit',
  ];
  final TextEditingController _titleController = TextEditingController();
  late final GlobalKey<FormFieldState<String>> titleKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> codeKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> discountValueKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> discountTypeKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> validFromKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> validToKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> usageLimitKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> timeCategoryKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _conferenceCategoryKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> statusKey = GlobalKey<FormFieldState<String>>();

  bool isButtonEnabled = false;

  // Add these controllers and variables at the top of your class:
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _discountValueController = TextEditingController();
  final TextEditingController _usageLimitController = TextEditingController();
  final TextEditingController _validFromController = TextEditingController();
  final TextEditingController _validToController = TextEditingController();

  late final FocusNode _codeFocusNode = FocusNode();
  late final FocusNode _discountValueFocusNode = FocusNode();
  late final FocusNode _validFromFocusNode = FocusNode();
  late final FocusNode _validToFocusNode = FocusNode();
  late final FocusNode _usageLimitFocusNode = FocusNode();
  late final FocusNode _timeListFocusNode = FocusNode();
  late final FocusNode _selectconferenceCategoryFocusNode = FocusNode();
  late final FocusNode _statusFocusNode = FocusNode();

  String? discountType;
  String? status;
  bool isTitleFieldFocused = false;
  List<String> discountTypeOptions = ['Percentage', 'Flat'];
  List<String> statusOptions = ['Active', 'Inactive'];
  void initState() {
    super.initState();

    _titleFocusNode.addListener(() {
      if (!_titleFocusNode.hasFocus) {
        titleKey.currentState?.validate();
      }
    });

    _codeFocusNode.addListener(() {
      if (!_codeFocusNode.hasFocus) {
        codeKey.currentState?.validate();
      }
    });

    _discountValueFocusNode.addListener(() {
      if (!_discountValueFocusNode.hasFocus) {
        discountValueKey.currentState?.validate();
      }
    });

    _validFromFocusNode.addListener(() {
      if (!_validFromFocusNode.hasFocus) {
        validFromKey.currentState?.validate();
      }
    });

    _validToFocusNode.addListener(() {
      if (!_validToFocusNode.hasFocus) {
        validToKey.currentState?.validate();
      }
    });

    _usageLimitFocusNode.addListener(() {
      if (!_usageLimitFocusNode.hasFocus) {
        usageLimitKey.currentState?.validate();
      }
    });

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

    _statusFocusNode.addListener(() {
      if (!_statusFocusNode.hasFocus) {
        statusKey.currentState?.validate();
      }
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.backgroundColor ,
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
          widget.isEdit.isNotEmpty ? "Edit New Coupon" : "Create New Coupon",
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
              key: formKey,
              onChanged: () {
        if(_titleController.text.isNotEmpty && ValidatorUtils.isValidCommon(_titleController.text)&&
                    _codeController.text.isNotEmpty &&
                    discountType != null &&
                    _discountValueController.text.isNotEmpty &&
                    _validFromController.text.isNotEmpty &&
                    _validToController.text.isNotEmpty &&
                    _usageLimitController.text.isNotEmpty &&
                    status != null &&
                    conferenceCategoryTitleName != null && conferenceCategoryTitleName!.isNotEmpty);

                setState(() {
                  isButtonEnabled = true;
                });

                if (isTitleFieldFocused == true) {
                  titleKey.currentState!.validate();
                }

              },

              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.subheading
                    ),
                  ),
                  //
                  // Text(
                  //   "Title",
                  //   style: FTextStyle.SubHeadingTxtStyle,
                  // ).animateOnPageLoad(
                  //     animationsMap['imageOnPageLoadAnimation2']!),
                  //
                  // const SizedBox(height: 5),
                  // TextFormField(
                  //   focusNode: _titleFocusNode,
                  //   key: titleKey,
                  //   keyboardType: TextInputType.text,
                  //   decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  //     hintText: "Enter Presentation Title",
                  //   ),
                  //   controller: _titleController,
                  //   validator: ValidatorUtils.model,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       // Validate only the name field
                  //       titleKey.currentState?.validate();
                  //     });
                  //   },
                  //   onTap: () {
                  //     setState(() {
                  //       isTitleFieldFocused == true;
                  //
                  //       // Reset other fields if needed
                  //
                  //     });
                  //   },
                  // ).animateOnPageLoad(
                  //   animationsMap['imageOnPageLoadAnimation2']!,
                  // ),
                  // const SizedBox(height: 5),


                  Text("Code", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  TextFormField(
                    key: codeKey,
                    controller: _codeController,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Coupon Code",
                    ),
                    validator: ValidatorUtils.model,
                    onChanged: (value) {
                      setState(() {
                        // Validate only the name field
                        codeKey.currentState?.validate();
                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                  const SizedBox(height: 10),
                  Text("Discount Type", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    value: discountType,
                    isExpanded: true,
                    key: discountTypeKey,
                    hint: const Text("Select Discount Type", style: FTextStyle.formhintTxtStyle),
                    items: discountTypeOptions.map((type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        discountType = val;
                      });
                      discountTypeKey.currentState?.validate(); // Validate on
                    },
                    decoration: FormFieldStyle.dropDown.copyWith(
                      errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    ),
                    validator: ValidatorUtils.model,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                  const SizedBox(height: 10),
                  Text("Discount Value", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _discountValueController,
                    key:discountValueKey ,
                    keyboardType: TextInputType.number,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Discount Value",
                    ),
                    validator: ValidatorUtils.model,
                    onChanged: (value) {
                      setState(() {
                        // Validate only the name field
                        discountValueKey.currentState?.validate();
                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                  const SizedBox(height: 10),
                  Text("Valid From", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
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
                        });
                        validFromKey.currentState?.validate();

                      }
                    },
                    validator: ValidatorUtils.model,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                  const SizedBox(height: 10),
                  Text("Valid To", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _validToController,
                    readOnly: true,
                    key: validToKey,
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
                        validToKey.currentState?.validate(); // Validate the field after date is picked
                      }
                    },

                    validator: ValidatorUtils.model,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                  const SizedBox(height: 10),
                  Text("Usage Limit", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _usageLimitController,
                    key: usageLimitKey,
                    keyboardType: TextInputType.number,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Usage Limit",
                    ),
                    validator: ValidatorUtils.model,
                    onChanged: (value) {
                      setState(() {
                        // Validate only the name field
                        usageLimitKey.currentState?.validate();
                      });
                    },
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),


                  const SizedBox(height: 10),
                  Text("Status", style: FTextStyle.SubHeadingTxtStyle)
                      .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    value: status,
                    isExpanded: true,
                    key: statusKey,
                    hint: const Text("Select Status", style: FTextStyle.formhintTxtStyle),
                    items: statusOptions.map((s) {
                      return DropdownMenuItem<String>(
                        value: s,
                        child: Text(s, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        status = val;
                      });
                      statusKey.currentState?.validate();
                    },
                    decoration: FormFieldStyle.dropDown.copyWith(
                      errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    ),
                    validator: ValidatorUtils.model,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 40),
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
              )),
        ),
      ),

    );
  }
}
