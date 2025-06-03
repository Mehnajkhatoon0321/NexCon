import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/abstract/abstaction_register.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/abstract/abstaction_view.dart';

import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/common_popups.dart';

import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';


class AbstractScreen extends StatefulWidget {
  const AbstractScreen({super.key});

  @override
  State<AbstractScreen> createState() => _AbstractScreenState();
}

class _AbstractScreenState extends State<AbstractScreen> {
  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
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
  int _selectedIndex = 0;


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
              AppColors.primaryColour, // Green 0DB050
              AppColors.secondaryColour, // Blue 023E8A
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: _selectedIndex == index ? AppColors.primaryColour: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _selectedIndex == index ? AppColors.primaryColour : Colors.grey[400]!,
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
    List<dynamic> abstractList = [
      {
        "id":"1",
        "proposal_type":"paper",
        "paperTitle":"Chemistry  Management",
        "conferenceSelect":"30th ISCB International Conference (ISCBC-2025)",
        "dateSubmission":"2024-12-01",
        "status":"Not Upload",
        "remark":"Paper submission",







      },

      {
        "paperTitle":"Math Management",
        "id":"2",
        "proposal_type":"paper",
        "conferenceSelect":"4th International Science Communication Conference & 24th Indian Science Communication Conference",
        "dateSubmission":"2024-12-01",
        "status":"Pending For Review",
        "remark":"Paper submission",







      } ,  {
        "paperTitle":"Math Management",
        "id":"3",
        "proposal_type":"paper",
        "conferenceSelect":"4th International Science Communication Conference & 24th Indian Science Communication Conference",
        "dateSubmission":"2024-12-01",
        "status":"Success",
        "remark":"Paper submission",







      }



    ];

    return
      ListView.builder(
        itemCount: abstractList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = abstractList[index];
          return Container(
            // height: height*0.27,
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
                // Left Column: Payment Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['conferenceSelect'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.listTitle,
                      ),
                      const SizedBox(height: 2),


                      Row(
                        children: [
                          const Text(
                              'Abstract  Status: ',
                              style: FTextStyle.style
                          ),
                          Text(
                            item['status'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: item['status'] == "Success"
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),

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
                                      AbstractView(id: item['id'].toString()??"",

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
                                        AbstractView(id: item['id'].toString()??"",

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
                                      builder: (context) => AbstractionRegister(isEdit: 'yes', title:  item['conferenceSelect'],)
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
                                        AbstractView(id: item['id'].toString()??"",

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
                                      builder: (context) => AbstractionRegister(isEdit: 'yes', title:  item['conferenceSelect'],)
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
                                  Icons.edit,
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

                    ]
                  ),

                ),


              ],
            ),
          );
        },
      );


  }

  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {
    List<dynamic> inactiveConferenceList =  [
      {
        "id":"1",
        "proposal_type":"paper",
        "paperTitle":"Chemistry  Management",
        "conferenceSelect":"30th ISCB International Conference (ISCBC-2025)",
        "dateSubmission":"2024-12-01",
        "status":"Success",
        "remark":"Paper submission",







      },

      {
        "paperTitle":"Math Management",
        "id":"2",
        "proposal_type":"paper",
        "conferenceSelect":"4th International Science Communication Conference & 24th Indian Science Communication Conference",
        "dateSubmission":"2024-12-01",
        "status":"Pending For Review",
        "remark":"Paper submission",







      }



    ];
    return
      ListView.builder(
        itemCount: inactiveConferenceList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = inactiveConferenceList[index];
          return Container(
            // height: height*0.27,
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
                // Left Column: Payment Details
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['conferenceSelect'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.listTitle,
                        ),
                        const SizedBox(height: 2),
                        // Text(
                        //     'Proposal Type: ${item['proposal_type']}',
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: FTextStyle.style
                        // ),
                        // Text(
                        //     'Paper Title: ${item['paperTitle']}',
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: FTextStyle.style
                        // ),
                        //


                        Row(
                          children: [
                            const Text(
                                'Abstract  Status: ',
                                style: FTextStyle.style
                            ),
                            Text(
                              item['status'],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: item['status'] == "Success"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                          ],
                        ),
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
                                        AbstractView(id: item['id'].toString()??"",

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
                                          AbstractView(id: item['id'].toString()??"",

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




                            ],
                          ),
                      ]
                  ),

                ),


              ],
            ),
          );
        },
      );
  }
  @override
  // Widget build(BuildContext context) {
  //   var height = MediaQuery
  //       .of(context)
  //       .size
  //       .height;
  //   final screenWidth = MediaQuery
  //       .of(context)
  //       .size
  //       .width;
  //   var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
  //   var displayType = valueType
  //       .toString()
  //       .split('.')
  //       .last;
  //
  //   return MediaQuery(
  //     data: MediaQuery.of(context).copyWith(
  //         textScaler: const TextScaler.linear(1.0)),
  //     child: Scaffold(
  //
  //       backgroundColor: AppColors.backgroundColor,
  //       body: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(height: 10,),
  //           Padding(
  //             padding: EdgeInsets.symmetric(
  //                 horizontal: screenWidth * 0.04, vertical: 10),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(23.0),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black.withOpacity(0.2),
  //                     spreadRadius: 2,
  //                     blurRadius: 4,
  //                     offset: const Offset(0, 1),
  //                   ),
  //                 ],
  //               ),
  //               child: TextFormField(
  //                 controller: controllerText,
  //                 decoration: FormFieldStyle.searchDecoration.copyWith(
  //                   suffixIcon: _isTextEmpty
  //                       ? const Icon(Icons.search,
  //                       color: AppColors.appSky)
  //                       : IconButton(
  //                     icon: const Icon(Icons.clear,
  //                         color: AppColors.appSky),
  //                     onPressed: _clearText,
  //                   ),
  //                 ),
  //                 onChanged:_onSearchChanged,
  //               ),
  //             ),
  //           ),
  //
  //
  //           const SizedBox(height: 10,),
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: abstractList.length,
  //               padding: const EdgeInsets.symmetric(horizontal: 16),
  //               itemBuilder: (context, index) {
  //                 final item = abstractList[index];
  //                 return Container(
  //                   // height: height*0.27,
  //                   margin: const EdgeInsets.symmetric(vertical: 8),
  //                   padding: const EdgeInsets.all( 16),
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(16),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.black.withOpacity(0.1),
  //                         blurRadius: 8,
  //                         offset: const Offset(0, 4),
  //                       ),
  //                     ],
  //                   ),
  //                   child: Row(
  //                     children: [
  //                       // Left Column: Payment Details
  //                       Expanded(
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text(
  //                               item['conferenceSelect'],
  //                               maxLines: 2,
  //                               overflow: TextOverflow.ellipsis,
  //                               style: FTextStyle.listTitle,
  //                             ),
  //                             const SizedBox(height: 2),
  //                             Text(
  //                                 'Proposal Type: ${item['proposal_type']}',
  //                                 maxLines: 1,
  //                                 overflow: TextOverflow.ellipsis,
  //                                 style: FTextStyle.style
  //                             ),
  //                             Text(
  //                                 'Paper Title: ${item['paperTitle']}',
  //                                 maxLines: 1,
  //                                 overflow: TextOverflow.ellipsis,
  //                                 style: FTextStyle.style
  //                             ),
  //
  //                             Text(
  //                               'Date of Submission: ${Constants.formatDate(item['dateSubmission'])}',
  //                               style:FTextStyle.style,
  //                               maxLines: 1,
  //                               overflow: TextOverflow.ellipsis,
  //                             ),
  //
  //                             Container(
  //                               width: screenWidth/2,
  //                               child: Text(
  //                                 'Remarks: ${item['remark']}',
  //                                 style: FTextStyle.style
  //                                 ,  maxLines: 1,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                             ),
  //
  //
  //
  //
  //                             Row(
  //                               children: [
  //                                 const Text(
  //                                     'Status: ',
  //                                     style: FTextStyle.listTitle
  //                                 ),
  //                                 Text(
  //                                   item['status'],
  //                                   style: TextStyle(
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: item['status'] == "Success"
  //                                         ? Colors.green
  //                                         : Colors.orange,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.end,
  //                               crossAxisAlignment: CrossAxisAlignment.end,
  //                               children: [
  //                                 GestureDetector(
  //                                   onTap: () async {
  //
  //
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                           builder: (context) => AbstractionRegister(isEdit: 'yes',)
  //                                       ),
  //
  //                                     );
  //                                     //     .then((result) {
  //                                     //   // Handle the result from the edit screen
  //                                     //   if (result[0]) {
  //                                     //     data.clear();
  //                                     //     pageNo = 1;
  //                                     //     hasMoreData = true;
  //                                     //     totalPages = 0;
  //                                     //     BlocProvider.of<AllRequesterBloc>(context)
  //                                     //         .add(AddCartDetailHandler("", pageNo, pageSize));
  //                                     //   }
  //                                     // }
  //                                     // );
  //
  //                                     // );
  //                                   },
  //
  //                                   child: Container(
  //                                     height: 35,
  //                                     width: 35,
  //
  //                                     decoration: BoxDecoration(
  //                                       color: const Color(0xFF0db050), // Green for edit
  //                                       borderRadius: BorderRadius.circular(8),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: Colors.black.withOpacity(0.1),
  //                                           blurRadius: 6,
  //                                           offset: const Offset(0, 2),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     child: const Icon(
  //                                       Icons.edit,
  //                                       color: Colors.white,
  //                                       size: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(width: 10,),
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     CommonPopups
  //                                         .showDeleteCustomPopup(
  //                                       context,
  //                                       "Are you sure you want to delete?",
  //                                           () {
  //                                         // BlocProvider.of<
  //                                         //     AllRequesterBloc>(
  //                                         //     context)
  //                                         //     .add(DeleteBillingHandlers(
  //                                         //     data[index]
  //                                         //     [
  //                                         //     'id']));
  //                                       },
  //                                     );
  //                                   },
  //                                   child: Container(
  //                                     height: 35,
  //                                     width: 35,
  //                                     decoration: BoxDecoration(
  //                                       color: Colors.red, // Red for delete
  //                                       borderRadius: BorderRadius.circular(8),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: Colors.black.withOpacity(0.1),
  //                                           blurRadius: 6,
  //                                           offset: const Offset(0, 2),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     child: const Icon(
  //                                       Icons.delete,
  //                                       color: Colors.white,
  //                                       size: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //
  //
  //                           ],
  //                         ),
  //                       ),
  //
  //
  //                     ],
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //
  //
  //
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }
  void _clearText() {
    controllerText.clear();
    setState(() {
      _isTextEmpty = true;
      // abstractList.clear();
      pageNo = 1;
      hasMoreData = true;
      totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
  }
}
