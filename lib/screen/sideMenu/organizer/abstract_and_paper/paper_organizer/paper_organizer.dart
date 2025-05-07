import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/sideMenu/organizer/abstract_and_paper/abstract_organizer/review_abstract/review_abstract_view.dart';
import 'package:nexcon/screen/sideMenu/organizer/abstract_and_paper/paper_organizer/paper_review_organizer.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class FullPaperReview extends StatefulWidget {
  const FullPaperReview({super.key});

  @override
  State<FullPaperReview> createState() => _FullPaperReviewState();
}

class _FullPaperReviewState extends State<FullPaperReview> {

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

  List<dynamic> inactiveConferenceList = [
    {
      "id":"1",
      'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
      "proposalType": "Lorem",
      "paperTitle":"vbncnbnnbnn",
      "dateOfSubmission":"12-05-2023",
      "status":"Approved",
      "feeStatus":"sdbb",
      "Remark":"Chsnge some thingx",


    },  {
      "id":"2",
      'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
      "proposalType": "Lorem",
      "paperTitle":"vbncnbnnbnn",
      "dateOfSubmission":"12-05-2023",
      "status":"Approved",
      "feeStatus":"sdbb",
      "Remark":"Chsnge some thingx",

    },{
      "id":"3",
      ' conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
      "proposalType": "Lorem",
      "paperTitle":"vbncnbnnbnn",
      "dateOfSubmission":"12-05-2023",
      "status":"Approved",
      "feeStatus":"sdbb",
      "Remark":"Chsnge some thingx",
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
            size: 28,
          ), // Menu icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Review Full Paper',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),

        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          // const SizedBox(height: 20),
          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: 15),
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
            child: ListView.builder(
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
                            children: [
                              Text(
                                item['conferenceName'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: FTextStyle.listTitle,
                              ),
                              const SizedBox(height: 8),


                              Text("Paper Title: ${item['paperTitle'] ?? ''}", style: FTextStyle.style),
                              Text("Submission Date: ${item['dateOfSubmission'] ?? ''}", style: FTextStyle.style),
                              Text("Status: ${item['status'] ?? ''}", style: FTextStyle.style),



                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [


                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaperReviewOrganizer(
                                            id: item['id'].toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryColour,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 20),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
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
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(Icons.delete, color: Colors.white, size: 20),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                }
            ),
          )
          // Active/Inactive Content

        ],
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
