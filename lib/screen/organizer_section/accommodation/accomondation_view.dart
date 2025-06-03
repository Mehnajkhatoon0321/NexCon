import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';

class AccommodationView extends StatefulWidget {
final  String id ;
  const AccommodationView({
    required this.id,super.key});

  @override
  State<AccommodationView> createState() => _AccommodationViewState();
}

class _AccommodationViewState extends State<AccommodationView> {
  Map<String, dynamic> activeConferenceList =
    {
      "id":"1",
      'title': "30th ISCB International Conference (ISCBC-2025)",
      'paymentMode': "PhonePay",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC",
      'amount': "23424343",
      'bookingStatus': "Pending",
      'feeStatus': "Pending",
      "numberPerson": "2",
      "numberDays": "4",
      "fromDate": "23-11-2025",
      "toDate": "24-12-2025",
      'downloadReceipt': "assets/images/payment.png"
    }

  ;


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
  List<dynamic> data = [
    {
      "id":"1",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },

    {
      "id":"2",
      "title": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
    },  {
      "id":"3",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },

    {
      "id":"4",
      "title": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
    },  {
      "id":"5",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },

    {
      "id":"6",
      "title": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
    },  {
      "id":"7",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },


  ];
  final controller = ScrollController();
  final TextEditingController controllerText = TextEditingController();
  bool isLoading = false;
  bool isInitialLoading = false;
  bool isLoadingEdit = false;
  String searchQuery = "";
  @override
  void dispose() {
    controllerText.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<AllRequesterBloc>(context)
    //     .add(GetBillingListHandler("", pageNo, pageSize));
    paginationCall();
  }
  Map<String, dynamic> errorServerMessage = {};
  String? errorMessage;
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          backgroundColor: Colors.white,
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
              'Accommodation View',
              style: FTextStyle.HeadingTxtWhiteStyle,
            ),
            centerTitle: true,

          ),
        body:  Column(
          children: [

            Expanded(

              child: isInitialLoading && data.isEmpty

                  ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 10, // Number of shimmer placeholders
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03, vertical: 5),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 10, color: Colors.grey),
                                  const SizedBox(height: 5),
                                  Container(
                                      height: 10, color: Colors.grey),
                                  const SizedBox(height: 5),
                                  Container(
                                      height: 10, color: Colors.grey),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
                  : (errorMessage != null || errorServerMessage.isNotEmpty)
                  ? Center(
                child: Text(
                  errorMessage ?? errorServerMessage.toString(),
                  style: FTextStyle.listTitle,
                  textAlign: TextAlign.center,
                ),
              )
                  : (data.isEmpty)
                  ? const Center(
                child: Text("No  data available.",
                    style: FTextStyle.listTitle),

              )
                  :

              Column(
                children: [
                  Container(
                    height: height*0.06,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.5, 0.95, 0.95],
                        colors: [
                          Color(0xffffffff),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        activeConferenceList['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.listTitle,
                        textAlign:TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'No. of persons: ', style: FTextStyle.listTitle),
                                  Text(
                                      activeConferenceList['numberPerson'],
                                      style:FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                            ), Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'No. of Days:', style: FTextStyle.listTitle),
                                  Text(
                                      activeConferenceList['numberDays'],
                                      style:FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                            ),



                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'From Date: ', style: FTextStyle.listTitle),
                                  Text(
                                      activeConferenceList['fromDate'],
                                      style:FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                            ), Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'To Date: ', style: FTextStyle.listTitle),
                                  Text(
                                      activeConferenceList['toDate'],
                                      style:FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Amount: ', style: FTextStyle.listTitle),
                              Text(
                                  activeConferenceList['amount'],
                                  style:FTextStyle.listTitleSub
                              ),
                            ],
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Payment Mode: ', style: FTextStyle.listTitle),
                              Text(
                                  activeConferenceList['paymentMode'],
                                  style:FTextStyle.listTitleSub
                              ),
                            ],
                          ),
                        ),




                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Bank Name: ', style: FTextStyle.listTitle),
                              Expanded(
                                child: Text(
                                  activeConferenceList["bankName"],
                                  style: FTextStyle.style,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Date of Payment: ', style: FTextStyle.listTitle),
                              Text(
                                activeConferenceList['tnDate'],
                                style:FTextStyle.style
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Booking Status: ', style: FTextStyle.listTitle),
                              Text(
                                activeConferenceList['bookingStatus'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: activeConferenceList['bookingStatus'] == "Success"
                                      ? AppColors.appSky
                                      : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              const Text(
                                  'Fee Status: ', style: FTextStyle.listTitle),
                              Text(
                                activeConferenceList['feeStatus'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: activeConferenceList['feeStatus'] == "Success"
                                      ? AppColors.appSky
                                      : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),


      ),
    );
  }


}
