import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';

import 'fee_registration_for_delegates.dart';
class FreeRegistrationView extends StatefulWidget {
  String id;
   FreeRegistrationView({required this.id,super.key});

  @override
  State<FreeRegistrationView> createState() => _FreeRegistrationViewState();
}

class _FreeRegistrationViewState extends State<FreeRegistrationView>{
  Map<String, dynamic> activeConferenceList =
  {
    "id":"1",
    "registrationN0":"1",
    'title': "30th ISCB International Conference (ISCBC-2025)",
    'paymentMode': "PhonePay",
    'delegateName': "Delegate Name",
    'tnNumber': "2343546446",
    'tnDate': "2023-12-10",
    'couponCode': "EX001",
    'bankName': "HDFC",
    'amount': "23424343",
    'bookingStatus': "Pending",
    'feeDate': "23-11-2025",
    'check_date': "23-11-2025",
    'check_number': "2025",
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
data:  MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
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
                child: Text("No activeConferenceList available.", style: FTextStyle.listTitle),
              )
                  :
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title row with optional edit icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Registration Fee Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (activeConferenceList['bookingStatus']?.toLowerCase() == 'pending')
                            IconButton(
                              icon: const Icon(Icons.edit, color:AppColors.appSky),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeeRegistrationForDelegates(

                                    ),
                                  ),
                                );
                                // Handle edit action here
                                // Navigator.of(context).pop(); // Close dialog or open edit screen
                                // TODO: Implement your edit logic
                              },
                            ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      _buildDetailTile("Registration No.", activeConferenceList['registrationN0']),
                      _buildDetailTile("Delegate Name", activeConferenceList['delegateName']),
                      _buildDetailTile("Payment Mode", activeConferenceList['paymentMode']),
                      _buildDetailTile("Cheque/ Draft/ Transaction Date", activeConferenceList['check_date']),
                      _buildDetailTile("Cheque/ Draft/ Transaction Number", activeConferenceList['check_number']),
                      _buildDetailTile("Bank Name", activeConferenceList['bankName']),
                      _buildDetailTile("Amount", activeConferenceList['amount']),
                      _buildDetailTile("Coupon Code", activeConferenceList['couponCode']),
                      _buildDetailTile("Fee Payment Date", activeConferenceList['feeDate']),

                      // For Download Receipt, show download icon if not empty
                      _buildDetailTileWithIcon(
                        title: "Download Receipts",
                        value: activeConferenceList['downloadReceipt'],
                        icon: activeConferenceList['downloadReceipt']?.isNotEmpty == true
                            ? Icons.download
                            : null,
                        onIconPressed: () {
                          // Handle download action here
                          print('Download receipt tapped');
                        },
                      ),

                      _buildDetailTile(
                        "Booking Status",
                        activeConferenceList['bookingStatus'],
                        valueColor: activeConferenceList['bookingStatus']?.toLowerCase() == "success"
                            ? Colors.green
                            : Colors.orange,
                      ),

                      // const SizedBox(height: 20),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: TextButton(
                      //     onPressed: () => Navigator.of(context).pop(),
                      //     child: const Text("Close"),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //
  // Widget _buildDetailTile(String title, String value, {Color? valueColor}) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     padding: const EdgeInsets.all(14),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 4,
  //           offset: Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 4,
  //           child: Text(
  //             "$title:",
  //             style: FTextStyle.listTitle.copyWith(fontWeight: FontWeight.w600),
  //           ),
  //         ),
  //         const SizedBox(width: 8),
  //         Expanded(
  //           flex: 6,
  //           child: Text(
  //             value,
  //             style: valueColor != null
  //                 ? FTextStyle.listTitleSub.copyWith(color: valueColor, fontWeight: FontWeight.bold)
  //                 : FTextStyle.listTitleSub,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildDetailTileWithIcon({
    required String title,
    String? value,
    IconData? icon,
    VoidCallback? onIconPressed,
    Color? valueColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (icon != null)
            IconButton(
              icon: Icon(icon, color: AppColors.appSky),
              onPressed: onIconPressed,
            )
          else
            Expanded(
              child: Text(
                value ?? '',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: valueColor ?? Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }

// Your original _buildDetailTile can remain unchanged for other rows
  Widget _buildDetailTile(String title, String? value, {Color? valueColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: valueColor ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
