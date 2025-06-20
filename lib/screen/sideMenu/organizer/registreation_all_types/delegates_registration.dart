import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/my_conference_delegates/my_conference_delegates_view.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/manual_attendance/manual_delegates_marked_attendance_list.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/qr_code/delegates_register_name_list.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/qr_code/qr_attendance.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../conference_list.dart';
import 'delegates_registration_view.dart';

class DelegatesRegistration extends StatefulWidget {
  String pageTypes;
   DelegatesRegistration({super.key,required this.pageTypes});

  @override
  State<DelegatesRegistration> createState() => _DelegatesRegistrationState();
}

class _DelegatesRegistrationState extends State<DelegatesRegistration> {
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

  final List<Map<String, String>> details = [
    {
      "id": "1",
      "registrationN0": "REG123",
      "accountName": "30th ISCB International Conference (ISCBC-2025)",
      "paymentMode": "PhonePay",
      "delegateName": "Dr. A. Sharma",
      "tnNumber": "2343546446",
      "tnDate": "2023-12-10",
      "couponCode": "EX001",
      "bankName": "HDFC",
      "amount": "23424343",
      "bookingStatus": "Pending",
      "feeDate": "2025-11-23",
      "fromDate": "2025-11-23",
      "toDate": "2025-12-24",
    }
  ];

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

  List<dynamic> inactiveConferenceList = [
    {
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "registrationNo": "1",
      "id": "1",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "delegatesName": " Name",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    }, {
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "registrationNo": "2",
      "id": "1",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "delegatesName": " Name",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
    {
      "id": "3",
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "registrationNo": "2",
      'paymentStatus': "Pending",
      'bookingStatus': "Pending",
      "delegatesName": " Name",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
  ];
  List<dynamic> activeConferenceList = [
    {
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "registrationNo": "1",
      "id": "1",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "delegatesName": " Name",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    }, {
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "registrationNo": "2",
      "id": "1",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "delegatesName": " Name",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
    {
      "id": "3",
      'title': "30th ISCB International Conference (ISCBC-2025)",
      "registrationNo": "2",
      'paymentStatus': "Pending",
      'bookingStatus': "Pending",
      "fromDate": "2024-12-19",
      "toDate": "2024-12-20",
      "delegatesName": " Name",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
          'Delegate Registrations Conference',
          style: FTextStyle.appBarTitleWhite,
        ),
        centerTitle: true,
      ),
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
                    borderSide:
                        const BorderSide(color: AppColors.appSky, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide:
                        const BorderSide(color: AppColors.appSky, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide:
                        const BorderSide(color: AppColors.appSky, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 18.0),
                  suffixIcon: _isTextEmpty
                      ? const Icon(Icons.search, color: AppColors.appSky)
                      : IconButton(
                          icon:
                              const Icon(Icons.clear, color: AppColors.appSky),
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
          color:
              _selectedIndex == index ? AppColors.appSky : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color:
                _selectedIndex == index ? AppColors.appSky : Colors.grey[400]!,
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
  Widget _buildActiveSegment(double height, double width) {
    return ListView.builder(
      itemCount: activeConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final item = activeConferenceList[index];
        final bookingStatus = item['bookingStatus'] ?? 'Pending';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(item['title'] ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FTextStyle.subtitle),



              Row(
                children: [
                  Icon(Icons.date_range, size: 18,
                      color: AppColors.secondYellowColour),
                  SizedBox(width: 6),
                  Text("${Constants.formatDate(item['fromDate'])}  → ${Constants
                      .formatDate(item['toDate'])}", style: FTextStyle.style),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if(widget.pageTypes=='QRAttendance') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DelegatesRegisterNameList(

                                  ),
                            ),
                          );
                        }
                     else if(widget.pageTypes=='ManualAttendance') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ManualDelegatesMarkedAttendanceList(

                                  ),
                            ),
                          );
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConferenceList(

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
                      ),
                      child: Text(
                        "Delegates Registration List",
                        style: FTextStyle.loginBtnStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {
    return ListView.builder(
      itemCount: inactiveConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final item = inactiveConferenceList[index];
        final bookingStatus = item['bookingStatus'] ?? 'Pending';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(item['title'] ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FTextStyle.subtitle),
              Row(
                children: [
                  Icon(Icons.date_range, size: 18,
                      color: AppColors.secondYellowColour),
                  SizedBox(width: 6),
                  Text("${Constants.formatDate(item['fromDate'])}  → ${Constants
                      .formatDate(item['toDate'])}", style: FTextStyle.style),
                ],
              ),




              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if(widget.pageTypes=='QRAttendance') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DelegatesRegisterNameList(

                                  ),
                            ),
                          );
                        }
                        else if(widget.pageTypes=='ManualAttendance') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ManualDelegatesMarkedAttendanceList(

                                  ),
                            ),
                          );
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConferenceList(

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
                      ),
                      child: Text(
                        "Delegates Registration List",
                        style: FTextStyle.loginBtnStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //
              //     // Padding(
              //     //   padding: const EdgeInsets.all(8.0),
              //     //   child: Row(
              //     //     mainAxisAlignment: MainAxisAlignment.end,
              //     //     crossAxisAlignment: CrossAxisAlignment.end,
              //     //     children: [
              //     //       if (item['bookingStatus'] == 'Success')
              //     //         Row(
              //     //           mainAxisAlignment: MainAxisAlignment.end,
              //     //           crossAxisAlignment: CrossAxisAlignment.end,
              //     //           children: [
              //     //             GestureDetector(
              //     //               onTap: () {
              //     //                 Navigator.push(
              //     //                   context,
              //     //                   MaterialPageRoute(
              //     //                     builder: (context) =>
              //     //                         DelegatesRegistrationView(
              //     //                           id: "",
              //     //                         ),
              //     //                   ),
              //     //                 );
              //     //               },
              //     //               child: Container(
              //     //                 height: 35,
              //     //                 width: 35,
              //     //                 decoration: BoxDecoration(
              //     //                   color: AppColors.secondaryColour,
              //     //                   // Green for edit
              //     //                   borderRadius: BorderRadius.circular(8),
              //     //                   boxShadow: [
              //     //                     BoxShadow(
              //     //                       color: Colors.black.withOpacity(0.1),
              //     //                       blurRadius: 6,
              //     //                       offset: const Offset(0, 2),
              //     //                     ),
              //     //                   ],
              //     //                 ),
              //     //                 child: const Icon(
              //     //                   Icons.remove_red_eye_outlined,
              //     //                   color: Colors.white,
              //     //                   size: 20,
              //     //                 ),
              //     //               ),
              //     //             ),
              //     //             SizedBox(
              //     //               width: 10,
              //     //             ),
              //     //             GestureDetector(
              //     //               onTap: () {
              //     //                 // Navigator.push(
              //     //                 //   context,
              //     //                 //   MaterialPageRoute(
              //     //                 //     builder: (context) =>
              //     //                 //         FeePageView(id: "",
              //     //                 //
              //     //                 //         ),
              //     //                 //   ),
              //     //                 // );
              //     //               },
              //     //               child: Container(
              //     //                 height: 35,
              //     //                 width: 35,
              //     //                 decoration: BoxDecoration(
              //     //                   color: AppColors.appBlue,
              //     //                   // Green for edit
              //     //                   borderRadius: BorderRadius.circular(8),
              //     //                   boxShadow: [
              //     //                     BoxShadow(
              //     //                       color: Colors.black.withOpacity(0.1),
              //     //                       blurRadius: 6,
              //     //                       offset: const Offset(0, 2),
              //     //                     ),
              //     //                   ],
              //     //                 ),
              //     //                 child: const Icon(
              //     //                   Icons.save_alt_rounded,
              //     //                   color: Colors.white,
              //     //                   size: 20,
              //     //                 ),
              //     //               ),
              //     //             ),
              //     //           ],
              //     //         ),
              //     //
              //     //       if (item['bookingStatus'] == 'Pending')
              //     //         Row(
              //     //           mainAxisAlignment: MainAxisAlignment.end,
              //     //           crossAxisAlignment: CrossAxisAlignment.end,
              //     //           children: [
              //     //             GestureDetector(
              //     //               onTap: () {
              //     //                 Navigator.push(
              //     //                   context,
              //     //                   MaterialPageRoute(
              //     //                     builder: (context) =>
              //     //                         DelegatesRegistrationView(
              //     //                           id: "",
              //     //                         ),
              //     //                   ),
              //     //                 );
              //     //               },
              //     //               child: Container(
              //     //                 height: 35,
              //     //                 width: 35,
              //     //                 decoration: BoxDecoration(
              //     //                   color: AppColors.secondaryColour,
              //     //                   // Green for edit
              //     //                   borderRadius: BorderRadius.circular(8),
              //     //                   boxShadow: [
              //     //                     BoxShadow(
              //     //                       color: Colors.black.withOpacity(0.1),
              //     //                       blurRadius: 6,
              //     //                       offset: const Offset(0, 2),
              //     //                     ),
              //     //                   ],
              //     //                 ),
              //     //                 child: const Icon(
              //     //                   Icons.remove_red_eye_outlined,
              //     //                   color: Colors.white,
              //     //                   size: 20,
              //     //                 ),
              //     //               ),
              //     //             ),
              //     //             SizedBox(
              //     //               width: 10,
              //     //             ),
              //     //             GestureDetector(
              //     //               onTap: () {
              //     //                 CommonPopups.showDeleteCustomPopup(
              //     //                   context,
              //     //                   "Are you sure you want to delete?",
              //     //                       () {
              //     //                     // BlocProvider.of<
              //     //                     //     AllRequesterBloc>(
              //     //                     //     context)
              //     //                     //     .add(DeleteBillingHandlers(
              //     //                     //     data[index]
              //     //                     //     [
              //     //                     //     'id']));
              //     //                   },
              //     //                 );
              //     //               },
              //     //               child: Container(
              //     //                 height: 35,
              //     //                 width: 35,
              //     //                 decoration: BoxDecoration(
              //     //                   color: Colors.red, // Red for delete
              //     //                   borderRadius: BorderRadius.circular(8),
              //     //                   boxShadow: [
              //     //                     BoxShadow(
              //     //                       color: Colors.black.withOpacity(0.1),
              //     //                       blurRadius: 6,
              //     //                       offset: const Offset(0, 2),
              //     //                     ),
              //     //                   ],
              //     //                 ),
              //     //                 child: const Icon(
              //     //                   Icons.delete,
              //     //                   color: Colors.white,
              //     //                   size: 20,
              //     //                 ),
              //     //               ),
              //     //             ),
              //     //           ],
              //     //         ),
              //     //     ],
              //     //   ),
              //     // ),
              //   ],
              // ),
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



  Widget _buildDetailTile(String title, String? value, {Color? valueColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: valueColor ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
