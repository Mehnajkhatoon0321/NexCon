import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:nexcon/screen/sideMenu/delegates_side_menu/abstract/abstaction_register.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';

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

  List<dynamic>  abstractList=[
    {
      "id":"1",
    "proposal_type":"paper",
      "paperTitle":"Chemistry  Management",
    "conferenceSelect":"30th ISCB International Conference (ISCBC-2025)",
    "dateSubmission":"2024-12-01",
    "status":"pending",
    "remark":"Paper submission",







  },

    {
      "paperTitle":"Math Management",
      "id":"2",
      "proposal_type":"paper",
      "conferenceSelect":"4th International Science Communication Conference & 24th Indian Science Communication Conference",
      "dateSubmission":"2024-12-01",
      "status":"pending",
      "remark":"Paper submission",







    }



  ];
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
    var height = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType
        .toString()
        .split('.')
        .last;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
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
            'Abstract',
            style: FTextStyle.appBarTitleWhite,
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
                            builder: (context) =>const AbstractionRegister()
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
                      "Add +",
                      style: FTextStyle.loginBtnStyle
                          .copyWith(color: AppColors.primaryColour,fontSize: 13),
                    )),
              ),
            )
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
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


            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
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
                              Text(
                                  'Proposal Type: ${item['proposal_type']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: FTextStyle.style
                              ),
                              Text(
                                  'Paper Title: ${item['paperTitle']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: FTextStyle.style
                              ),

                              Text(
                                'Date of Submission: ${item['dateSubmission']}',
                                style:FTextStyle.style,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              Container(
                                width: screenWidth/2,
                                child: Text(
                                  'Remarks: ${item['remark']}',
                                  style: FTextStyle.style
                                  ,  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),




                              Row(
                                children: [
                                  const Text(
                                      'Status: ',
                                      style: FTextStyle.listTitle
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>AbstractionRegister()
                                          )
                                      );
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


                            ],
                          ),
                        ),


                      ],
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
