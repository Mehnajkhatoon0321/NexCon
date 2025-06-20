import 'package:flutter/material.dart';

import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';
class RegistrationFeeAdd extends StatefulWidget {
  String isEdit;
  String title;
   RegistrationFeeAdd({required this.isEdit,required this.title,super.key});

  @override
  State<RegistrationFeeAdd> createState() => _RegistrationFeeAddState();
}

class _RegistrationFeeAddState extends State<RegistrationFeeAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedConference;
  String? selectedCategory;
  String? selectedCurrency;
  bool isButtonEnabled=false;
  late final FocusNode _conferenceFocusNode = FocusNode();
  late final FocusNode _categoryFocusNode = FocusNode();
  late final FocusNode _AmountFocusNode = FocusNode();
  late final FocusNode _CurrencyLimitFocusNode = FocusNode();

  final TextEditingController feeAmountController = TextEditingController();
  final TextEditingController _conferenceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  final List<String> conferenceOptions = ['TechConf 2025', 'HealthSummit', 'EduExpo'];
  final List<String> delegateCategories = ['Student', 'Professional', 'Guest'];
  final List<String> currencyOptions = ['INR', 'USD', 'EUR'];



  final GlobalKey<FormFieldState<String>> currencyKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> categoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> conferenceCategoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> amountKey = GlobalKey<FormFieldState<String>>();

  void initState() {
    super.initState();

    _conferenceFocusNode.addListener(() {
      if (!_conferenceFocusNode.hasFocus) {
        conferenceCategoryKey.currentState?.validate();
      }
    });

    _categoryFocusNode.addListener(() {
      if (!_categoryFocusNode.hasFocus) {
        categoryKey.currentState?.validate();
      }
    });

    _CurrencyLimitFocusNode.addListener(() {
      if (!_CurrencyLimitFocusNode.hasFocus) {
        currencyKey.currentState?.validate();
      }
    });

    _AmountFocusNode.addListener(() {
      if (!_AmountFocusNode.hasFocus) {
        amountKey.currentState?.validate();
      }
    });


  }





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
          'Register Add',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
     body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            final isValid = feeAmountController.text.isNotEmpty &&
                feeAmountController.text.isNotEmpty &&
                selectedConference != null &&
                _conferenceController.text.isNotEmpty &&
                selectedCategory!=null &&
                _categoryController.text.isNotEmpty &&
                _currencyController.text.isNotEmpty &&
                selectedCurrency != null ;

            setState(() {
              isButtonEnabled = isValid;
            });
          },
          child: ListView(
            children: [
              // /// Conference Name Dropdown
              //  Text("Conference Name", style: FTextStyle.SubHeadingTxtStyle),
              // const SizedBox(height: 6),
              // DropdownButtonFormField<String>(
              //   value: selectedConference,
              //   isExpanded: true,
              //   key: conferenceCategoryKey,
              //   hint: const Text("Select Conference", style: FTextStyle.formhintTxtStyle),
              //   items: conferenceOptions.map((conf) {
              //     return DropdownMenuItem<String>(
              //       value: conf,
              //       child: Text(conf, style: const TextStyle(fontSize: 14)),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() => selectedConference = value);
              //     conferenceCategoryKey.currentState?.validate();
              //   },
              //   decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
              //     errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              //     contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              //   ),
              //   validator: (value) => value == null ? "Please select a conference" : null,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FTextStyle.subheading
                ),
              ),
              const SizedBox(height: 16),

              /// Delegate Category Dropdown
               Text("Delegate Category", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                key: categoryKey,
                isExpanded: true,
                hint: const Text("Select Delegate Category", style: FTextStyle.formhintTxtStyle),
                items: delegateCategories.map((cat) {
                  return DropdownMenuItem<String>(
                    value: cat,
                    child: Text(cat, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCategory = val;
                  });
                  categoryKey.currentState?.validate();
                },
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                ),
                validator: ValidatorUtils.model,
              ),

              const SizedBox(height: 16),


              Text("Fee Amount", style: FTextStyle.SubHeadingTxtStyle)
                  ,
              const SizedBox(height: 5),
              TextFormField(
                controller: feeAmountController,
                key: amountKey,
                keyboardType: TextInputType.number,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Enter Discount Value",
                  hintStyle: FTextStyle.formhintTxtStyle, // matching hint style
                  errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                ),
                onChanged: (val) {
                  // Validate only this field on change
                  amountKey.currentState?.validate();
                },
                validator: ValidatorUtils.model,
              ),


              /// Currency Dropdown
               Text("Currency", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: selectedCurrency,
                key: currencyKey,
                isExpanded: true,
                hint: const Text("Select Currency", style: FTextStyle.formhintTxtStyle),
                items: currencyOptions.map((curr) {
                  return DropdownMenuItem<String>(
                    value: curr,
                    child: Text(curr, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedCurrency = value);

                  currencyKey.currentState?.validate();
                },

                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                ),
                validator: ValidatorUtils.model, ),

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
