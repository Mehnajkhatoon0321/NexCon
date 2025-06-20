import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class AttendanceConfirmationScreen extends StatefulWidget {
  final String userName;
  final String userId;

  const AttendanceConfirmationScreen({
    super.key,
    required this.userName,
    required this.userId,
  });

  @override
  State<AttendanceConfirmationScreen> createState() => _AttendanceConfirmationScreenState();
}

class _AttendanceConfirmationScreenState extends State<AttendanceConfirmationScreen> {
  late String formattedDate;
  late String formattedTime;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    formattedDate = DateFormat('d MMM yyyy').format(now);
    formattedTime = DateFormat('hh:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Attendance Confirmation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 10,
            color: AppColors.cardColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    'Attendance Marked',
                    style: FTextStyle.heading,
                  ),
                  const SizedBox(height: 24),
                  buildRow('👤 Name', widget.userName),
                  const SizedBox(height: 10),
                  buildRow('🆔 User ID', widget.userId),
                  const SizedBox(height: 10),
                  buildRow('📅 Date', formattedDate),
                  const SizedBox(height: 10),
                  buildRow('⏰ Time', formattedTime),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [AppColors.appSky, AppColors.secondaryColour],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: const Size(120, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                        child: Text(
                          "Done",
                          style: FTextStyle.loginBtnStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: FTextStyle.style.copyWith(color: Colors.grey[700]),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: FTextStyle.subtitle,
          ),
        ),
      ],
    );
  }
}
