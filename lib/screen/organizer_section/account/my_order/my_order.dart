

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/constant.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';


import 'my_order_view.dart';
class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {




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

  int _selectedIndex = 0;
  final TextEditingController controllerText = TextEditingController();
  bool isLoading = false;
  bool isInitialLoading = false;
  bool isLoadingEdit = false;
  String searchQuery = "";
  bool _isTextEmpty = true;




  int pageNo = 1;
  int totalPages = 0;
  int pageSize = 10;
  bool hasMoreData = true;




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
    var width = MediaQuery.of(context).size.width;


    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
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
            _buildToggleButton('Previous'
                '', 1),
          ],
        ),
      ),
      const SizedBox(height: 10),
      // Search Bar
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: 10),
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
      ),
    );
  }


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

  Widget _buildActiveSegment(double height, double width) {
    List<dynamic> activeConferenceList =
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
        'status': "Pending",
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
      'status': "Paid",
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
      'status': "Paid",
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
      'status': "Pending",
      "purchaseDate": "2024-12-19",
      'downloadReceipt': "assets/images/payment.png"

    },


    ];
    return   ListView.builder(
      itemCount: activeConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 12,),
      itemBuilder: (context, index) {
        final item = activeConferenceList[index];
        final status = item['status'] ?? 'Pending';
        final isPaid = status.toLowerCase() == "paid";

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(15),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Conference Title
              Text(
                "${item['id']}. ${item['conferenceName']}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FTextStyle.subtitle,

              ),
              SizedBox(height: 8),

              // Pay Type and Purchase Date
              Row(
                children: [
                  Icon(Icons.confirmation_number, size: 18, color:  AppColors.appSky),
                  const SizedBox(width: 6),
                  Text("Pay Type: ${item['payType']}", style: FTextStyle.style),
                  const Spacer(),
                  Icon(Icons.calendar_today, size: 18, color: AppColors.secondYellowColour),
                  const SizedBox(width: 6),
                  Text("${Constants.formatDate(item['purchaseDate'])}", style: FTextStyle.style),
                ],
              ),
              SizedBox(height: 4),

              // Invoice

              // Payment Status
              Row(
                children: [
                  Icon(Icons.payments, size: 18, color: AppColors.appSky),
                  const SizedBox(width: 6),
                  const Text('Payment Status: ', style: FTextStyle.style),
                  Text(
                    status,
                    style: FTextStyle.style.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPaid ? AppColors.textSecondaryPrimaryColor : Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  if (item['status'] == 'Paid')
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
                                    MyOrderView(id: item['id'].toString()??"",

                                    ),
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            width: 32,

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
                                  size: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),

                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: 32,
                            width: 32,

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
                                  size: 18,
                            ),
                          ),
                        ),


                      ],
                    ),


                  if (item['status'] == 'Pending')
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
                                    MyOrderView(id: item['id'].toString()??"",

                                    ),
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            width: 32,

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
                                  size: 18,
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),


                      ],
                    ),



                ],
              )


            ],
          ),
        );
      },
    );
  }
  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {
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
        'status': "Pending",
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
      'status': "Paid",
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
      'status': "Paid",
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
      'status': "Pending",
      "purchaseDate": "2024-12-19",
      'downloadReceipt': "assets/images/payment.png"

    },


    ];

    return   ListView.builder(
      itemCount: inactiveConferenceList.length,
      padding: const EdgeInsets.symmetric(horizontal: 12,),
      itemBuilder: (context, index) {
        final item = inactiveConferenceList[index];
        final status = item['status'] ?? 'Pending';
        final isPaid = status.toLowerCase() == "paid";

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(15),
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Conference Title
              Text(
                "${item['id']}. ${item['conferenceName']}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FTextStyle.subtitle,

              ),
              SizedBox(height: 8),

              // Pay Type and Purchase Date
              Row(
                children: [
                  Icon(Icons.confirmation_number, size: 18, color:  AppColors.appSky),
                  const SizedBox(width: 6),
                  Text("Pay Type: ${item['payType']}", style: FTextStyle.style),
                  const Spacer(),
                  Icon(Icons.calendar_today, size: 18, color: AppColors.secondYellowColour),
                  const SizedBox(width: 6),
                  Text("${Constants.formatDate(item['purchaseDate'])}", style: FTextStyle.style),
                ],
              ),
              SizedBox(height: 4),

              // Invoice

              // Payment Status
              Row(
                children: [
                  Icon(Icons.payments, size: 18, color: AppColors.appSky),
                  const SizedBox(width: 6),
                  const Text('Payment Status: ', style: FTextStyle.style),
                  Text(
                    status,
                    style: FTextStyle.style.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPaid ? AppColors.textSecondaryPrimaryColor : Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  if (item['status'] == 'Paid')
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
                                    MyOrderView(id: item['id'].toString()??"",

                                    ),
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            width: 32,

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
                                  size: 18,
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
                            height: 32,
                            width: 32,

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
                                  size: 18,
                            ),
                          ),
                        ),


                      ],
                    ),


                  if (item['status'] == 'Pending')
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
                                    MyOrderView(id: item['id'].toString()??"",

                                    ),
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            width: 32,

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
                                  size: 18,
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),


                      ],
                    ),



                ],
              )
            ],
          ),
        );
      },
    );
  }

  // Toggle Button Widget
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
              AppColors.appSky, // Green 0DB050
              AppColors.secondaryColour, // Blue 023E8A
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: _selectedIndex == index ? AppColors.appSky: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _selectedIndex == index ? AppColors.appSky : Colors.grey[400]!,
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
