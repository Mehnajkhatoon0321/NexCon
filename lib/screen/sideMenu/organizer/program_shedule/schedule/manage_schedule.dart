import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/schedule/manage_schedule_view.dart';
import 'package:nexcon/screen/sideMenu/organizer/program_shedule/schedule/mange_schedule_create.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../../../../utils/colours.dart';
import '../../../../../utils/commonFunction.dart';
import '../../../../../utils/common_popups.dart';
class ManageSchedule extends StatefulWidget {
  const ManageSchedule({super.key});

  @override
  State<ManageSchedule> createState() => _ManageScheduleState();
}

class _ManageScheduleState extends State<ManageSchedule> {
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
      backgroundColor: AppColors.backgroundColor,
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
          'Manage Schedule',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: (displayType == 'desktop' || displayType == 'tablet')
                  ? 70
                  : 37,
              child: ElevatedButton(
                  onPressed: () async {


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MangeScheduleCreate(isEdit: '',)
                      ),

                    );
                    //     .then((result) {
                    //   // Handle the result from the edit screen
                    //   if (result[0]) {
                    //     data.clear();
                    //     pageNo = 1;
                    //     hasMoreData = true;
                    //     totalPages = 0;
                    //     BlocProvider.of<AllRequesterBloc>(context)
                    //         .add(AddCartDetailHandler("", pageNo, pageSize));
                    //   }
                    // }
                    // );

                    // );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      backgroundColor: Colors.white),
                  child: Text(
                    "Create",
                    style: FTextStyle.loginBtnStyle
                        .copyWith(color: AppColors.appSky,fontSize: 13),
                  )),
            ),
          )
        ],
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
  Widget _buildActiveSegment(double height, double width) {
    List<dynamic> activeConferenceList = [
      {
        "id":"1",
        'title': "30th ISCB International Conference (ISCBC-2025)",
        'sessionName': "Session Name",
        'session_start_time': "12:30PM",
        'session_end_time': "11:00AM",
        'name_chair': "Name of Chair	",
        'name_co_chair': "Name of Co-chair",
        'name_of_coordinator': "Name of Coordinator",
        'name_of_panelists': "Name of Panelists",
        'session_venue': "Session Venue",
        'bookingStatus': "Pending",

      }, {
        "id":"2",
        'title': "30th ISCB International Conference (ISCBC-2025)",
        'sessionName': "Session Name",
        'session_start_time': "12:30PM",
        'session_end_time': "11:00AM",
        'name_chair': "Name of Chair	",
        'name_co_chair': "Name of Co-chair",
        'name_of_coordinator': "Name of Coordinator",
        'name_of_panelists': "Name of Panelists",
        'session_venue': "Session Venue",
        'bookingStatus': "Pending",

      }, {
        "id":"3",
        'title': "30th ISCB International Conference (ISCBC-2025)",
        'sessionName': "Session Name",
        'session_start_time': "12:30PM",
        'session_end_time': "11:00AM",
        'name_chair': "Name of Chair	",
        'name_co_chair': "Name of Co-chair",
        'name_of_coordinator': "Name of Coordinator",
        'name_of_panelists': "Name of Panelists",
        'session_venue': "Session Venue",
        'bookingStatus': "Pending",

      },

    ];
    return ListView.builder(
      itemCount: activeConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final item = activeConferenceList[index];

        // Provide default values for null fields
        final title = item['title'] ?? 'Unknown Title';
        final id = item['id'] ?? '0';

        final sessionName = item['sessionName'] ?? 'N/A';
        final sessionStartTime = item['session_start_time'] ?? 'N/A';
        final sessionEndTime = item['session_end_time'] ?? 'N/A';
        final nameChair = item['name_chair'] ?? 'N/A';
        final nameCoordinator = item['name_of_coordinator'] ?? 'N/A';
        final sessionVenue = item['session_venue'] ?? 'N/A';

        final bookingStatus = item['bookingStatus'] ?? 'Pending';


        return Container(
          // height: height * 0.24,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
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
              // Left Column: Payment Details
              Expanded(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.listTitle
                    ),



                    Text(
                      'Session Name: $sessionName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time: $sessionStartTime',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                        Text(
                          'End Times: $sessionEndTime',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                      ],
                    ),

                    Text(
                      'Name of Chair: $nameChair',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
  Text(
                      'Name of Coordinator: $nameCoordinator',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),  Text(
                      'Session Venue: $sessionVenue',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'Booking Status: ', style: FTextStyle.listTitle),
                        Text(
                          bookingStatus,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: bookingStatus == "Success"
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),

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
                                    ManageScheduleView(id: id,

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
                              size: 18,

                            ),
                          ),
                        ),
                        SizedBox(width: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MangeScheduleCreate(isEdit: 'Yes',)
                                  ),

                                );
                              },
                              child: Container(
                                height: 32,
                                width: 32,

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
                                   Icons.edit_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () {
                                CommonPopups.showDeleteCustomPopup(
                                  context,
                                  "Are you sure you want to delete?",
                                      () {
                                    // Handle delete logic
                                  },
                                );
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.red, // Red for delete
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
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 18,

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
              // Right Column: Action Buttons

            ],
          ),
        );
      },
    );

  }

  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {

    List<dynamic> inactiveConferenceList =[
      {
        "id":"1",
        'title': "30th ISCB International Conference (ISCBC-2025)",
        'sessionName': "Session Name",
        'session_start_time': "12:30PM",
        'session_end_time': "11:00AM",
        'name_chair': "Name of Chair	",
        'name_co_chair': "Name of Co-chair",
        'name_of_coordinator': "Name of Coordinator",
        'name_of_panelists': "Name of Panelists",
        'session_venue': "Session Venue",
        'bookingStatus': "Pending",

      }, {
        "id":"2",
        'title': "30th ISCB International Conference (ISCBC-2025)",
        'sessionName': "Session Name",
        'session_start_time': "12:30PM",
        'session_end_time': "11:00AM",
        'name_chair': "Name of Chair	",
        'name_co_chair': "Name of Co-chair",
        'name_of_coordinator': "Name of Coordinator",
        'name_of_panelists': "Name of Panelists",
        'session_venue': "Session Venue",
        'bookingStatus': "Pending",

      }, {
        "id":"3",
        'title': "30th ISCB International Conference (ISCBC-2025)",
        'sessionName': "Session Name",
        'session_start_time': "12:30PM",
        'session_end_time': "11:00AM",
        'name_chair': "Name of Chair	",
        'name_co_chair': "Name of Co-chair",
        'name_of_coordinator': "Name of Coordinator",
        'name_of_panelists': "Name of Panelists",
        'session_venue': "Session Venue",
        'bookingStatus': "Pending",

      },

    ];
    return ListView.builder(
      itemCount: inactiveConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final item = inactiveConferenceList[index];

        // Provide default values for null fields
        // Provide default values for null fields
        final title = item['title'] ?? 'Unknown Title';
        final id = item['id'] ?? '0';

        final sessionName = item['sessionName'] ?? 'N/A';
        final sessionStartTime = item['session_start_time'] ?? 'N/A';
        final sessionEndTime = item['session_end_time'] ?? 'N/A';
        final nameChair = item['name_chair'] ?? 'N/A';
        final nameCoordinator = item['name_of_coordinator'] ?? 'N/A';
        final sessionVenue = item['session_venue'] ?? 'N/A';

        final bookingStatus = item['bookingStatus'] ?? 'Pending';


        return Container(
          // height: height * 0.24,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
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
              // Left Column: Payment Details
              Expanded(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.listTitle
                    ),




                    Text(
                      'Session Name: $sessionName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time: $sessionStartTime',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                        Text(
                          'End Times: $sessionEndTime',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                      ],
                    ),

                    Text(
                      'Name of Chair: $nameChair',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
                    Text(
                      'Name of Coordinator: $nameCoordinator',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),  Text(
                      'Session Venue: $sessionVenue',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'Booking Status: ', style: FTextStyle.listTitle),
                        Text(
                          bookingStatus,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: bookingStatus == "Success"
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),

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
                                    ManageScheduleView(id: id,

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
                              size: 18,

                            ),
                          ),
                        ),

                      ],
                    ),



                  ],
                ),
              ),
              // Right Column: Action Buttons

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
