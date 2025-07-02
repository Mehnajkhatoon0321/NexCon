import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexcon/api_services/all_module_role/delegates_api_services/all_delegates/all_delegates_bloc.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/my_conference_delegates_view.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/scanner_details.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../../../api_services/services/custom_simmer_effect.dart';
import '../../../../api_services/services/error_manage_screen.dart' show CustomErrorWidget;
import '../../../../api_services/services/no_internet.dart' show NoNetworkWidget;
import '../../../../utils/flutter_flow_animations.dart' ;

class MyConferencePage extends StatefulWidget {
  const MyConferencePage({super.key});

  @override
  State<MyConferencePage> createState() => _MyConferencePageState();
}

class _MyConferencePageState extends State<MyConferencePage> {
  int _selectedIndex = 0;


  int pageNo = 1;
  int totalPages = 0;
  int pageSize = 10;
  bool hasMoreData = true;

  final controller = ScrollController();
  final TextEditingController controllerText = TextEditingController();
  bool isLoading = false;
  bool isInitialLoading = false;
  bool isLoadingEdit = false;
  String searchQuery = "";
  bool _isTextEmpty = true;
  final animationsMap = {

    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };
  void paginationCall() {
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (!isLoading && hasMoreData) {
          pageNo++;

          isInitialLoading = false;
          isLoading = true;
          //
          // BlocProvider.of<AllRequesterBloc>(context)
          //     .add(GetBillingListHandler(searchQuery, pageNo, pageSize));
        }
      }
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
      pageNo = 1;
      // Call the API only after the user has stopped typing for 500 milliseconds
      // BlocProvider.of<AllRequesterBloc>(context).add(
      //     GetBillingListHandler(searchQuery, pageNo, pageSize));
    });
  }
  @override
  void initState() {
    super.initState();
    controllerText.addListener(() {
      setState(() {
        _isTextEmpty = controllerText.text.isEmpty;
      });
    });

    BlocProvider.of<AllDelegatesBloc>(context)
        .add(ConferenceListHandler("", pageNo, pageSize));
    paginationCall();
  }
  List<dynamic> inactiveConferenceList =  [
    {
      "conferenceId": "1232343543",
      "conferenceName":
      "30th ISCB International Conference (ISCBC-2025)",
      "category": "Accompanying Person",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
    },  {
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "category": "Accompanying Person",
      "toDate": "2024-12-20"
    },
    {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
    },
    {
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "category": "Accompanying Person",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
    },
    {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
    },  {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
    },
    {
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "category": "Accompanying Person",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
    },
    {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
    },
  ];
  List<dynamic> activeConferenceList = [
    {
      "conferenceId": "1232343543",
      "conferenceName":
      "30th ISCB International Conference (ISCBC-2025)",
      "category": "Accompanying Person",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "submitted":true,
      "submitAbstractStatus":"Review",

    },  {
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "category": "Accompanying Person",
      "toDate": "2024-12-20",
      "submitted":false,
      "submitAbstractStatus":"Pending",
    },
    {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
      ,"submitted":true,
      "submitAbstractStatus":"Review",

    },
    {
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "category": "Accompanying Person",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
      ,"submitted":true,
      "submitAbstractStatus":"Review",
    },
    {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
      ,"submitted":false,
      "submitAbstractStatus":"Review",
    },  {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
      ,"submitted":true,
      "submitAbstractStatus":"Review",
    },
    {
      "conferenceId": "1232343543",
      "conferenceName":
      "4th International Science Communication Conference",
      "category": "Accompanying Person",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20"
      ,"submitted":false,
      "submitAbstractStatus":"Review",
    },
    {
      "conferenceId": "1232343544",
      "conferenceName":
      "5th International Tech & Innovation Summit",
      "category": "Accompanying Person",
      "fromDate": "2024-11-25",
      "toDate": "2024-11-26"
      ,"submitted":true,
      "submitAbstractStatus":"Review",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
            children: [
              const SizedBox(height: 20),
              // Toggle Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    _buildToggleButton('Upcoming', 0),
                    const SizedBox(width: 8.0),
                    _buildToggleButton('Previous', 1),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
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
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: FTextStyle.formhintTxtStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide: const BorderSide(
                            color: AppColors.appSky, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide: const BorderSide(
                            color: AppColors.appSky, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide: const BorderSide(
                            color: AppColors.appSky, width: 1.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 18.0),
                      suffixIcon: _isTextEmpty
                          ? const Icon(Icons.search,
                          color: AppColors.appSky)
                          : IconButton(
                        icon: const Icon(Icons.clear,
                            color: AppColors.appSky),
                        onPressed: _clearText,
                      ),
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                    onChanged: _onSearchChanged,
                  ),
                ),
              ),

              // Active/Inactive Content
              Expanded(
                child: BlocConsumer<AllDelegatesBloc, AllDelegatesState>(
                  listener: (context, state) {
                    if (state is AllDelegatesExceptionFailure) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text("Error: ${state.error}")),
                      // );
                    }
                  },
                  builder: (context, state) {
                    if (_selectedIndex == 0) {
                      if (state is AllDelegatesInitial ||
                          state is AllDelegatesLoading) {
                        return const CustomConferenceShimmer();
                      } else if (state is CheckNetworkConnection) {
                        return NoNetworkWidget(message: state.errorMessage);
                      } else if (state is AllDelegatesFailure ||
                          state is AllDelegatesServerFailure ||
                          state is AllDelegatesExceptionFailure) {
                        final error = state is AllDelegatesFailure
                            ? state.failureMessage
                            : state is AllDelegatesServerFailure
                            ? state.error
                            : (state as AllDelegatesExceptionFailure).error;
                        return CustomErrorWidget(message: error);
                      } else if (state is ConferenceSuccess) {
                        activeConferenceList = state.logResponse['data'] ?? [];
                        return _buildActiveSegment(height, width, activeConferenceList);
                      } else {
                        return const Center(child: Text("Unknown state"));
                      }
                    } else {
                      return _buildInActiveSegment(height, width);
                    }

                  },
                ),
              ),
            ],
          ),
    );
  }

  // Toggle Button Widget
  Widget _buildToggleButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.appSky, // Green 0DB050
              AppColors.secondaryColour, // Blue 023E8A
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: _selectedIndex == index ? AppColors.appSky: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _selectedIndex == index ? AppColors.appSky : Colors.grey[400]!,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Active Segment
  Widget _buildActiveSegment(double height, double width, List<dynamic> activeConferenceList) {

    return
      ListView.builder(
          itemCount: activeConferenceList.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            final item = activeConferenceList[index];
            return Container(
              // height: height * 0.16,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['conferenceName']!,
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                          style: FTextStyle.subtitle
                        ).animateOnPageLoad(animationsMap[
              'imageOnPageLoadAnimation2']!),

                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 18, color:AppColors.secondYellowColour),
                            SizedBox(width: 10,),
                            Text(
                              "${Constants.formatDate(item['fromDate'])} → ${Constants.formatDate(item['toDate'])}",
                              style: FTextStyle.style.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(animationsMap[
                        'imageOnPageLoadAnimation2']!),
                        Row(
                          children: [
                            Text(
                                "Delegate Category:",
                                style: FTextStyle.style
                            ),
                            const SizedBox(width: 4),
                            Text(
                                "${item['category']}",
                                style: FTextStyle.subtitle
                            ),
                            const SizedBox(width: 4),
                          ],
                        ).animateOnPageLoad(animationsMap[
                        'imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 4),

                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        ScannerDetails()
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 32,

                                    decoration: BoxDecoration(
                                      color:AppColors.secondYellowColour,
                                      // Green for edit
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.qr_code_scanner,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ), SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyConferenceDelegatesView(id: item['id'].toString(),

                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 32,

                                    decoration: BoxDecoration(
                                      color:AppColors.secondaryColour,
                                      // Green for edit
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () {
                                    _showEditDialog(
                                      context,
                                      item['conferenceId'], // Pass the selected ID for identification
                                          () {

                                      },
                                      item['category'], // Pass the initial category of the selected item
                                    );
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0db050),
                                      // Green background
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                       Icons.edit_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                          ],
                        ).animateOnPageLoad(animationsMap[
                        'imageOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),

                ],
              ),
            );
          }
            );

  }

  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {

    return
      ListView.builder(
      itemCount: inactiveConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        final item = inactiveConferenceList[index];
        return Container(
          // height: height * 0.16,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        item['conferenceName']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.subtitle
                    ).animateOnPageLoad(animationsMap[
                'imageOnPageLoadAnimation2']!),

                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 18, color:AppColors.secondYellowColour),
                        SizedBox(width: 10,),
                        Text(

                          "${Constants.formatDate(item['fromDate'])} → ${Constants.formatDate(item['toDate'])}",
                          style: FTextStyle.style.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    Row(

                      children: [

                        Text(
                            "Delegate Category:",
                            style: FTextStyle.style
                        ),
                        const SizedBox(width: 4),
                        Text(
                            "${item['category']}",
                            style: FTextStyle.subtitle
                        ),
                        const SizedBox(width: 4),
                      ],
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyConferenceDelegatesView(id: item['id'].toString(),

                                    ),
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            width: 32,

                            decoration: BoxDecoration(
                              color:AppColors.secondaryColour,
                              // Green for edit
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),

                      ],
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  void _clearText() {
    controllerText.clear();
    setState(() {
      _isTextEmpty = true;

      pageNo = 1;
      hasMoreData = true;
      totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
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
                "Delegate Category",
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
                        "Update",
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


