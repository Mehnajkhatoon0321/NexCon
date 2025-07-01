import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';

import 'package:nexcon/utils/validator_utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _designationKey = GlobalKey<FormFieldState>();
  String? selectedDesignation;
  List<String> designationList = ['Professor', 'Doctor', 'Student', 'Researcher']; // Replace with your actual list
  final GlobalKey<FormFieldState> _genderKey = GlobalKey<FormFieldState>();
  String? selectedGender;
  List<String> genderList = ['Male', 'Female', 'Other'];
  final GlobalKey<FormFieldState> _institutionKey = GlobalKey<FormFieldState>();
  final TextEditingController _institutionController = TextEditingController();

  late final TextEditingController customerPrice = TextEditingController();

  late final TextEditingController productCategory = TextEditingController();
  final GlobalKey<FormFieldState> _telephoneOKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _telephoneRKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _addressKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _websiteKey = GlobalKey<FormFieldState>();

  final TextEditingController _telephoneOController = TextEditingController();
  final TextEditingController _telephoneRController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  late final TextEditingController descriptions = TextEditingController();
  late final TextEditingController warranty = TextEditingController();
  late final TextEditingController gst = TextEditingController();
  late final TextEditingController mobile = TextEditingController();
  late final TextEditingController remark = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _modelKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _customerPriceKey =
  GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormFieldState> _mobileKey = GlobalKey<FormFieldState>();
  final TextEditingController _mobileController = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _descriptionsKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _warrantyKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _gstKey =
  GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState> _countryKey = GlobalKey<FormFieldState>();
  String? selectedCountry;
  List<String> countryList = ['India', 'United States', 'Canada', 'United Kingdom', 'Australia']; // You can expand this list

  final GlobalKey<FormFieldState> _nameKey = GlobalKey<FormFieldState>();
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormFieldState> _dobKey = GlobalKey<FormFieldState>();
  final TextEditingController _dobController = TextEditingController();



  bool isButtonEnabled = false;

  String? selectedProductCategory;
  String? selectedDayTypes;
  String? selectedDomain;
  String? selectedBrand;

  var profileUpdate = false;
  bool isModelFieldFocused = false;
  bool isCustomerPriceFieldFocused = false;
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
  final ImagePicker _imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';
  List<int> profileImage = [];
  List<int> Images = [];
  final GlobalKey<FormFieldState> _cityKey = GlobalKey<FormFieldState>();
  String? selectedCity;
  List<String> cityList = ['Delhi', 'Mumbai', 'Bangalore', 'Kolkata', 'Chennai']; // Add your cities


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
  void _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      // Format the date to dd-MM-yyyy
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      setState(() {
        remark.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

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
                  key: formKey,
                  onChanged: () {
                    if ( selectedProductCategory != null &&
                        selectedProductCategory!.isNotEmpty &&
                        ValidatorUtils.isValidTransactionDate(remark.text) &&

                        ValidatorUtils.isValidCommon(customerPrice.text) &&
                        ValidatorUtils.isValidCommon(gst.text) &&
                        ValidatorUtils.isValidCommon(descriptions.text)
                    ) {
                      setState(() {
                        isButtonEnabled = true;
                      });
                    } else {
                      setState(() {
                        isButtonEnabled = false;
                      });
                    }
                


                    if (isWarrantyFieldFocused == true) {
                      _warrantyKey.currentState!.validate();
                    } if (isCustomerPriceFieldFocused == true) {
                      _customerPriceKey.currentState!.validate();
                    } if (isGstFieldFocused == true) {
                      _gstKey.currentState!.validate();
                    } if (isDescriptionFieldFocused == true) {
                      _descriptionsKey.currentState!.validate();
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
                                          color: AppColors.appSky,
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
                                         Icons.edit_outlined,
                                        color: AppColors.appSky,
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
                        "Name",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _nameKey,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Name",
                          ),
                          onChanged: (val) {
                            // Validate only this field on change
                            _nameKey.currentState?.validate();
                          },
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Select Gender",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _genderKey,
                          value: selectedGender,
                          isExpanded: true,
                          hint: const Text(
                            "Select Gender",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: genderList.map((gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                            _genderKey.currentState?.validate();
                          },
                          decoration: FormFieldStyle.dropDown.copyWith(
                            errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                          ),
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Date of Birth",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _dobKey,
                          controller: _dobController,
                          readOnly: true,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Select Date of Birth",
                            suffixIcon: const Icon(Icons.calendar_today, size: 20),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              String formattedDate = "${pickedDate.day.toString().padLeft(2, '0')}/"
                                  "${pickedDate.month.toString().padLeft(2, '0')}/"
                                  "${pickedDate.year}";
                              setState(() {
                                _dobController.text = formattedDate;
                              });
                              _dobKey.currentState?.validate();
                            }
                          },
                     validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Email",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _emailKey,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Email",
                          ),
                          onChanged: (val) {
                            // Validate only this field on change
                            _emailKey.currentState?.validate();
                          },
                          validator: (value) =>ValidatorUtils.emailValidator(value),
                        ),
                      ),


                      Text(
                        "Select Designation/Profession",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _designationKey,
                          value: selectedDesignation,
                          isExpanded: true,
                          hint: const Text(
                            "Select Designation",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: designationList.map((designation) {
                            return DropdownMenuItem<String>(
                              value: designation,
                              child: Text(
                                designation,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedDesignation = newValue;
                            });
                            _designationKey.currentState?.validate();
                          },
                          decoration: FormFieldStyle.dropDown.copyWith(
                            errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                          ),
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Institution Affiliation",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _institutionKey,
                          controller: _institutionController,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Institution Affiliation",
                          ),
                          onChanged: (val) {
                            _institutionKey.currentState?.validate();
                          },
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Select Country",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _countryKey,
                          value: selectedCountry,
                          isExpanded: true,
                          hint: const Text(
                            "Select Country",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: countryList.map((country) {
                            return DropdownMenuItem<String>(
                              value: country,
                              child: Text(
                                country,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCountry = newValue;
                            });
                            _countryKey.currentState?.validate();
                          },
                          decoration: FormFieldStyle.dropDown.copyWith(
                            errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                          ),
                          validator: ValidatorUtils.model,
                        ),
                      ),

                      Text(
                        "Select City",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _cityKey,
                          value: selectedCity,
                          isExpanded: true,
                          hint: const Text(
                            "Select City",
                            style: FTextStyle.formhintTxtStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: cityList.map((city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(
                                city,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCity = newValue;
                            });
                            _cityKey.currentState?.validate();
                          },
                          decoration: FormFieldStyle.dropDown.copyWith(
                            errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                          ),
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Address for Correspondence",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _addressKey,
                          controller: _addressController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Full Address",
                          ),
                          onChanged: (val) {
                            _addressKey.currentState?.validate();
                          },
                          validator: ValidatorUtils.model,
                        ),
                      ),

                      Text(
                        "Telephone (O)",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _telephoneOKey,
                          controller: _telephoneOController,
                          keyboardType: TextInputType.phone,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Office Telephone Number",
                          ),
                          onChanged: (val) {
                            _telephoneOKey.currentState?.validate();
                          },
                          validator:ValidatorUtils.model,
                        ),
                      ),

                      Text(
                        "Telephone (R)",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _telephoneRKey,
                          controller: _telephoneRController,
                          keyboardType: TextInputType.phone,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Residence Telephone Number",
                          ),
                          onChanged: (val) {
                            _telephoneRKey.currentState?.validate();
                          },
                          validator: ValidatorUtils.model,
                        ),
                      ),

                      Text(
                        "Mobile Number",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _mobileKey,
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10, // Assuming 10-digit Indian number
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Mobile Number",
                            counterText: '', // Hides the default character counter
                          ),
                          onChanged: (val) {
                            _mobileKey.currentState?.validate();
                          },
                          validator: ValidatorUtils.model,
                        ),
                      ),


                      Text(
                        "Website Link",
                        style: FTextStyle.SubHeadingTxtStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _websiteKey,
                          controller: _websiteController,
                          keyboardType: TextInputType.url,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "Enter Website URL",
                          ),
                          onChanged: (val) {
                            _websiteKey.currentState?.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter website link';
                            } else if (!Uri.tryParse(value)!.hasAbsolutePath ?? true) {
                              return 'Enter a valid URL';
                            }
                            return null;
                          },
                        ),
                      ),




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
                      if (formKey.currentState!.validate()) {


                        Navigator.pop(context);

                        // print("Form is valid, proceed with submission.");
                      } else {
                        // Form is invalid
                        // print("Form is invalid, please fill all required fields.");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.appSky,
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
