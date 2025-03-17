import 'package:flutter/material.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../../../../../utils/commonFunction.dart';
class RegistrationFee extends StatefulWidget {
  const RegistrationFee({super.key});

  @override
  State<RegistrationFee> createState() => _RegistrationFeeState();
}

class _RegistrationFeeState extends State<RegistrationFee> {
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType
        .toString()
        .split('.')
        .last;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(title: Text("Registration Fee"),),
     
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("")

          ],
        ),
      ),
    );
  }
}
