import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
import 'package:smart_conference/utils/form_field_style.dart';
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
  bool _isTextEmpty = true;

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
    controllerText.addListener(() {
      setState(() {
        _isTextEmpty = controllerText.text.isEmpty;
      });
    });
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
  void _onSearchChanged(String value) {
    setState(() {
      _isTextEmpty = value.isEmpty;
      searchQuery = value;
    });

    // Cancel the previous timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Start a new timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      pageNo=1;
      // Call the API only after the user has stopped typing for 500 milliseconds
      // BlocProvider.of<AllRequesterBloc>(context).add(
      //     GetBillingListHandler(searchQuery, pageNo, pageSize));
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

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

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      activeConferenceList['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No. of persons: ${activeConferenceList['numberPerson']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                        Text(
                          'No. of Days: ${activeConferenceList['numberDays']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From Date: ${activeConferenceList["fromDate"]}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                        Text(
                          'To Date: ${activeConferenceList['toDate']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FTextStyle.style,
                        ),
                      ],
                    ),

                    Text(
                      'Amount: ${activeConferenceList['amount']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
                    Text(
                      'Payment Mode: ${activeConferenceList["paymentMode"]}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bank Name: ', style: FTextStyle.style),
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
                    Text(
                      'Date of Payment: ${activeConferenceList['tnDate']}',
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
                          activeConferenceList['bookingStatus'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: activeConferenceList['bookingStatus'] == "Success"
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                            'Fee Status: ', style: FTextStyle.listTitle),
                        Text(
                          activeConferenceList['feeStatus'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: activeConferenceList['feeStatus'] == "Success"
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
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
      data.clear();
      pageNo = 1;
      hasMoreData = true;
      totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
  }
}
