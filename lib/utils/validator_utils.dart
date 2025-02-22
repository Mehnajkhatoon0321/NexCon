
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/utils/constant.dart';







class ValidatorUtils {

  static bool isValidEmailOrUsername(String value) {
    // Check if it's a valid email address
    if (isValidEmail(value)) {
      return true; // Valid email
    }

    // Check if it's a valid username
    if (value.isNotEmpty && value.length >= 3) {
      return true; // Valid username (non-empty and at least 3 characters)
    }

    return false; // Invalid email or username
  }
static   bool isValidPass(String pass) {
  // Check if the password is not empty and at least 8 characters long
  if (pass.isEmpty || pass.length < 8) {
    return false; // Invalid password
  }
  return true; // Valid password
}


  static bool isValidEmail(String email) {
    if (email.length > 254) {
      return false; // email address too long
    }

    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
    );

    if (!regex.hasMatch(email)) {
      return false; // invalid email format
    }


    List<String> parts = email.split('@');

    if (parts.length != 2 || parts[0].isEmpty || parts[1].isEmpty) {
      return false; // email should contain one @ symbol and non-empty parts
    }

    if (parts[0].length > 64) {
      return false; // local part before @ should not exceed 64 characters
    }

    if (parts[1].length > 255) {
      return false; // domain part after @ should not exceed 255 characters
    }

    return true;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email field cannot be empty';
    }

    if (!isValidEmail(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? model(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill the field.';
    }
    if (value.length < 3 || value.length > 60) {
      return "Please write field must be between 3 and 60 characters.";
    }


    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.trim().split(' ').length < 2) {
      return Constants.name1;
    }
    if (value.length < 3 || value.length > 60) {
      return Constants.name2;
    }
    return null;
  }

  static String? weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.weight;
    }

    return null;
  }



  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.nullAddressField;
    } else if (value.length < 10 || value.length > 200) {
      return Constants.lengthAddressField;
    } else {
      return null;
    }
  }

  static String confirmPassValidator(String pass, String confirmPass) {
    if (confirmPass.isEmpty) {
      return Constants.nullField;
    } else if (confirmPass != pass) {
      return Constants.confirmPassError;
    } else {
      return "";
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.nullField;
    }
    // Password strength validation
    if (value.length < 8) {
      return Constants.lengtherror;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return Constants.uppercaseError;
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return Constants.lowercaseError;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return Constants.numberError;
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return Constants.specialChaacterError;
    } else {
      return null;
    }
  }



  //firstName


  static bool _isValidNameFormat(String value) {
    final nameRegExp = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    return nameRegExp.hasMatch(value);
  }
  static String? firstNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Constants.firstNameRequired;
    }
    if (value.length < 3 || value.length > 60) {
      return Constants.firstNameLength;
    }
    if (!_isValidNameFormat(value)) {
      return Constants.firstNameInvalid;
    }
    return null;
  }

  static String? lastNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Constants.lastNameRequired;
    }
    if (value.length < 3 || value.length > 60) {
      return Constants.lastNameLength;
    }
    if (!_isValidNameFormat(value)) {
      return Constants.lastNameInvalid;
    }
    return null;
  }
static  String? pincodeValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Constants.pincodeRequired;
    }

    // Check if the pin code contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return Constants.pincodeInvalid;
    }

    if (value.length < 4 || value.length > 8) {
      return Constants.pincodeLength;
    }

    // The pin code is valid
    return null;
  }

  //>>>>>>>>>>>>>>>>>>isValid
//first name

  static bool isValidFirstName(String value) {
    // Check if the value is null or empty
    if (value.isEmpty) {
      return false;
    }
    // Check if the length of the first name is between 3 and 60 characters
    if (value.length < 3 || value.length > 60) {
      return false;
    }
    // Check if the first name contains only valid characters
    if (!_isValidNameFormat(value)) {
      return false;
    }
    // The first name is valid
    return true;
  }

  static bool isValidLastName(String value) {
    // Check if the value is null or empty
    if (value.isEmpty) {
      return false;
    }
    // Check if the length of the last name is between 3 and 60 characters
    if (value.length < 3 || value.length > 60) {
      return false;
    }
    // Check if the last name contains only valid characters
    if (!_isValidNameFormat(value)) {
      return false;
    }
    // The last name is valid
    return true;
  }

  static bool isValidPassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Password length validation
    if (value.length < 8) {
      return false;
    }
    // Password contains at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    // Password contains at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    // Password contains at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    // Password contains at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }
    // Password meets all criteria
    return true;
  }

  static bool isValidName(String value) {
    // Check if the value is null or empty
    if (value.isEmpty) {
      return false;
    }
    // Check if the full name has at least two parts (first name and last name)
    if (value.trim().split(' ').length < 2) {
      return false;
    }
    // Check if the length of the full name is between 3 and 60 characters
    if (value.length < 3 || value.length > 60) {
      return false;
    }
    // The full name is valid
    return true;
  }

static  bool isValidAddress(String value) {
    // Check if the value is null or empty
    if (value.isEmpty) {
      return false;
    }

    // Check if the length of the address is between 10 and 200 characters
    if (value.length < 10 || value.length > 200) {
      return false;
    }

    // The address is valid
    return true;
  }

  static bool isValidPincode(String value) {
    // Check if the value is null or empty
    if (value.isEmpty) {
      return false;
    }
    // Check if the value contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return false;
    }
    // Check if the length of the pincode is between 4 and 8 characters (adjust as per your requirement)
    if (value.length < 4 || value.length > 8) {
      return false;
    }
    // The pincode is valid
    return true;
  }

  static bool isValidPhone(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Check if the length of the phone number is at least 8 digits
    if (value.length < 8) {
      return false;
    }
    return true;
  }

  static bool isValidConfirmPassword(String pass, String confirmPass) {
    if (confirmPass.isEmpty || pass != confirmPass) {
      return false;
    }
    return true;
  }

  static bool isValidCommon(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Check if the length of the phone number is at least 8 digits

    return true;
  }





  static Future<DateTime?> selectDate(
      BuildContext context, DateTime? selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      return picked;
    }
    return null;
  }
  static String? phoneNumberValidator(String? value) {
    // Check if the value is empty
    if (value == null || value.isEmpty) {
      return "Phone number cannot be empty";
    }

    // Regular expression for phone number validation (adjust as needed for your country's format)
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');  // International format with optional '+' and 1-15 digits

    // Validate the phone number format
    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid phone number";
    }

    return null;
  }
  static String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date.';
    }

    try {
      // Try parsing the date using the expected format
      final DateTime parsedDate = DateFormat('yyyy-MM-dd').parseStrict(value);

    } catch (e) {
      return 'Invalid date format. Use yyyy-MM-dd.';
    }

    return null;
  }
  //Contact us validation
  static String? messageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Message field cannot be empty";
    }
    if (value.length > 60) {
      return "Message length cannot more then 60";
    }
    return null;
  }
  static String? transactionIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Transaction ID cannot be empty";
    }
    if (value.length != 10) {
      return "Transaction ID must be exactly 10 characters";
    }
    return null;
  }
  static String? transactionNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Transaction Number cannot be empty";
    }
    if (value.length != 10) {
      return "Check if the transaction number has exactly 10 digits and is numeric";
    }
    return null;
  }

  // Validate Amount (it should be greater than 0)
  static String? amountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Amount cannot be empty";
    }
    final double? amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return "Amount must be a positive number greater than zero";
    }
    return null;
  }
  static String? bankNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Bank name cannot be empty";
    }
    if (value.length < 2) {
      return "Bank name must be at least 2 characters long";
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return "Bank name can only contain letters and spaces";
    }
    return null;
  }

  static String? couponCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Coupon code cannot be empty";
    }
    if (value.length < 5) {
      return "Coupon code must be at least 5 characters long";
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return "Coupon code can only contain letters and numbers";
    }
    return null;
  }

  // Validate Transaction Date (it should not be empty and must be a valid date)
  static String? transactionDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Transaction date cannot be empty";
    }
    // Check if the date format is valid (simple example using DateTime parsing)
    try {
      DateTime.parse(value);
    } catch (e) {
      return "Invalid date format. Please use YYYY-MM-DD.";
    }
    return null;
  }
  static bool isValidTransactionId(String transactionId) {
    // Check if the transaction ID is empty or does not have exactly 10 characters
    if (transactionId.isEmpty || transactionId.length != 10) {
      return false;
    }
    return true;
  }

  // Validate Amount (it should be greater than 0)
  static bool isValidAmount(String amount) {
    if (amount.isEmpty) {
      return false;
    }
    final double? parsedAmount = double.tryParse(amount);
    // Check if the parsed amount is valid and greater than 0
    if (parsedAmount == null || parsedAmount <= 0) {
      return false;
    }
    return true;
  }
  static bool isValidBankName(String bankName) {
    if (bankName.isEmpty) {
      return false;
    }
    // Check if the bank name contains only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(bankName)) {
      return false;
    }
    // Check if the bank name is at least 2 characters long
    if (bankName.length < 2) {
      return false;
    }
    return true;
  }
  static bool isValidCouponCode(String couponCode) {
    if (couponCode.isEmpty) {
      return false;
    }
    // Check if the coupon code contains only alphanumeric characters and is at least 5 characters long
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(couponCode)) {
      return false;
    }
    // Check if the coupon code is at least 5 characters long
    if (couponCode.length < 5) {
      return false;
    }
    return true;
  }

  // Validate Transaction Date (it should not be empty and must be a valid date)
  static bool isValidTransactionDate(String transactionDate) {
    if (transactionDate.isEmpty) {
      return false;
    }
    // Check if the date is valid by trying to parse it
    try {
      DateTime.parse(transactionDate);
    } catch (e) {
      return false;
    }
    return true;
  }

  // Validate Transaction Number (it should be numeric and exactly 10 digits)
  static bool isValidTransactionNumber(String transactionNumber) {
    if (transactionNumber.isEmpty) {
      return false;
    }
    // Check if the transaction number has exactly 10 digits and is numeric
    if (transactionNumber.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(transactionNumber)) {
      return false;
    }
    return true;
  }
  static bool isValidMessage(String message) {
    if (message.isEmpty) {
      return false;
    }
    if (message.length > 60) {
      return false;
    }

    return true;
  }
  static String? uploadValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Upload file is required';
    }
    return null;
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
static  String? emailOrUsernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email or username';
    }

    // Check if it's a valid email
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (emailRegex.hasMatch(value)) {
      return null; // It's a valid email
    }

    // Check if it's a valid username (for example, at least 3 characters)
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }

    return null; // It's a valid username
  }


  static String? weightValidatorDoc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your weight';
    } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Please enter a valid weight';
    }
    return null;
  }
}
