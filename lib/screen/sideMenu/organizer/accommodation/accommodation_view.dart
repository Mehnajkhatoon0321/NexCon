import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/colours.dart';
import '../../../../utils/commonFunction.dart';
import '../../../../utils/font_text_Style.dart';
class AccommodationOrganizationView extends StatefulWidget {
  final  String id ;
  const AccommodationOrganizationView({ required this.id,super.key});

  @override
  State<AccommodationOrganizationView> createState() => _AccommodationOrganizationViewState();
}

class _AccommodationOrganizationViewState extends State<AccommodationOrganizationView>  {
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
            'Accommodation View',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,

        ),
        body: Column(
          children: [
            Expanded(
              child: isInitialLoading && activeConferenceList.isEmpty
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(height: 10, color: Colors.grey),
                                  const SizedBox(height: 5),
                                  Container(height: 10, color: Colors.grey),
                                  const SizedBox(height: 5),
                                  Container(height: 10, color: Colors.grey),
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
                  : (activeConferenceList.isEmpty)
                  ? const Center(
                child: Text("No data available.",
                    style: FTextStyle.listTitle),
              )
                  : Column(
                children: [
                  Container(
                    height: height * 0.06,
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailTile(
                            'No. of persons:',
                            activeConferenceList['numberPerson']),
                        _buildDetailTile(
                            'No. of Days:',
                            activeConferenceList['numberDays']),
                        _buildDetailTile(
                            'From Date:',
                            activeConferenceList['fromDate']),
                        _buildDetailTile(
                            'To Date:',
                            activeConferenceList['toDate']),
                        _buildDetailTile(
                            'Amount:',
                            activeConferenceList['amount']),
                        _buildDetailTile(
                            'Payment Mode:',
                            activeConferenceList['paymentMode']),
                        _buildDetailTile(
                            'Bank Name:',
                            activeConferenceList["bankName"]),
                        _buildDetailTile(
                            'Date of Payment:',
                            activeConferenceList['tnDate']),
                        _buildDetailTile(
                            'Booking Status:',
                            activeConferenceList['bookingStatus'],
                            valueColor: activeConferenceList['bookingStatus'] == "Success"
                                ? Colors.green
                                : Colors.orange),
                        _buildDetailTile(
                            'Fee Status:',
                            activeConferenceList['feeStatus'],
                            valueColor: activeConferenceList['feeStatus'] == "Success"
                                ? Colors.green
                                : Colors.orange),
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
  Widget _buildDetailTile(String title, String value, {Color? valueColor}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              "$title:",
              style: FTextStyle.listTitle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: valueColor != null
                  ? FTextStyle.listTitleSub.copyWith(color: valueColor, fontWeight: FontWeight.bold)
                  : FTextStyle.listTitleSub,
            ),
          ),
        ],
      ),
    );
  }

}
