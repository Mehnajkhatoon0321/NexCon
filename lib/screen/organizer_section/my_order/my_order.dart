

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/organizer_section/my_order/my_order_view.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';
class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<dynamic> inactiveConferenceList =
  [
    {
      "id":"1",
      "invoiceNumber":"1",
      "payType":"Offline",
      "creditPoint":"100",
      "amount":"100",
      "conferenceName": "4th International Science Communication Conference",
      "couponCode":"19ISCC90",
      "gst":"19ISCC90",
      "discount":"19ISCC90",
      "payAmount":"19ISCC90",
      'bookingStatus': "Paid",
      "purchaseDate": "2024-12-19",
      'downloadReceipt': "assets/images/payment.png"

    }, {
      "id":"2",
      "invoiceNumber":"1",
      "payType":"Offline",
      "creditPoint":"100",
      "amount":"100",
      "couponCode":"19ISCC90",
    "conferenceName": "4th International Science Communication Conference",
      "gst":"19ISCC90",
      "discount":"19ISCC90",
      "payAmount":"19ISCC90",
      'bookingStatus': "Paid",
      "purchaseDate": "2024-12-19",
    'downloadReceipt': "assets/images/payment.png"

    },{
      "id":"3",
      "invoiceNumber":"1",
      "payType":"Online",
      "creditPoint":"100",
      "amount":"100",
      "couponCode":"19ISCC90",
      "gst":"19ISCC90",
    "conferenceName": "4th International Science Communication Conference",
      "discount":"19ISCC90",
      "payAmount":"19ISCC90",
      'bookingStatus': "Paid",
      "purchaseDate": "2024-12-19",
    'downloadReceipt': "assets/images/payment.png"

    },{
      "id":"4",
      "invoiceNumber":"1",
      "payType":"Online",
      "creditPoint":"100",
      "amount":"100",
      "couponCode":"19ISCC90",
    "conferenceName": "4th International Science Communication Conference",
      "gst":"19ISCC90",
      "discount":"19ISCC90",
      "payAmount":"19ISCC90",
      'bookingStatus': "Paid",
      "purchaseDate": "2024-12-19",
     'downloadReceipt': "assets/images/payment.png"

    },


  ];



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

        body: Column(
          children: [
            Expanded(
              child: isLoading && inactiveConferenceList.isEmpty
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
                  : (inactiveConferenceList.isEmpty)
                  ? const Center(
                child: Text("No data available.", style: FTextStyle.listTitle),
              )
                  :    ListView.builder(
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
                      color: index % 2 == 0
                          ? const Color(0xFFFFF7E6)
                          : const Color(0xFFFF8D70).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
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
                                "${item['id'].toString()}. ${item['conferenceName'].toString()}!",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: FTextStyle.listTitle,
                              ),

                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number, size: 18, color: Colors.grey[600]),
                                  const SizedBox(width: 3),
                                  Text(
                                      "Pay Type: ${item['payType']}",
                                      style: FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),Row(
                                children: [
                                  Icon(Icons.app_registration, size: 18, color: Colors.grey[600]),
                                  const SizedBox(width: 3),
                                  Text(
                                      "Invoice Number: ${item['invoiceNumber']}",
                                      style: FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'Payment Status: ', style: FTextStyle.listTitleSub),
                                  Text(
                                    bookingStatus,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: bookingStatus == "Paid"
                                          ? Colors.green
                                          : Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
                                  const SizedBox(width: 3),
                                  Text(
                                      "${item['purchaseDate']}}",
                                      style: FTextStyle.listTitleSub
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  GestureDetector(

                                    onTap: () {
                                      String orderId = item['id'] ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MyOrderView(id: orderId,

                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,

                                      decoration: BoxDecoration(
                                        color:AppColors.gray_4,
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
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                },
              )
    )


          ],
        ),
      ),
    );
  }




}
