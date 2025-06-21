import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';
class MyOrderView extends StatefulWidget {
  final String id;
   const MyOrderView({ required this.id ,super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}
class _MyOrderViewState extends State<MyOrderView> {
  Map<String, dynamic> activeConferenceList =
  {
    "id":"1",
    "invoiceNumber":"1",
    "payType":"Offline",
    "creditPoint":"200",
    "amount":"100",
    "conferenceName": "4th International Science Communication Conference",
    "couponCode":"19ISCC90",
    "gst":"34",
    "discount":"23",
    "payAmount":"2132343",
    'bookingStatus': "Paid",
    "purchaseDate": "2024-12-19",

  };
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

  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            'My Order Details',

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
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                                    // padding: const EdgeInsets.all(16),
                                    children: [


                    _buildDetailTile("Conference Name", activeConferenceList['conferenceName']),
                    _buildDetailTile("Invoice Number", activeConferenceList['invoiceNumber']),
                                      _buildDetailTile("Credit Point", activeConferenceList['creditPoint']),
                    _buildDetailTile("Amount", activeConferenceList['amount']),
                    _buildDetailTile("Pay Type", activeConferenceList['payType']),
                    _buildDetailTile("Coupon Code", activeConferenceList['couponCode']),
                    _buildDetailTile("GST", activeConferenceList['gst']),
                    _buildDetailTile("Discount", activeConferenceList['discount']),
                    _buildDetailTile("Pay Amount", activeConferenceList['payAmount']),
                    _buildDetailTile("Purchase Date", activeConferenceList['purchaseDate']),

                    _buildDetailTile("Payment Status", activeConferenceList['bookingStatus'],
                        valueColor: activeConferenceList['bookingStatus'] == "Success"
                            ? AppColors.appSky
                            : Colors.orange),

                                    ],
                                  ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
//details
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
