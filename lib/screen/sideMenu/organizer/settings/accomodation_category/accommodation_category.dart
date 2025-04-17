import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class AccommodationCategory extends StatefulWidget {
  const AccommodationCategory({super.key});

  @override
  State<AccommodationCategory> createState() => _AccommodationCategoryState();
}

class _AccommodationCategoryState extends State<AccommodationCategory> {
 List<Map<dynamic,String>> list=[
{
  "title":"18th Indian Science Communication Congress (ISCC-2018)",
  "accomandation":""
},
{

 }

];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Accommodation Category',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
