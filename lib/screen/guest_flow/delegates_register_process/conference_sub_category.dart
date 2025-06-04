import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/authFlow/delegate_register.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/pref_utils.dart';

import 'conference_category_details.dart';

class SubCategoryScreen extends StatefulWidget {
final   String id;
final  String  name;
final String selected;
   const SubCategoryScreen({super.key,required this.id,required this.name,required this.selected});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  List<Map<String, dynamic>> FeaturesList = [
    {
      "id":"1",
      "upComing": "Chemistry",
      "imageConference": "assets/images/IndianConferences.png",
      "title": "30th ISCB International Conference (ISCBC-2025)",
      "subtitle":
      "Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Indian Society of Chemists and Biologists",
    },
    {
      "id":"2",
      "upComing": "Science Communication",
      "imageConference": "assets/images/conferencesOrganization1.png",
      "title": "Global Science Summit 2025",
      "subtitle":
      "Theme: Innovations in Science and Technology for a Sustainable Future 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Global Science Network",
    },
    {
      "id":"3",
      "upComing": "Chemistry",
      "imageConference": "assets/images/IndianConferences.png",
      "title": "30th ISCB International Conference (ISCBC-2025)",
      "subtitle":
      "Theme: Current Trends in Chemical, Biological and Pharmaceutical Sciences: Impact on Health and Environment 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Indian Society of Chemists and Biologists",
    },
    {
      "id":"4",
      "upComing": "Science Communication",
      "imageConference": "assets/images/conferencesOrganization1.png",
      "title": "Global Science Summit 2025",
      "subtitle":
      "Theme: Innovations in Science and Technology for a Sustainable Future 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Global Science Network",
    },
  {
      "id":"5",
      "upComing": "Science Communication",
      "imageConference": "assets/images/conferencesOrganization1.png",
      "title": "Global Science Summit 2025",
      "subtitle":
      "Theme: Innovations in Science and Technology for a Sustainable Future 2025-01-27 to 2025-01-29 ",
      "organizationImage": "assets/images/conferencesOrganization.png",
      "organizationText": "Global Science Network",
    },


  ];
  String searchQuery = "";
  bool _isTextEmpty = true;
  final TextEditingController controllerText = TextEditingController();
  bool isLoggedIn = PrefUtils.getIsLogin();
  String roleSelection = PrefUtils.getRoleSelection();
  void _clearText() {
    controllerText.clear();
    setState(() {
      _isTextEmpty = true;
      // data.clear();
      // pageNo = 1;
      // hasMoreData = true;
      // totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
  }
  Timer? _debounce;
  void _onSearchChanged(String value) {
    setState(() {
      _isTextEmpty = value.isEmpty;
      searchQuery = value;
    });

    // Cancel the previous timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Start a new timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // pageNo=1;
      // // Call the API only after the user has stopped typing for 500 milliseconds
      // BlocProvider.of<AllRequesterBloc>(context).add(
      //     GetBillingListHandler(searchQuery, pageNo, pageSize));
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
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
          'Conference SubCategory',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.white,
      backgroundColor: AppColors.formFieldBackColour,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: controllerText,
                  decoration: FormFieldStyle.searchDecoration.copyWith(
                    suffixIcon: _isTextEmpty
                        ? const Icon(Icons.search,
                        color: AppColors.appSky)
                        : IconButton(
                      icon: const Icon(Icons.clear,
                          color: AppColors.appSky),
                      onPressed: _clearText,
                    ),
                  ),
                  onChanged:_onSearchChanged,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(

               // Enable scroll for the GridView if necessary
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.73,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 5// Two columns
                ),
                itemCount: FeaturesList.length,

                itemBuilder: (context, index) {
                  final conference = FeaturesList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(


                       // height: height * 0.45, // Set fixed height for each card
                      // width: height * 0.3, // Set fixed width for each card
                      decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight:Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  conference["imageConference"],
                                  height: height * 0.10, // Set image height to half of the card
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 4,
                                child: Container(
                                  width: width/4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(60),
                                      bottomRight: Radius.circular(60),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      conference["upComing"],
                                      style: FTextStyle.listTitle.copyWith(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.4,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: Text(
                                      conference["title"],
                                      style: FTextStyle.listTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: Text(
                                      conference["subtitle"],
                                      style: FTextStyle
                                          .listTitleSub
                                          .copyWith(fontSize: 13),
                                      maxLines: 3,
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ConferenceCategoryDetails(selectedRole: widget.selected,),
                                            ),
                                          );

                            },
                                        child: Text(
                                          "View",
                                          style: FTextStyle.loginBtnStyle.copyWith(fontSize: 13,color: Colors.blue,),
                                        ),
                                      ),


                                      ElevatedButton(
                                        onPressed: () {


                                          if (isLoggedIn==true) {
                                            _showEditDialog(
                                              context,
                                              conference['id'].toString(), // Pass the selected ID for identification
                                                  () {
                                                // Refresh callback after the dialog is closed
                                                print("Dialog Closed, Refresh Callback");
                                                print("loginStatus ${PrefUtils.getIsLogin()}");
                                              },
                                              conference['category'], // Initial category
                                            );
                                          }
                                          else {
                                            print('Not Logged In');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DelegateRegister(
                                                  title: conference["title"],
                                                  selectedRole: widget.selected,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          backgroundColor: AppColors.appSky,
                                          elevation: 2,
                                          minimumSize: const Size(80, 30),
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                        ),
                                        child: Text(
                                          "Register",
                                          style: FTextStyle.loginBtnStyle.copyWith(fontSize: 12),
                                        ),
                                      )


                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
  void _showEditDialog(
      BuildContext context,
      String selectedIds, // Pass the selected ID for identifying the category
      Function refreshCallback,
      String? initialCategory, // Pass the initial category, allowing null
      )
  {
    final formKey = GlobalKey<FormState>();
    String? selectedCategory = initialCategory;

    // Ensure the category list has unique values
    final List<String> uniqueCategoryList = [
      ...Set<String>.from(Constants.categoryName)
    ];

    bool isButtonEnabled = uniqueCategoryList.isNotEmpty;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: const Text(
                "Register Delegate",
                style: FTextStyle.subheading,
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose a Category",
                          style:FTextStyle.subtitle,
                        ),
                        const SizedBox(height: 12),
                        // Dropdown for Category Selection
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          hint: Text(
                            "Select a category",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          items: uniqueCategoryList.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 200), // Set maximum width
                                child: Text(
                                  category,
                                  style: FTextStyle.style,
                                  // overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue; // Update selected value
                              isButtonEnabled = true; // Always enable when dropdown is not empty
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select a category.";
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      child: Text(
                        "Cancel",
                        overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                        softWrap: true, // Enable text wrapping

                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    // Update Button
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () async {
                        if (formKey.currentState!.validate()) {
                          print("Selected Category: $selectedCategory");

                          // Refresh the UI after updating the category
                          refreshCallback();
                          Navigator.of(context).pop();
                        }
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled
                            ? AppColors.appSky
                            : Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Post",
                        style: TextStyle(
                          fontSize: 16,
                          color: isButtonEnabled ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
