import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';

class SubmitBankTransferDetails extends StatefulWidget {
  const SubmitBankTransferDetails({super.key});

  @override
  State<SubmitBankTransferDetails> createState() => _SubmitBankTransferDetailsState();
}

class _SubmitBankTransferDetailsState extends State<SubmitBankTransferDetails> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _transactionNumberController = TextEditingController();
  final _validFromController = TextEditingController();
  final _originatingBankController = TextEditingController();
  final _amountController = TextEditingController(text: "650");
  final _accountNumberController = TextEditingController();
  final uploadName = TextEditingController();

  // Keys & FocusNodes
  final validFromKey = GlobalKey<FormFieldState<String>>();
  final _uploadNameKey = GlobalKey<FormFieldState<String>>();
  final _uploadNameNode = FocusNode();

  final _transactionNumberKey = GlobalKey<FormFieldState<String>>();

  final _originatingBankKey = GlobalKey<FormFieldState<String>>();
  final _amountKey = GlobalKey<FormFieldState<String>>();
  final _accountNumberKey = GlobalKey<FormFieldState<String>>();


  // Upload state
  File? imagesId;
  String? fileName1;
  bool isImageUploaded = false;

  @override
  void dispose() {
    _transactionNumberController.dispose();
    _validFromController.dispose();
    _originatingBankController.dispose();
    _amountController.dispose();
    _accountNumberController.dispose();
    uploadName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        title: Text("Pay Offline Details", style: FTextStyle.HeadingTxtWhiteStyle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Submit Wire/Bank Transfer Details",style: FTextStyle.subheading,),
            SizedBox(height: 20,),
              Text("Transaction Number", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
               TextFormField( style: const TextStyle(color: Colors.black),
                key: _transactionNumberKey,
                controller: _transactionNumberController,
                keyboardType: TextInputType.text,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Transaction Number",
                ),
                onChanged: (value) {
                  _transactionNumberKey.currentState?.validate();
                },
                validator: ValidatorUtils.model,
              ),

              const SizedBox(height: 12),

              // Date of Transfer
              Text("Date of Transfer", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
               TextFormField( style: const TextStyle(color: Colors.black),
                key: validFromKey,
                controller: _validFromController,
                readOnly: true,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Select Date",
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select a date.";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Originating Bank
              Text("Originating Bank", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
               TextFormField( style: const TextStyle(color: Colors.black),
                key: _originatingBankKey,
                controller: _originatingBankController,
                keyboardType: TextInputType.text,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Originating Bank",
                ),
                onChanged: (value) {
                  _originatingBankKey.currentState?.validate();
                },
                validator: ValidatorUtils.model,
              ),

              const SizedBox(height: 12),

              // Transferred Amount
              Text("Transferred Amount with GST", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
               TextFormField( style: const TextStyle(color: Colors.black),
                key: _amountKey,
                controller: _amountController,
                keyboardType: TextInputType.number,
                readOnly: true,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Amount with GST",
                ),
                validator: ValidatorUtils.model,
              ),

              const SizedBox(height: 12),

              // Bank Account Number
              Text("Bank Account Number", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
               TextFormField( style: const TextStyle(color: Colors.black),
                key: _accountNumberKey,
                controller: _accountNumberController,
                keyboardType: TextInputType.number,
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                  hintText: "Bank Account Number",
                ),
                onChanged: (value) {
                  _accountNumberKey.currentState?.validate();
                },

                validator: ValidatorUtils.model,
              ),

              const SizedBox(height: 12),

              // Upload Receipt
              Text("Bank Receipt of Amount Transferred", style: FTextStyle.SubHeadingTxtStyle),
              const SizedBox(height: 6),
               TextFormField( style: const TextStyle(color: Colors.black),
                readOnly: true,
                key: _uploadNameKey,
                focusNode: _uploadNameNode,
                controller: uploadName,
                decoration: FormFieldStyle.dropDown.copyWith(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please upload receipt.";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 45),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: AppColors.appSky,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            contentPadding: const EdgeInsets.all(20),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.check_circle, color: Colors.green, size: 60),
                                SizedBox(height: 16),
                                Text(
                                  "Thank you!",
                                  style: FTextStyle.subheading,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Form submitted successfully.",
                                  style: FTextStyle.style,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),


                          );
                        },
                      );

                      // Clear all fields
                      _transactionNumberController.clear();
                      _validFromController.clear();
                      _originatingBankController.clear();
                      _amountController.text = "0";
                      _accountNumberController.clear();
                      uploadName.clear();
                      imagesId = null;
                      fileName1 = null;
                    }
                  },

                  child: Text("Submit", style: FTextStyle.loginBtnStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


