import 'dart:async';

import 'package:flutter/material.dart';


import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_edit.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_view.dart';


import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/constant.dart';

import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';
class MyConferenceOrganizer extends StatefulWidget {
  const MyConferenceOrganizer({super.key});

  @override
  State<MyConferenceOrganizer> createState() => _MyConferenceOrganizerState();
}

class _MyConferenceOrganizerState extends State<MyConferenceOrganizer>  {
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

  List<dynamic> activeConferenceList = [
    {
      "id": "1",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "200",

    },
    {
      "id": "2",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "200",
    },
  ];
  List<dynamic> inactiveConferenceList = [
    {
      "id": "1",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "200",
    },
    {
      "id": "2",
      'bookingStatus': "Approved",
      "conferenceId": "1232343543",
      "conferenceName": "4th International Science Communication Conference",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "registration": "200",
      "registrationWait": "200",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                _buildToggleButton('Previous'
                    '', 1),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: 10),
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
            child: _selectedIndex == 0
                ? _buildActiveSegment(height, width)
                : _buildInActiveSegment(height, width),
          ),
        ],
      ),
    );
  }
  // Active Segment
  Widget _buildActiveSegment(double height, double width) {
    return ListView.builder(
      itemCount: activeConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final item = activeConferenceList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(item['conferenceName'] ?? '',           style: FTextStyle.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.date_range, size: 18,
                        color: AppColors.secondYellowColour),
                    SizedBox(width: 6),
                    Text("${Constants.formatDate(item['fromDate'])}  → ${Constants
                        .formatDate(item['toDate'])}", style: FTextStyle.style),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.how_to_reg, size: 18, color: AppColors.appSky),
                        SizedBox(width: 4),
                        Text("Registrations: ${item['registration']}",
                            style: FTextStyle.style),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 18, color: Colors.orange),
                        SizedBox(width: 4),
                        Text("Waiting: ${item['registrationWait']}",
                            style: FTextStyle.style),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    const Text(
                        'Booking Status: ', style: FTextStyle.style),
                    Text(
                      item['bookingStatus'],
                      style: FTextStyle.style.copyWith(color: item['bookingStatus'] == "Approved"
                          ? AppColors.appSky
                          : Colors.orange,                     fontWeight: FontWeight.bold,)

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    SizedBox(width: 10,),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               ScannerDetails()
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     height: 35,
                    //     width: 35,
                    //
                    //     decoration: BoxDecoration(
                    //       color:AppColors.secondYellowColour,
                    //       // Green for edit
                    //       borderRadius: BorderRadius.circular(8),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.black.withOpacity(0.1),
                    //           blurRadius: 6,
                    //           offset: const Offset(0, 2),
                    //         ),
                    //       ],
                    //     ),
                    //     child: const Icon(
                    //       Icons.qr_code_scanner,
                    //       color: Colors.white,
                    //       size: 20,
                    //     ),
                    //   ),
                    // ), SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyConferenceOrganizerView(id: item['id'].toString(),

                                ),
                          ),
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 35,

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
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyConferenceOrganizerEdit(isEdit: 'yes', title: item['conferenceName'],

                              ),
                            )
                        );  },

                      child: Container(
                        height: 35,
                        width: 35,
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
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         SizedBox(width: 10,),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) =>
                //                     MyConferenceOrganizerView(id: item['id']
                //                         .toString(),
                //
                //                     ),
                //               ),
                //             );
                //           },
                //           child: Container(
                //             height: 32,
                //             width: 35,
                //
                //             decoration: BoxDecoration(
                //               color: AppColors.secondaryColour,
                //               // Green for edit
                //               borderRadius: BorderRadius.circular(8),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.black.withOpacity(0.1),
                //                   blurRadius: 6,
                //                   offset: const Offset(0, 2),
                //                 ),
                //               ],
                //             ),
                //             child: const Icon(
                //               Icons.remove_red_eye_outlined,
                //               color: Colors.white,
                //               size: 20,
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 10,),
                //
                //       ],
                //     ),
                //     const SizedBox(height: 4),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {
    if (isLoading) {
      return ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: height * 0.18,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      );
    }

    if (inactiveConferenceList.isEmpty) {
      return Center(
        child: Text(
          "No data available",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      );
    }
    return  ListView.builder(
      itemCount: inactiveConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final item = inactiveConferenceList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(item['conferenceName'] ?? '',           style: FTextStyle.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.date_range, size: 18,
                        color: AppColors.secondYellowColour),
                    SizedBox(width: 6),
                    Text("${Constants.formatDate(item['fromDate'])}  → ${Constants
                        .formatDate(item['toDate'])}", style: FTextStyle.style),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.how_to_reg, size: 18, color: AppColors.appSky),
                    SizedBox(width: 4),
                    Text("Registrations: ${item['registration']}",
                        style: FTextStyle.style),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    const Text(
                        'Booking Status: ', style: FTextStyle.style),
                    Text(
                        item['bookingStatus'],
                        style: FTextStyle.style.copyWith(color: item['bookingStatus'] == "Approved"
                            ? AppColors.appSky
                            : Colors.orange,                     fontWeight: FontWeight.bold,)

                    ),
                  ],
                ),
                SizedBox(height: 2,),
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
                                MyConferenceOrganizerView(id: item['id'].toString(),

                                ),
                          ),
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 35,

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
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyConferenceOrganizerEdit(isEdit: 'yes', title: item['conferenceName'],

                              ),
                            )
                        );  },

                      child: Container(
                        height: 35,
                        width: 35,
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
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
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

}
