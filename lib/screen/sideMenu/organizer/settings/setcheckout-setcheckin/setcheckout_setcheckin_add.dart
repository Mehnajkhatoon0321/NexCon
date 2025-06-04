import 'package:flutter/material.dart';

import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';

class SetCheckoutSetCheckInAdd extends StatefulWidget {
  String isEdit;
   SetCheckoutSetCheckInAdd({ required this.isEdit,super.key});

  @override
  State<SetCheckoutSetCheckInAdd> createState() => _SetCheckoutSetCheckInAddState();
}
class _SetCheckoutSetCheckInAddState extends State<SetCheckoutSetCheckInAdd> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? conferenceCategoryTitleName;

  List<String> conferenceTitleName = [
    '4th International Science Communication Conference',
    '5th International Tech & Innovation Summit',
  ];

  final GlobalKey<FormFieldState<String>> _conferenceCategoryKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _hotelNameKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _checkInKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _checkOutKey = GlobalKey<FormFieldState<String>>();

  final TextEditingController _hotelNameController = TextEditingController();
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();

  @override
  void dispose() {
    _hotelNameController.dispose();
    _checkInController.dispose();
    _checkOutController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller, GlobalKey<FormFieldState<String>> key) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final formattedTime = selectedTime.format(context);
      setState(() {
        controller.text = formattedTime;
        key.currentState?.validate();  // Validate this field on time select
      });
    }
  }

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a conference category';
    }
    return null;
  }

  String? _validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.isEdit.isNotEmpty ? "Edit Check-In" : "Create Check-Out",
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),

                Text(
                  "Select Conference Category",
                  style: FTextStyle.SubHeadingTxtStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DropdownButtonFormField<String>(
                    key: _conferenceCategoryKey,
                    value: conferenceCategoryTitleName,
                    isExpanded: true,
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
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        conferenceCategoryTitleName = newValue;
                      });
                      // Validate only this dropdown on change
                      _conferenceCategoryKey.currentState?.validate();
                    },
                    decoration: FormFieldStyle.dropDown.copyWith(
                      errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
                    ),
                    validator: _validateDropdown,
                  ),
                ),



                Text(
                  "Check In",
                  style: FTextStyle.SubHeadingTxtStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _checkInKey,
                    controller: _checkInController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "00:00 PM",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.access_time_outlined, color: Colors.grey),
                        onPressed: () => _selectTime(context, _checkInController, _checkInKey),
                      ),
                    ),
                    validator: (value) => _validateNotEmpty(value, 'check-in time'),
                  ),
                ),

                Text(
                  "Check Out",
                  style: FTextStyle.SubHeadingTxtStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _checkOutKey,
                    controller: _checkOutController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "00:00 PM",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.access_time_outlined, color: Colors.grey),
                        onPressed: () => _selectTime(context, _checkOutController, _checkOutKey),
                      ),
                    ),
                    validator: (value) => _validateNotEmpty(value, 'check-out time'),
                  ),
                ),

                const SizedBox(height: 20),

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
                        // Validate entire form on submit button pressed
                        if (formKey.currentState!.validate()) {
                          // All validations passed, proceed
                          Navigator.pop(context);
                        } else {
                          // Errors will show for all invalid fields
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: const Size(93, 32),
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
      ),
    );
  }
}




