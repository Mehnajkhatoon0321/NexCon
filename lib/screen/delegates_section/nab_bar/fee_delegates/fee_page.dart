import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/delegates_section/nab_bar/fee_delegates/pay_registaration_fee.dart';
import 'package:nexcon/utils/colours.dart';

import 'package:nexcon/utils/common_popups.dart';

import 'package:nexcon/utils/font_text_Style.dart';


import 'fee_page_view.dart';

class FeePage extends StatefulWidget {
  const
  FeePage({super.key});

  @override
  State<FeePage> createState() => _FeePageState();
}

class _FeePageState extends State<FeePage> {
  final List<Map<String, String>> details = [
    {"Account Name": "Indian Society of Chemists and Biologists Science and Technology"},
    {"Bank Name": "State Bank of India"},
    {"Bank Address": "Central Drug Research Institute, Sector-10, Jankipuram Extension, Sitapur Road, Lucknow, UP, INDIA, 226031"},
    {"Type of Account": "Saving"},
    {"Account Number": "10863773532"},
    {"IFSC": "SBIN0010174"},
    {"Swift Code": "SBININBB157"},
    {"UPI ID": "SBININBB157"},
  ];
  List<dynamic> feeList = [
    {"id":"1",
      'title':"30th ISCB International Conference (ISCBC-2025)",
      'paymentMode': "PhonePay",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC",
      'amount': "23424343",
      'status': "Pending",
      'downloadReceipt': "assets/images/payment.png"
    },
    {
      "id":"2",
      'title':"4th International Science Communication Conference & 24th Indian Science Communication Conference",
      'paymentMode': "PhonePay",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC fgdfgfffgfhgfhgfhgfhfghgfhgghbfghgfhg",
      'amount': "23424343",
      'status': "Success",
      'downloadReceipt': "assets/images/payment.png"
    },{
      "id":"1",
    'title':"30th ISCB International Conference (ISCBC-2025)",

      'paymentMode': "COD",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC",
      'amount': "23424343",
      'status': "Pending",
      'downloadReceipt': "assets/images/payment.png"
    },
    {'title':"30th ISCB International Conference (ISCBC-2025)",
      'paymentMode': "PhonePay",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC fgdfgfffgfhgfhgfhgfhfghgfhgghbfghgfhg",
      'amount': "23424343",
      'status': "Success",
      'downloadReceipt': "assets/images/payment.png"
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
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
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
                _buildToggleButton('Previous', 1),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: 10),
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
  // Active Segment
  Widget _buildActiveSegment(double height, double width) {
    List<dynamic> feeList = [
      {"id":"1",
        'title':"30th ISCB International Conference (ISCBC-2025)",
        'paymentMode': "PhonePay",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC",
        'amount': "23424343",
        'status': "Not Upload",
        'downloadReceipt': "assets/images/payment.png"
      },
      {
        "id":"2",
        'title':"4th International Science Communication Conference & 24th Indian Science Communication Conference",
        'paymentMode': "PhonePay",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC fgdfgfffgfhgfhgfhgfhfghgfhgghbfghgfhg",
        'amount': "23424343",
        'status': "Success",
        'downloadReceipt': "assets/images/payment.png"
      },{
        "id":"1",
        'title':"30th ISCB International Conference (ISCBC-2025)",

        'paymentMode': "COD",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC",
        'amount': "23424343",
        'status': "Pending",
        'downloadReceipt': "assets/images/payment.png"
      },
      {'title':"30th ISCB International Conference (ISCBC-2025)",
        'paymentMode': "PhonePay",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC fgdfgfffgfhgfhgfhgfhfghgfhgghbfghgfhg",
        'amount': "23424343",
        'status': "Success",
        'downloadReceipt': "assets/images/payment.png"
      }
    ];

    return
      ListView.builder(
        itemCount: feeList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = feeList[index];
          return Container(
            // height: height*0.3,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                          item['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:FTextStyle.listTitle
                      ),
                      const SizedBox(height: 2),



                      Row(
                        children: [
                          const Text(
                              'Payment Status: ',
                              style: FTextStyle.listTitle
                          ),
                          Text(
                            item['status'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: item['status'] == "Success"
                                  ? AppColors.appSky
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(

                              onPressed: () => _showBankDetailsDialog(context),

                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: AppColors.appSky,
                                elevation: 2,
                                minimumSize: const Size(80, 30),
                              ),
                              child: Text(
                                "View Bank Details",
                                style: FTextStyle.loginBtnStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [


                                if (item['status'] == 'Success')
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
                                                  FeePageView(id: "",

                                                  ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,

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
                                            size: 20,
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
                                          height: 35,
                                          width: 35,

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
                                            size: 20,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),

                                if (item['status'] == 'Not Upload')
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
                                                  FeePageView(id: "",

                                                  ),
                                            ),
                                          );

                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,

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
                                            size: 20,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10,),

                                      GestureDetector(
                                        onTap: () async {

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  PayRegistrationFee(bankName: item['bankName'], tnNumber: item['tnNumber'], date: item['tnDate'], amount: item['amount'], image: item['downloadReceipt'], title: item['title'], paymentMode: item['paymentMode'],)),
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
                                            Icons.add,
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
                                                  FeePageView(id: "",

                                                  ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,

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
                                            size: 20,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10,),

                                      GestureDetector(
                                        onTap: () async {


                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  PayRegistrationFee(bankName: item['bankName'], tnNumber: item['tnNumber'], date: item['tnDate'], amount: item['amount'], image: item['downloadReceipt'], title: item['title'], paymentMode: item['paymentMode'],)),
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

                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) =>
                                //             FeePageView(id: "",
                                //
                                //             ),
                                //       ),
                                //     );
                                //   },
                                //   child: Container(
                                //     height: 35,
                                //     width: 35,
                                //
                                //     decoration: BoxDecoration(
                                //       color:AppColors.secondaryColour,
                                //       // Green for edit
                                //       borderRadius: BorderRadius.circular(8),
                                //       boxShadow: [
                                //         BoxShadow(
                                //           color: Colors.black.withOpacity(0.1),
                                //           blurRadius: 6,
                                //           offset: const Offset(0, 2),
                                //         ),
                                //       ],
                                //     ),
                                //     child: const Icon(
                                //       Icons.remove_red_eye_outlined,
                                //       color: Colors.white,
                                //       size: 20,
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(width: 10,),
                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(builder: (context) =>  PayRegistrationFee(bankName: item['bankName'], tnNumber: item['tnNumber'], date: item['tnDate'], amount: item['amount'], image: item['downloadReceipt'], title: item['title'], paymentMode: item['paymentMode'],)),
                                //     );
                                //   },
                                //   child: Container(
                                //     height: 35,
                                //     width: 35,
                                //
                                //     decoration: BoxDecoration(
                                //       color: const Color(0xFF0db050), // Green for edit
                                //       borderRadius: BorderRadius.circular(8),
                                //       boxShadow: [
                                //         BoxShadow(
                                //           color: Colors.black.withOpacity(0.1),
                                //           blurRadius: 6,
                                //           offset: const Offset(0, 2),
                                //         ),
                                //       ],
                                //     ),
                                //     child: const Icon(
                                //       Icons.edit,
                                //       color: Colors.white,
                                //       size: 20,
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(width: 10,),
                                // GestureDetector(
                                //   onTap: () {
                                //     CommonPopups
                                //         .showDeleteCustomPopup(
                                //       context,
                                //       "Are you sure you want to delete?",
                                //           () {
                                //         // BlocProvider.of<
                                //         //     AllRequesterBloc>(
                                //         //     context)
                                //         //     .add(DeleteBillingHandlers(
                                //         //     data[index]
                                //         //     [
                                //         //     'id']));
                                //       },
                                //     );
                                //   },
                                //   child: Container(
                                //     height: 35,
                                //     width: 35,
                                //     decoration: BoxDecoration(
                                //       color: Colors.red, // Red for delete
                                //       borderRadius: BorderRadius.circular(8),
                                //       boxShadow: [
                                //         BoxShadow(
                                //           color: Colors.black.withOpacity(0.1),
                                //           blurRadius: 6,
                                //           offset: const Offset(0, 2),
                                //         ),
                                //       ],
                                //     ),
                                //     child: const Icon(
                                //       Icons.delete,
                                //       color: Colors.white,
                                //       size: 20,
                                //     ),
                                //   ),
                                // ),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                // Right Column: Action Buttons

              ],
            ),

          );
        },
      );

  }

  // Inactive Segment
  Widget _buildInActiveSegment(double height, double width) {
    List<dynamic> inFeeList = [
      {"id":"1",
        'title':"30th ISCB International Conference (ISCBC-2025)",
        'paymentMode': "PhonePay",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC",
        'amount': "23424343",
        'status': "Pending For Review",
        'downloadReceipt': "assets/images/payment.png"
      },
      {
        "id":"2",
        'title':"4th International Science Communication Conference & 24th Indian Science Communication Conference",
        'paymentMode': "PhonePay",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC fgdfgfffgfhgfhgfhgfhfghgfhgghbfghgfhg",
        'amount': "23424343",
        'status': "Success",
        'downloadReceipt': "assets/images/payment.png"
      },{
        "id":"1",
        'title':"30th ISCB International Conference (ISCBC-2025)",

        'paymentMode': "COD",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC",
        'amount': "23424343",
        'status': "Pending For Review",
        'downloadReceipt': "assets/images/payment.png"
      },
      {'title':"30th ISCB International Conference (ISCBC-2025)",
        'paymentMode': "PhonePay",
        'tnNumber': "2343546446",
        'tnDate': "2023-12-10",
        'bankName': "HDFC fgdfgfffgfhgfhgfhgfhfghgfhgghbfghgfhg",
        'amount': "23424343",
        'status': "Pending For Review",
        'downloadReceipt': "assets/images/payment.png"
      }
    ];
    return
      ListView.builder(
        itemCount: inFeeList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = inFeeList[index];
          return Container(
            // height: height*0.3,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                          item['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:FTextStyle.listTitle
                      ),
                      const SizedBox(height: 2),
                      // Text(
                      //     'Payment Mode: ${item['paymentMode']}',
                      //     maxLines: 1,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: FTextStyle.style
                      // ),
                      //
                      //
                      // Text(
                      //   'Date: ${Constants.formatDate(item['tnDate'])}',
                      //   style:FTextStyle.style,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      //
                      // Container(
                      //   width: width/2,
                      //   child: Text(
                      //     'Amount: ${item['amount']}',
                      //     style: FTextStyle.style
                      //     ,  maxLines: 1,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),




                      Row(
                        children: [
                          const Text(
                              'Payment Status: ',
                              style: FTextStyle.listTitle
                          ),
                          Text(
                            item['status'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: item['status'] == "Success"
                                  ? AppColors.appSky
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton(

                                onPressed: () => _showBankDetailsDialog(context),

                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: AppColors.appSky,
                                  elevation: 2,
                                  minimumSize: const Size(80, 30),
                                ),
                                child: Text(
                                  "View Bank Details",
                                  style: FTextStyle.loginBtnStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            if (item['status'] == 'Success')
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
                                              FeePageView(id: "",

                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,

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
                                        size: 20,
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
                                      height: 35,
                                      width: 35,

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
                                        size: 20,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            if (item['status'] == 'Pending For Review')

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FeePageView(id: "",

                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 35,
                                width: 35,

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
                                  size: 20,
                                ),
                              ),
                            ),
                            // SizedBox(width: 10,),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(builder: (context) =>  PayRegistrationFee(bankName: item['bankName'], tnNumber: item['tnNumber'], date: item['tnDate'], amount: item['amount'], image: item['downloadReceipt'], title: item['title'], paymentMode: item['paymentMode'],)),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 35,
                            //     width: 35,
                            //
                            //     decoration: BoxDecoration(
                            //       color: const Color(0xFF0db050), // Green for edit
                            //       borderRadius: BorderRadius.circular(8),
                            //       boxShadow: [
                            //         BoxShadow(
                            //           color: Colors.black.withOpacity(0.1),
                            //           blurRadius: 6,
                            //           offset: const Offset(0, 2),
                            //         ),
                            //       ],
                            //     ),
                            //     child: const Icon(
                            //       Icons.edit,
                            //       color: Colors.white,
                            //       size: 20,
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(width: 10,),
                            // GestureDetector(
                            //   onTap: () {
                            //     CommonPopups
                            //         .showDeleteCustomPopup(
                            //       context,
                            //       "Are you sure you want to delete?",
                            //           () {
                            //         // BlocProvider.of<
                            //         //     AllRequesterBloc>(
                            //         //     context)
                            //         //     .add(DeleteBillingHandlers(
                            //         //     data[index]
                            //         //     [
                            //         //     'id']));
                            //       },
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 35,
                            //     width: 35,
                            //     decoration: BoxDecoration(
                            //       color: Colors.red, // Red for delete
                            //       borderRadius: BorderRadius.circular(8),
                            //       boxShadow: [
                            //         BoxShadow(
                            //           color: Colors.black.withOpacity(0.1),
                            //           blurRadius: 6,
                            //           offset: const Offset(0, 2),
                            //         ),
                            //       ],
                            //     ),
                            //     child: const Icon(
                            //       Icons.delete,
                            //       color: Colors.white,
                            //       size: 20,
                            //     ),
                            //   ),
                            // ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                // Right Column: Action Buttons

              ],
            ),

          );
        },
      );
  }

  // Widget build(BuildContext context) {
  //   var height = MediaQuery
  //       .of(context)
  //       .size
  //       .height;
  //   final screenWidth = MediaQuery
  //       .of(context)
  //       .size
  //       .width;
  //   var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
  //   var displayType = valueType
  //       .toString()
  //       .split('.')
  //       .last;
  //
  //   return MediaQuery(
  //     data: MediaQuery.of(context).copyWith(
  //         textScaler: const TextScaler.linear(1.0)),
  //     child: Scaffold(
  //       backgroundColor: AppColors.backgroundColor,
  //       body: Column(
  //         children: [
  //           SizedBox(height: 10,),
  //           Padding(
  //             padding: EdgeInsets.symmetric(
  //                 horizontal: 15, vertical: 10),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(23.0),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black.withOpacity(0.2),
  //                     spreadRadius: 2,
  //                     blurRadius: 4,
  //                     offset: const Offset(0, 1),
  //                   ),
  //                 ],
  //               ),
  //               child: TextFormField(
  //                 controller: controllerText,
  //                 decoration: FormFieldStyle.searchDecoration.copyWith(
  //                   suffixIcon: _isTextEmpty
  //                       ? const Icon(Icons.search,
  //                       color: AppColors.appSky)
  //                       : IconButton(
  //                     icon: const Icon(Icons.clear,
  //                         color: AppColors.appSky),
  //                     onPressed: _clearText,
  //                   ),
  //                 ),
  //                 onChanged:_onSearchChanged,
  //               ),
  //             ),
  //           ),
  //
  //
  //           const SizedBox(height: 10,),
  //     Expanded(
  //       child: ListView.builder(
  //         itemCount: feeList.length,
  //         padding: const EdgeInsets.symmetric(horizontal: 16),
  //         itemBuilder: (context, index) {
  //           final item = feeList[index];
  //           return Container(
  //             // height: height*0.3,
  //             margin: const EdgeInsets.symmetric(vertical: 8),
  //             padding: const EdgeInsets.all( 16),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(16),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(0.1),
  //                   blurRadius: 8,
  //                   offset: const Offset(0, 4),
  //                 ),
  //               ],
  //             ),
  //             child: Row(
  //               children: [
  //                 // Left Column: Payment Details
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //
  //                       Text(
  //                         item['title'],
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                         style:FTextStyle.listTitle
  //                       ),
  //                       const SizedBox(height: 2),
  //                       Text(
  //                         'Payment Mode: ${item['paymentMode']}',
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: FTextStyle.style
  //                       ),
  //
  //
  //                       Text(
  //                         'Date: ${item['tnDate']}',
  //                         style:FTextStyle.style,
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //
  //                       Container(
  //                         width: screenWidth/2,
  //                         child: Text(
  //                           'Amount: ${item['amount']}',
  //                           style: FTextStyle.style
  //                             ,  maxLines: 1,
  //                           overflow: TextOverflow.ellipsis,
  //                         ),
  //                       ),
  //
  //
  //
  //
  //                       Row(
  //                         children: [
  //                           const Text(
  //                             'Status: ',
  //                               style: FTextStyle.listTitle
  //                           ),
  //                           Text(
  //                             item['status'],
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.bold,
  //                               color: item['status'] == "Success"
  //                                   ? AppColors.appSky
  //                                   : Colors.orange,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.all(2.0),
  //                             child: ElevatedButton(
  //
  //                                 onPressed: () => _showBankDetailsDialog(context),
  //
  //                               style: ElevatedButton.styleFrom(
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(30),
  //                                 ),
  //                                 backgroundColor: AppColors.appSky,
  //                                 elevation: 2,
  //                                 minimumSize: const Size(80, 30),
  //                               ),
  //                               child: Text(
  //                                 "View Bank Details",
  //                                 style: FTextStyle.loginBtnStyle.copyWith(
  //                                   fontSize: 12,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //
  //                           Padding(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.end,
  //                               children: [
  //
  //
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                         builder: (context) =>
  //                                             FeePageView(id: "",
  //
  //                                             ),
  //                                       ),
  //                                     );
  //                                   },
  //                                   child: Container(
  //                                     height: 35,
  //                                     width: 35,
  //
  //                                     decoration: BoxDecoration(
  //                                       color:AppColors.secondaryColour,
  //                                       // Green for edit
  //                                       borderRadius: BorderRadius.circular(8),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: Colors.black.withOpacity(0.1),
  //                                           blurRadius: 6,
  //                                           offset: const Offset(0, 2),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     child: const Icon(
  //                                       Icons.remove_red_eye_outlined,
  //                                       color: Colors.white,
  //                                       size: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(width: 10,),
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(builder: (context) =>  PayRegistrationFee(bankName: item['bankName'], tnNumber: item['tnNumber'], date: item['tnDate'], amount: item['amount'], image: item['downloadReceipt'], title: item['title'], paymentMode: item['paymentMode'],)),
  //                                     );
  //                                   },
  //                                   child: Container(
  //                                     height: 35,
  //                                     width: 35,
  //
  //                                     decoration: BoxDecoration(
  //                                       color: const Color(0xFF0db050), // Green for edit
  //                                       borderRadius: BorderRadius.circular(8),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: Colors.black.withOpacity(0.1),
  //                                           blurRadius: 6,
  //                                           offset: const Offset(0, 2),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     child: const Icon(
  //                                       Icons.edit,
  //                                       color: Colors.white,
  //                                       size: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(width: 10,),
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     CommonPopups
  //                                         .showDeleteCustomPopup(
  //                                       context,
  //                                       "Are you sure you want to delete?",
  //                                           () {
  //                                         // BlocProvider.of<
  //                                         //     AllRequesterBloc>(
  //                                         //     context)
  //                                         //     .add(DeleteBillingHandlers(
  //                                         //     data[index]
  //                                         //     [
  //                                         //     'id']));
  //                                       },
  //                                     );
  //                                   },
  //                                   child: Container(
  //                                     height: 35,
  //                                     width: 35,
  //                                     decoration: BoxDecoration(
  //                                       color: Colors.red, // Red for delete
  //                                       borderRadius: BorderRadius.circular(8),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: Colors.black.withOpacity(0.1),
  //                                           blurRadius: 6,
  //                                           offset: const Offset(0, 2),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     child: const Icon(
  //                                       Icons.delete,
  //                                       color: Colors.white,
  //                                       size: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //
  //                     ],
  //                   ),
  //                 ),
  //                 // Right Column: Action Buttons
  //
  //               ],
  //             ),
  //
  //           );
  //         },
  //       ),
  //     ),
  //
  //
  //
  //
  //     ],
  //       ),
  //     ),
  //   );
  // }

  void _clearText() {
    controllerText.clear();
    setState(() {
      _isTextEmpty = true;
      feeList.clear();
      pageNo = 1;
      hasMoreData = true;
      totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
  }
  void _showBankDetailsDialog(BuildContext context) {
    showDialog(

      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: AppColors.backgroundColor,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Header Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "Account Name",
                        style: FTextStyle.subheading,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        details[0]["Account Name"]!,
                         style: FTextStyle.subtitle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Dynamic List Section
                ...details.skip(1).map(
                      (detail) {
                    final key = detail.keys.first;
                    final value = detail.values.first;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
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
                          Text(
                            key,
                            style: FTextStyle.subtitle,
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Text(
                              value,
                              textAlign: TextAlign.end,
                              style: FTextStyle.style,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Close"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}