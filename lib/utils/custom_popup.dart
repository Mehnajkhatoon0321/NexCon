import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_conference/utils/colours.dart';

class CustomPopUp {
  // Static method to select a date with custom calendar colors
  static Future<void> selectDate(BuildContext context, TextEditingController dateController) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate, // Prevent future date selection
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primaryColor: AppColors.appSky, // Date selection color
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: Colors.white, // Dialog background color
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black), // Calendar text color
              bodyMedium: TextStyle(color: Colors.black),
              titleLarge: TextStyle(color: AppColors.appSky, fontSize: 20), // Header text style
            ),
            iconTheme: IconThemeData(color: AppColors.appSky), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.appSky), // Icon color (e.g., arrows)
          ),
          child: child ?? Container(),
        );
      },
    );

    if (selectedDate != null) {
      // Format the date to yyyy-MM-dd
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

      // Update the TextEditingController with the selected date
      dateController.text = formattedDate;
    }
  }
}
