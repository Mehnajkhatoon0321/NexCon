import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_edit.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer_view.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class MyConferenceOrganizer extends StatefulWidget {
  const MyConferenceOrganizer({super.key});

  @override
  State<MyConferenceOrganizer> createState() => _MyConferenceOrganizerState();
}

class _MyConferenceOrganizerState extends State<MyConferenceOrganizer>  {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
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
                _buildToggleButton('Past', 1),
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

  // Toggle Button Widget
  Widget _buildToggleButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onButtonPressed(index),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? AppColors.primaryColour
                : AppColors.formFieldBackColour,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: _selectedIndex == index
                    ? Colors.white
                    : AppColors.primaryColour,
                fontSize: _selectedIndex == index
                    ?17:15,
                fontWeight:_selectedIndex == index
                    ? FontWeight.w500 :FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Active Segment
  Widget _buildActiveSegment(double height, double width) {
    List<dynamic> activeConferenceList = [
      {"id":"1",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName": "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20",
        "registration":"200",
      },
      {
        "id":"2",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName": "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20",
        "registration":"200",
      },
      {
        "id":"3",
        'bookingStatus': "Approved",
        "conferenceId": "1232343544",
        "conferenceName":
        "5th International Tech & Innovation Summit",
        "fromDate": "2024-11-25",
        "toDate": "2024-11-26",
        "registration":"200",
      },
      {"id":"4",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName":
        "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20"
        ,
        "registration":"200",
      },

      {
        "id":"5",
        'bookingStatus': "Approved",
        "conferenceId": "1232343544",
        "conferenceName":
        "5th International Tech & Innovation Summit",
        "fromDate": "2024-11-25",
        "toDate": "2024-11-26"
        ,
        "registration":"200",
      },
      {
        "id":"6",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName":
        "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20"
        ,
        "registration":"200",
      },
      {
        "id":"7",
        'bookingStatus': "Approved",
        "conferenceId": "1232343544",
        "conferenceName":
        "5th International Tech & Innovation Summit",
        "fromDate": "2024-11-25",
        "toDate": "2024-11-26"
        ,
        "registration":"200",
      },

    ];

    return
      ListView.builder(
          itemCount: activeConferenceList.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final item = activeConferenceList[index];
            final bookingStatus = item['bookingStatus'] ?? 'Pending';
            return Container(
              // height: height * 0.16,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? const Color(0xFFFFF7E6)
                    : const Color(0xFFFF8D70).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
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
                            style: FTextStyle.listTitle
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.confirmation_number, size: 18, color: Colors.grey[600]),
                            const SizedBox(width: 3),
                            Text(
                                "Conference ID: ${item['conferenceId']}",
                                style: FTextStyle.listTitleSub
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),Row(
                          children: [
                            Icon(Icons.app_registration, size: 18, color: Colors.grey[600]),
                            const SizedBox(width: 3),
                            Text(
                                "Total Registration: ${item['registration']}",
                                style: FTextStyle.listTitleSub
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                'Booking Status: ', style: FTextStyle.listTitleSub),
                            Text(
                              bookingStatus,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: bookingStatus == "Approved"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
                            const SizedBox(width: 3),
                            Text(
                                "${item['fromDate']} - ${item['toDate']}",
                                style: FTextStyle.listTitleSub
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
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
                                        MyConferenceOrganizerView(id: item['id'],

                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 35,
                                width: 35,

                                decoration: BoxDecoration(
                                  color:AppColors.gray_4,
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
                            SizedBox(width: 20,),
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
                                            MyConferenceOrganizerEdit(
                                              conferenceName: item["conferenceName"],
                                              fromdata: item['fromDate'] ?? 'N/A',
                                              todata:  item['toDate'] ?? 'N/A',

                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,

                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0db050),
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
    List<dynamic> inactiveConferenceList = [
      {"id":"1",
          'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName": "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20",
        "registration":"200",
      },
      {
        "id":"2",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName": "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20",
        "registration":"200",
      },
      {
        "id":"3",
        'bookingStatus': "Approved",
        "conferenceId": "1232343544",
        "conferenceName":
        "5th International Tech & Innovation Summit",
        "fromDate": "2024-11-25",
        "toDate": "2024-11-26",
       "registration":"200",
      },
      {"id":"4",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName":
        "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20"
        ,
        "registration":"200",
      },

      {
        "id":"5",
        'bookingStatus': "Approved",
        "conferenceId": "1232343544",
        "conferenceName":
        "5th International Tech & Innovation Summit",
        "fromDate": "2024-11-25",
        "toDate": "2024-11-26"
        ,
        "registration":"200",
      },
      {
        "id":"6",
        'bookingStatus': "Approved",
        "conferenceId": "1232343543",
        "conferenceName":
        "4th International Science Communication Conference",
        "fromDate": "2024-12-19",
        "toDate": "2024-12-20"
        ,
        "registration":"200",
      },
      {
        "id":"7",
        'bookingStatus': "Approved",
        "conferenceId": "1232343544",
        "conferenceName":
        "5th International Tech & Innovation Summit",
        "fromDate": "2024-11-25",
        "toDate": "2024-11-26"
        ,
        "registration":"200",
      },

    ];
    return
      ListView.builder(
        itemCount: inactiveConferenceList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = inactiveConferenceList[index];
          final bookingStatus = item['bookingStatus'] ?? 'Pending';
          return Container(
            // height: height * 0.16,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: index % 2 == 0
                  ? const Color(0xFFFFF7E6)
                  : const Color(0xFFFF8D70).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
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
                          style: FTextStyle.listTitle
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.confirmation_number, size: 18, color: Colors.grey[600]),
                          const SizedBox(width: 3),
                          Text(
                              "Conference ID: ${item['conferenceId']}",
                              style: FTextStyle.listTitleSub
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),Row(
                        children: [
                          Icon(Icons.app_registration, size: 18, color: Colors.grey[600]),
                          const SizedBox(width: 3),
                          Text(
                              "Total Registration: ${item['registration']}",
                              style: FTextStyle.listTitleSub
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              'Booking Status: ', style: FTextStyle.listTitleSub),
                          Text(
                            bookingStatus,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: bookingStatus == "Approved"
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
                          const SizedBox(width: 3),
                          Text(
                              "${item['fromDate']} - ${item['toDate']}",
                              style: FTextStyle.listTitleSub
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
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
                                      MyConferenceOrganizerView(id: item['id'],

                                      ),
                                ),
                              );
                            },
                            child: Container(
                              height: 35,
                              width: 35,

                              decoration: BoxDecoration(
                                color:AppColors.gray_4,
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
                          // SizedBox(width: 20,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) =>
                          //                 MyConferenceOrganizerEdit(
                          //                   conferenceName: item["conferenceName"],
                          //                   fromdata: item['fromDate'] ?? 'N/A',
                          //                   todata:  item['toDate'] ?? 'N/A',
                          //
                          //                 ),
                          //           ),
                          //         );
                          //       },
                          //       child: Container(
                          //         height: 35,
                          //         width: 35,
                          //
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xFF0db050),
                          //           // Green for edit
                          //           borderRadius: BorderRadius.circular(8),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.black.withOpacity(0.1),
                          //               blurRadius: 6,
                          //               offset: const Offset(0, 2),
                          //             ),
                          //           ],
                          //         ),
                          //         child: const Icon(
                          //           Icons.edit,
                          //           color: Colors.white,
                          //           size: 20,
                          //         ),
                          //       ),
                          //     ),
                          //
                          //   ],
                          // ),
                        ],
                      ),
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

}
