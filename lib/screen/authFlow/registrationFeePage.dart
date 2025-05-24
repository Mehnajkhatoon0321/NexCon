import 'package:flutter/material.dart';

import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class RegistrationFeePage extends StatefulWidget {
  @override
  _RegistrationFeePageState createState() => _RegistrationFeePageState();
}

class _RegistrationFeePageState extends State<RegistrationFeePage> {
  final List<Map<String, String>> feeData = [
    {"Delegate Category": "Fee Amount"},
    {"Delegate from Academia (Member)": "Indian Rupee (INR)6000"},
    {"Delegate from Academia (Non-Member)": "Indian Rupee (INR)6500"},
    {"Research Student (Member)": "Indian Rupee (INR)5000"},
    {"Research Student (Non-Member)": "Indian Rupee (INR)5500"},
    {"Delegate from Industry (Member)": "Indian Rupee (INR)10000"},
    {"Delegate from Industry (Non-Member)": "Indian Rupee (INR)10000"},
    {"Foreign/ NRI Delegate (Member)": "U.S. dollar (\$)300"},
    {"Foreign/ NRI Delegate (Non-Member)": "U.S. dollar (\$)300"},
    {"Foreign/ NRI Research Student (Member)": "U.S. dollar (\$)250"},
    {"Foreign/ NRI Research Student (Non-Member)": "U.S. dollar (\$)250"},
    {"Accompanying Person": "Indian Rupee (INR)3000"},
    {"Foreign/ NRI Accompanying Person": "U.S. dollar (\$)200"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Registration Fee',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 4),
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(color: Colors.black54),
            columnWidths: const {
              0: FlexColumnWidth(2.5),
              1: FlexColumnWidth(2.5),
            },
            children: feeData.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value.keys.first;
              final fee = entry.value.values.first;

              // Apply bold style for the first row (header)
              final isHeader = index == 0;

              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category,
                      style:FTextStyle.subtitle
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      fee,
                     style:FTextStyle.subtitle
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),

    );
  }
}
