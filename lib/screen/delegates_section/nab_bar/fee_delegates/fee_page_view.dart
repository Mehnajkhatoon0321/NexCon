import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/colours.dart';
class FeePageView extends StatefulWidget {
  String id;
   FeePageView({required this.id,super.key});

  @override
  State<FeePageView> createState() => _FeePageViewState();
}

class _FeePageViewState extends State<FeePageView> {
  Map<String, dynamic> activeConferenceList =
  {
    "id":"1",
    "registrationN0":"1",
    'title': "30th ISCB International Conference (ISCBC-2025)",
    'paymentMode': "PhonePay",

    'tnNumber': "2343546446",
    'tnDate': "2023-12-10",
    'couponCode': "EX001",
    'bankName': "HDFC",
    'amount': "23424343",
    'bookingStatus': "Pending",
    'feeDate': "23-11-2025",
    "fromDate": "23-11-2025",
    "toDate": "24-12-2025",
    'status': "Success",


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





  bool isLoading = false;



  @override
  void initState() {
    super.initState();

    // BlocProvider.of<AllRequesterBloc>(context)
    //     .add(GetBillingListHandler("", pageNo, pageSize));

  }
  Map<String, dynamic> errorServerMessage = {};
  String? errorMessage;



  @override
  Widget build(BuildContext context) {

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: AppColors.appSky,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Fee Payment Details',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: isLoading && activeConferenceList.isEmpty
                  ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    " errorMessage ?? errorServerMessag",
                    style: FTextStyle.listTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
                  : (activeConferenceList.isEmpty)
                  ? const Center(
                child: Text("No data available.", style: FTextStyle.listTitle),
              )
                  : Padding(
                    padding: const EdgeInsets.all(18.0),
                    child:
                    ListView(
                      children: [
                        _buildDetailTile("Conference Name", activeConferenceList['title']),
                        _buildDetailTile("Registration No.", activeConferenceList['registrationN0']),
                        _buildDetailTile("Payment Mode", activeConferenceList['paymentMode']),
                        _buildDetailTile("Amount", activeConferenceList['amount']),
                        _buildDetailTile("Bank Name", activeConferenceList['bankName']),
                        _buildDetailTile("Transaction Number", activeConferenceList['tnNumber']),
                        _buildDetailTile("Transaction Date", activeConferenceList['tnDate']),
                        _buildDetailTile("Fee Payment Date", activeConferenceList['feeDate']),
                        _buildDetailTile(
                          "Booking Status",
                          activeConferenceList['bookingStatus'],
                          valueColor: activeConferenceList['bookingStatus'] == "Success"
                              ? AppColors.appSky
                              : Colors.red,
                        ),
                        if (activeConferenceList['couponCode']?.isNotEmpty ?? false)
                          _buildDetailTile("Coupon Code", activeConferenceList['couponCode']),
                        if (activeConferenceList['downloadReceipt'] != null)
                          Image.asset(activeConferenceList['downloadReceipt']),
                      ],
                    )

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
