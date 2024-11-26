import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
import 'package:smart_conference/utils/form_field_style.dart';
class FeePage extends StatefulWidget {
  const FeePage({super.key});

  @override
  State<FeePage> createState() => _FeePageState();
}

class _FeePageState extends State<FeePage> {
  List<dynamic> feeList = [
    {
      'paymentMode': "PhonePay",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC",
      'amount': "23424343",
      'status': "Pending",
      'downloadReceipt': "assets/images/payment.png"
    },
    {
      'paymentMode': "PhonePay",
      'tnNumber': "2343546446",
      'tnDate': "2023-12-10",
      'bankName': "HDFC",
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
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType
        .toString()
        .split('.')
        .last;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02, vertical: 10),
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
                  decoration: FormFieldStyle.searchDecoration.copyWith(
                    suffixIcon: _isTextEmpty
                        ? const Icon(Icons.search,
                        color: AppColors.appSky)
                        : IconButton(
                      icon: const Icon(Icons.clear,
                          color: AppColors.appSky),
                      onPressed: _clearText,
                    ),
                  ),
                  onChanged:_onSearchChanged,
                ),
              ),
            ),


            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: feeList.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = feeList[index];
                  return Container(
                    height: 160,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? const Color(0xFFFFF7E6) // Light yellow
                          : const Color(0xFFFF8D70).withOpacity(0.1), // Light coral
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Column: Text Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['paymentMode'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'TN Number: ${item['tnNumber']}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Date: ${item['tnDate']}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Status: ${item['status']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: item['status'] == "Success"
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right Side: Image and Actions
                        // Action Buttons (Edit & Delete)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle Edit action
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0db050), // Green background
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
                            GestureDetector(
                              onTap: () {
                                // Handle Delete action
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.red, // Red background for Delete
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
                      ],
                    ),
                  );
                },
              ),
            )



          ],
        ),
      ),
    );
  }

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
}