import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/utils/colours.dart';


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


  // static Future<void> selectDateAndTime(BuildContext context, TextEditingController dateController) async {
  //   DateTime currentDate = DateTime.now();
  //   DateTime? selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: currentDate,
  //     firstDate: DateTime(1900),
  //     lastDate: currentDate, // Prevent future date selection
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData(
  //           primaryColor: AppColors.primaryColour, // Date selection color
  //           buttonTheme: ButtonThemeData(
  //             textTheme: ButtonTextTheme.primary,
  //           ),
  //           dialogBackgroundColor: Colors.white, // Dialog background color
  //           textTheme: TextTheme(
  //             bodyLarge: TextStyle(color: Colors.black), // Calendar text color
  //             bodyMedium: TextStyle(color: Colors.black),
  //             titleLarge: TextStyle(color: AppColors.primaryColour, fontSize: 20), // Header text style
  //           ),
  //           iconTheme: IconThemeData(color: AppColors.primaryColour),
  //           colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColour), // Icon color (e.g., arrows)
  //         ),
  //         child: child ?? Container(),
  //       );
  //     },
  //   );
  //
  //   if (selectedDate != null) {
  //     // If a date is selected, show the time picker
  //     TimeOfDay? selectedTime = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.now(),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData(
  //             primaryColor: AppColors.primaryColour,
  //             dialogBackgroundColor: Colors.white,
  //             textTheme: TextTheme(
  //               bodyLarge: TextStyle(color: Colors.black),
  //               titleLarge: TextStyle(color: AppColors.primaryColour, fontSize: 20),
  //             ),
  //             iconTheme: IconThemeData(color: AppColors.primaryColour),
  //           ),
  //           child: child ?? Container(),
  //         );
  //       },
  //     );
  //
  //     if (selectedTime != null) {
  //       // Combine the date and time
  //       DateTime selectedDateTime = DateTime(
  //         selectedDate.year,
  //         selectedDate.month,
  //         selectedDate.day,
  //         selectedTime.hour,
  //         selectedTime.minute,
  //       );
  //
  //       // Format the date and time to your desired format, e.g., "yyyy-MM-dd hh:mm a"
  //       String formattedDateTime = DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime);
  //
  //       // Update the TextEditingController with the selected date and time
  //       dateController.text = formattedDateTime;
  //     }
  //   }
  // }
  static Future<void> selectDateAndTime(BuildContext context, TextEditingController dateController) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate, // Prevent future date selection
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primaryColor: AppColors.primaryColour, // Date selection color
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: Colors.white, // Dialog background color
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black), // Calendar text color
              bodyMedium: TextStyle(color: Colors.black),
              titleLarge: TextStyle(color: AppColors.primaryColour, fontSize: 20), // Header text style
            ),
            iconTheme: IconThemeData(color: AppColors.primaryColour),
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColour), // Icon color (e.g., arrows)
          ),
          child: child ?? Container(),
        );
      },
    );

    if (selectedDate != null) {
      // If a date is selected, show the time picker
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primaryColor: AppColors.primaryColour,
              dialogBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
                titleLarge: TextStyle(color: AppColors.primaryColour, fontSize: 20),
              ),
              iconTheme: IconThemeData(color: AppColors.primaryColour),
            ),
            child: child ?? Container(),
          );
        },
      );

      if (selectedTime != null) {
        // Combine the date and time
        DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        // Format the date and time to your desired format, e.g., "yyyy-MM-dd hh:mm a"
        String formattedDateTime = DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime);

        // Update the TextEditingController with the selected date and time
        dateController.text = formattedDateTime;
      }
    }
  }

}
