import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/screen/authFlow/organizer_my_profile/my_profile_organizer.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/no_space_input_formatter_class.dart';
import 'package:nexcon/utils/validator_utils.dart';
class EditProfileOrganizer extends StatefulWidget {
  const EditProfileOrganizer({super.key});

  @override
  State<EditProfileOrganizer> createState() => _EditProfileOrganizerState();
}

class _EditProfileOrganizerState extends State<EditProfileOrganizer> {
  late final formKey = GlobalKey<FormState>();

  late final TextEditingController name = TextEditingController();
  late final TextEditingController organizationNamePrice = TextEditingController();

  late final TextEditingController productCategory = TextEditingController();

  late final TextEditingController _addressKey = TextEditingController();
  late final TextEditingController warranty = TextEditingController();
  late final TextEditingController gst = TextEditingController();
  late final TextEditingController mobile = TextEditingController();
  late final TextEditingController remark = TextEditingController();

  late final GlobalKey<FormFieldState<String>> _nameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _organizationNamePriceKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> __addressKeyKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _warrantyKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _gstKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _mobileKey =
  GlobalKey<FormFieldState<String>>();


  late final FocusNode _nameNode = FocusNode();
  late final FocusNode _organizationNameNode = FocusNode();




  late final FocusNode _addressNode = FocusNode();

  late final FocusNode _gstNode = FocusNode();
  late final FocusNode _mobileNode = FocusNode();

  late final GlobalKey<FormFieldState<String>> _countryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _cityKey =
  GlobalKey<FormFieldState<String>>();


  bool isButtonEnabled = false;

  String? selectedProductCategory;
  String? selectedDayTypes;
  String? selectedDomain;
  String? selectedBrand;

  var profileUpdate = false;
  bool isModelFieldFocused = false;
  bool isNameFieldFocused = false;
  bool isOrganizationNameFieldFocused = false;
  bool isDealerFocused = false;
  bool isProductCategoryFieldFocused = false;
  bool isDayTypesFieldFocused = false;
  bool isDomainFieldFocused = false;
  bool isBrandFieldFocused = false;
  bool isDescriptionFieldFocused = false;
  bool isWarrantyFieldFocused = false;
  bool isGstFieldFocused = false;
  bool isMobileFieldFocused = false;
  bool isRemarkFieldFocused = false;
  String cameraSelectedImage = '';
  String gallerySelectedImage = '';
  String selectionImageType = '';
  late final FocusNode _cityFocusNode = FocusNode();
  late final FocusNode _countryFocusNode = FocusNode();
  final ImagePicker _imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';
  List<int> profileImage = [];
  List<int> Images = [];
  String? selectCountryNamesCategories;
  String? selectCityNamesCategories;
  List<String> productCategories = [
    'Application Developer',
    'Web Developer',
    'SEO',
    'Marketing',
    'Other',

  ];


  bool isLoading = false;

  String productCategoryText = "";

  File? _image;


  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

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


  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
            'Edit Profile',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,

        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15,left: 20,right: 20),
                child: Form(

                  onChanged: () {
                    if ( selectedProductCategory != null &&
                        selectedProductCategory!.isNotEmpty &&
                        ValidatorUtils.isValidTransactionDate(remark.text) &&

                        ValidatorUtils.isValidCommon(name.text)&&

                        ValidatorUtils.isValidCommon(organizationNamePrice.text) &&
                        ValidatorUtils.isValidCommon(gst.text) &&
                        ValidatorUtils.isValidCommon(_addressKey.text)
                    ) {
                      setState(() {
                        isButtonEnabled = true;
                      });
                    } else {
                      setState(() {
                        isButtonEnabled = false;
                      });
                    }
                    if (isProductCategoryFieldFocused == true) {
                      _productCategoryKey.currentState!.validate();
                    }


                    if (isWarrantyFieldFocused == true) {
                      _warrantyKey.currentState!.validate();
                    } if (isNameFieldFocused == true) {
                      _nameKey.currentState!.validate();
                    } if (isGstFieldFocused == true) {
                      _gstKey.currentState!.validate();
                    } if (isDescriptionFieldFocused == true) {
                      __addressKeyKey.currentState!.validate();
                    }






                  },


                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Center(
                        child: Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                            child: (profileImage.isNotEmpty && !profileUpdate) ?
                            Stack(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    height: (displayType == 'desktop' || displayType == 'tablet') ? 70.w : 110,
                                    width: (displayType == 'desktop' || displayType == 'tablet') ? 70.w : 110,
                                    child: profileImage.isNotEmpty
                                        ? Image.memory(
                                      Uint8List.fromList(profileImage),
                                      fit: BoxFit.cover,
                                    )
                                        : null,
                                  ),
                                ),

                                if (profileImage.isNotEmpty)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _image = null;
                                          profileUpdate = true;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF0E8F0),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(45),
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFFE1D2E0), // Change to your desired border color
                                            width: 1.0, // Change to your desired border width
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColors.primaryColour,
                                          size: (displayType == 'desktop' || displayType == 'tablet') ? 20.w : 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ) :

                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: ClipOval(
                                    // borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/profile.png',
                                      fit: BoxFit.cover,
                                      height: (displayType == 'desktop' || displayType == 'tablet') ? 70.w : 100,
                                      width: (displayType == 'desktop' || displayType == 'tablet') ? 70.w : 100,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF0E8F0),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(45),
                                        ),
                                        border: Border.all(
                                          color: const Color(0xFFE1D2E0), // Change to your desired border color
                                          width: 1.0, // Change to your desired border width
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColors.primaryColour,
                                        size: (displayType == 'desktop' || displayType == 'tablet') ? 20.w : 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )




                        ),
                      ),
                      Text(
                        "Organization Name",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _organizationNamePriceKey,
                          focusNode: _organizationNameNode,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter organization name"),

                          controller: organizationNamePrice,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              isProductCategoryFieldFocused=false;
                              isBrandFieldFocused=false;
                              isModelFieldFocused = false;
                              isWarrantyFieldFocused = false;
                              isNameFieldFocused = false;
                              isOrganizationNameFieldFocused = true;
                              isDealerFocused = false;
                              isDescriptionFieldFocused = false;
                            
                              isRemarkFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ),

                      Text(
                        "Name",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _nameKey,
                          focusNode: _nameNode,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter name"),

                          controller: name,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              isProductCategoryFieldFocused=false;
                              isBrandFieldFocused=false;
                              isModelFieldFocused = false;
                              isWarrantyFieldFocused = false;
                              isNameFieldFocused = true;
                              isDealerFocused = false;
                              isDescriptionFieldFocused = false;

                              isGstFieldFocused = false;
                              isRemarkFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ),

                      Text(
                        "Email",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _gstKey,
                          focusNode: _gstNode,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter email"),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: gst,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              isProductCategoryFieldFocused=false;
                              isBrandFieldFocused=false;
                              isModelFieldFocused = false;
                              isWarrantyFieldFocused = false;
                              isNameFieldFocused = false;
                              isDealerFocused = false;
                              isDescriptionFieldFocused = false;

                              isGstFieldFocused = true;
                              isRemarkFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ),

                      Text(
                        "Country",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _countryKey,
                          focusNode: _countryFocusNode,
                          value: selectCountryNamesCategories,
                          hint: const Text(
                            "Select Country",
                            style: FTextStyle.formhintTxtStyle,
                          ),
                          items: Constants.countryNamesCategories
                              .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectCountryNamesCategories = newValue;
                            });
                            _countryKey.currentState?.validate(); // Validate only this field
                          },
                          decoration: FormFieldStyle.dropDown,
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "City",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _cityKey,
                          focusNode: _cityFocusNode,
                          value: selectCityNamesCategories,
                          hint: const Text(
                            "Select City",
                            style: FTextStyle.formhintTxtStyle,
                          ),
                          items: Constants.cityNamesCategories
                              .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                              .toList(),
                          onChanged: (cityValue) {
                            setState(() {
                              selectCityNamesCategories = cityValue;
                            });
                            _cityKey.currentState?.validate(); // Validate only this field
                          },
                          decoration: FormFieldStyle.dropDown,
                          validator: ValidatorUtils.model,
                        ),
                      ),

                      Text(
                        "Mobile Number",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _mobileKey,
                          focusNode: _mobileNode,
                          keyboardType: TextInputType.number,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter mobile number"),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: mobile,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              isProductCategoryFieldFocused=false;
                              isBrandFieldFocused=false;
                              isModelFieldFocused = false;
                              isWarrantyFieldFocused = false;
                              isNameFieldFocused = false;
                              isDealerFocused = false;
                              isDescriptionFieldFocused = false;
                              isMobileFieldFocused = true;
                              isGstFieldFocused = false;

                              isRemarkFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ),






                      Text(
                        "Address",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: __addressKeyKey,
                          focusNode: _addressNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4, // Allows for multiple lines
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter address",
                          ),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: _addressKey,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              isProductCategoryFieldFocused = false;
                              isBrandFieldFocused = false;
                              isModelFieldFocused = false;
                              isWarrantyFieldFocused = false;
                              isNameFieldFocused = false;
                              isDealerFocused = false;
                              isDescriptionFieldFocused = true;
                              isGstFieldFocused = false;
                              isRemarkFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                      )

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: SizedBox(
                  height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProfileOrganizer(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primaryColour,
                    ),
                    child: Text(
                      "Update",
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Take a Photo')
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.photo_library),
                        onPressed: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Choose from Gallery')
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void _imgFromCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        profileUpdate = false;
        profileImage = [];
        selectionImageType = 'CAMERA';
        _image = File(image.path);
        final bytes = _image?.readAsBytesSync();
        cameraSelectedImage = base64Encode(bytes!);
        profileImage = base64Decode(cameraSelectedImage);
      });
    }
  }

  void _imgFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectionImageType = 'GALLERY';
      setState(() {
        profileUpdate = false;
        profileImage = [];
        _image = File(image.path);
        final bytes = _image?.readAsBytesSync();
        gallerySelectedImage = base64Encode(bytes!);
        profileImage = base64Decode(gallerySelectedImage);
      });
    }
  }
}
