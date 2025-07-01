
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:nexcon/screen/sideMenu/organizer/abstract_and_paper/abstract_organizer/abstract_theam/abstract_view.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';

import 'abstract_organizer_edit.dart';
class AbstractOrganizer extends StatefulWidget {
  const AbstractOrganizer({super.key});

  @override
  State<AbstractOrganizer> createState() => _AbstractOrganizerState();
}

class _AbstractOrganizerState extends State<AbstractOrganizer> {

  int pageNo = 1;
  int totalPages = 0;
  int pageSize = 10;
  bool hasMoreData = true;
  int _selectedIndex = 0;

  late final TextEditingController remark = TextEditingController();


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
  List<dynamic> inactiveConferenceList = [
    {
      "id":"1",
      'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
      "abstraction": "Lorem",
      "status":"Pending For Review",

    },  {
      "id":"2",
      'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
      "abstraction": "Lorem",
      "status":"Not Upload",

    },{
      "id":"3",
      'conferenceName': "19th Indian Science Communication Congress (ISCC-2019)",
      "abstraction": "Lorem",
      "status":"Success",
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
      appBar: AppBar(
        backgroundColor:AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24,
          ), // Menu icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Abstract Session/Themes',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),

        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 20),
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
          Expanded(
            child: _selectedIndex == 0
                ? _buildActiveSegment(height, width)
                : _buildInActiveSegment(height, width),
          ),

          // Active/Inactive Content

        ],
      ),
    );
  }
  Widget _buildActiveSegment(double height, double width) {


    List<dynamic> activeConferenceList = [
      {
        "id":"1",
        'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
        "abstraction": "Lorem",
        "status":"Pending For Review",

      },  {
        "id":"2",
        'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
        "abstraction": "Lorem",
        "status":"Not Upload",

      },{
        "id":"3",
        'conferenceName': "19th Indian Science Communication Congress (ISCC-2019)",
        "abstraction": "Lorem",
        "status":"Success",
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
              padding: const EdgeInsets.all( 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 8),
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
                        ),
                        const SizedBox(height: 6),
                        // Row(
                        //   children: [
                        //     Icon(Icons.library_books, size: 18, color: Colors.grey[600]),
                        //     const SizedBox(width: 3),
                        //     Text(
                        //       " ${item['abstraction']}",
                        //       style: FTextStyle.subtitle,maxLines: 4,
                        //
                        //     ),
                        //   ],
                        // ),
                        Row(
                          children: [
                            const Text(
                                'Abstract Status: ',
                                style: FTextStyle.style
                            ),
                            GestureDetector(
                              onTap: (){
                                _showStatusDialog(context);
                              },
                              child: Text(
                                item['status'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: item['status'] == "Success"
                                      ? AppColors.appSky
                                      : Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5,),

                        if (item['status'] == 'Success')
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
                                          AbstractOrganizerView(id: item['id'].toString()??"",

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

                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         FeePageView(id: "",
                                  //
                                  //         ),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color:AppColors.appBlue,
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
                                    Icons.save_alt_rounded,
                                    color: Colors.white,
                                    size: 18,

                                  ),
                                ),
                              ),


                            ],
                          ),

                        if (item['status'] == 'Not Upload')
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
                                          AbstractOrganizerView(id: item['id'].toString()??"",

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

                              GestureDetector(
                                onTap: () async {


                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AbstractOrganizerEdit(isEdit: '', title:  item['conferenceName'],)
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

                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0db050), // Green for edit
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
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),


                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: () {
                                  CommonPopups
                                      .showDeleteCustomPopup(
                                    context,
                                    "Are you sure you want to delete?",
                                        () {
                                      // BlocProvider.of<
                                      //     AllRequesterBloc>(
                                      //     context)
                                      //     .add(DeleteBillingHandlers(
                                      //     data[index]
                                      //     [
                                      //     'id']));
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
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (item['status'] == 'Pending For Review')
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
                                          AbstractOrganizerView(id: item['id'].toString()??"",

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
                                onTap: () async {


                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AbstractOrganizerEdit(isEdit: 'yes', title:  item['conferenceName'],)
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

                                child: Container(
                                  height: 32,
                                  width: 32,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0db050), // Green for edit
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
                                  CommonPopups
                                      .showDeleteCustomPopup(
                                    context,
                                    "Are you sure you want to delete?",
                                        () {
                                      // BlocProvider.of<
                                      //     AllRequesterBloc>(
                                      //     context)
                                      //     .add(DeleteBillingHandlers(
                                      //     data[index]
                                      //     [
                                      //     'id']));
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
                                    size: 20,
                                  ),
                                ),
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
  Widget _buildInActiveSegment(double height, double width) {

    List<dynamic> inactiveConferenceList = [
      {
        "id":"1",
        'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
        "abstraction": "Lorem",
        "status":"Pending For Review",

      },  {
        "id":"2",
        'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
        "abstraction": "Lorem",
        "status":"Not Upload",

      },{
        "id":"3",
        'conferenceName': "19th Indian Science Communication Congress (ISCC-2019)",
        "abstraction": "Lorem",
        "status":"Success",
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
              padding: const EdgeInsets.all( 16),
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
                        ),
                        const SizedBox(height: 6),
                        // Row(
                        //   children: [
                        //     Icon(Icons.library_books, size: 18, color: Colors.grey[600]),
                        //     const SizedBox(width: 3),
                        //     Text(
                        //       " ${item['abstraction']}",
                        //       style: FTextStyle.subtitle,maxLines: 4,
                        //
                        //     ),
                        //   ],
                        // ),
                        Row(
                          children: [
                            const Text(
                                'Abstract Status: ',
                                style: FTextStyle.style
                            ),
                            GestureDetector(

                              child: Text(
                                item['status'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: item['status'] == "Success"
                                      ? AppColors.appSky
                                      : Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5,),
                        SizedBox(height: 10,),
                        if (item['status'] == 'Success')
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
                                          AbstractOrganizerView(id: item['id'].toString()??"",

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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         FeePageView(id: "",
                                  //
                                  //         ),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color:AppColors.appBlue,
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
                                    Icons.save_alt_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),


                            ],
                          ),

                        if (item['status'] == 'Not Upload')
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
                                          AbstractOrganizerView(id: item['id'].toString()??"",

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
                                onTap: () async {


                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AbstractOrganizerEdit(isEdit: '', title:  item['conferenceName'],)
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

                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0db050), // Green for edit
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
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),


                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: () {
                                  CommonPopups
                                      .showDeleteCustomPopup(
                                    context,
                                    "Are you sure you want to delete?",
                                        () {
                                      // BlocProvider.of<
                                      //     AllRequesterBloc>(
                                      //     context)
                                      //     .add(DeleteBillingHandlers(
                                      //     data[index]
                                      //     [
                                      //     'id']));
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
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (item['status'] == 'Pending For Review')
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
                                          AbstractOrganizerView(id: item['id'].toString()??"",

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
                                onTap: () async {


                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AbstractOrganizerEdit(isEdit: 'yes', title:  item['conferenceName'],)
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

                                child: Container(
                                  height: 32,
                                  width: 32,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0db050), // Green for edit
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
                                  CommonPopups
                                      .showDeleteCustomPopup(
                                    context,
                                    "Are you sure you want to delete?",
                                        () {
                                      // BlocProvider.of<
                                      //     AllRequesterBloc>(
                                      //     context)
                                      //     .add(DeleteBillingHandlers(
                                      //     data[index]
                                      //     [
                                      //     'id']));
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
                                    size: 20,
                                  ),
                                ),
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
  void _showStatusDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController remarkController = TextEditingController();
    final FocusNode statusFocusNode = FocusNode();
    final GlobalKey<FormFieldState> statusKey = GlobalKey<FormFieldState>();

    String? selectedStatus;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              title: Text("Change Status", style: FTextStyle.preHeading16BoldStyle),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select Status", style: FTextStyle.SubHeadingTxtStyle),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        key: statusKey,
                        focusNode: statusFocusNode,
                        value: selectedStatus,
                        menuMaxHeight: 300,
                        hint: const Text(
                          "Select Status",
                          style: FTextStyle.formhintTxtStyle,
                        ),
                        items: ["Approved", "Pending", "Rejected"]
                            .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a status';
                          }
                          return null;
                        },
                        decoration: FormFieldStyle.dropDown,
                      ),

                      const SizedBox(height: 20),
                      Text("Remark", style: FTextStyle.SubHeadingTxtStyle),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: remarkController,
                        decoration:
                        FormFieldStyle.dropDown.copyWith(hintText: "Enter Remark")
                      ,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a remark';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // ✅ Your logic here
                      print("Status: $selectedStatus");
                      print("Remark: ${remarkController.text}");

                      Navigator.pop(context); // Close dialog
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appSky,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

}
