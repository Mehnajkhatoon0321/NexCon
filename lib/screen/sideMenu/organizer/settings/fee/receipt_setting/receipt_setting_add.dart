import 'package:flutter/material.dart';
import 'package:nexcon/utils/form_field_style.dart';

import '../../../../../../utils/colours.dart';
import '../../../../../../utils/font_text_Style.dart';
class ReceiptSettingAdd extends StatefulWidget {
  String isEdit;
   ReceiptSettingAdd({required this.isEdit,super.key});

  @override
  State<ReceiptSettingAdd> createState() => _ReceiptSettingAddState();
}

class _ReceiptSettingAddState extends State<ReceiptSettingAdd> {
  late final FocusNode _conferenceFocusNode = FocusNode();
  final GlobalKey<FormFieldState<String>> conferenceCategoryKey = GlobalKey<FormFieldState<String>>();

  String? selectedConference;
  bool isButtonEnabled=false;
  final List<String> conferenceOptions = ['TechConf 2025', 'HealthSummit', 'EduExpo'];
  final TextEditingController _conferenceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                _conferenceController.text.isNotEmpty ;

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

              /// Delegate Category Dropdown

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
