import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexcon/screen/sideMenu/organizer/settings/coupon_code/add_coupon_code.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/common_popups.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class CouponCode extends StatefulWidget {
  const CouponCode({super.key});

  @override
  State<CouponCode> createState() => _CouponCodeState();
}

class _CouponCodeState extends State<CouponCode> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
  List<dynamic> activeConferenceList = [
    {
      "id":"1",
      "titleName":"Title Name",
      "code":"sd4324",
      "discountTypes":"DiscountType",
      "validFrom":"12-04-2025",
      "validTo":"12-05-2025",
      "usageLimit":"",
      "status":"active"

    },
{
      "id":"2",
      "titleName":"Title Name2",
      "code":"sd4324",
      "discountTypes":"DiscountType",
      "validFrom":"12-04-2025",
      "validTo":"12-05-2025",
      "usageLimit":"2",
      "status":"active"

    },
    {
      "id":"3",
      "titleName":"Title Name2",
      "code":"sd4324",
      "discountTypes":"DiscountType",
      "validFrom":"12-04-2025",
      "validTo":"12-05-2025",
      "usageLimit":"2",
      "status":"active"

    },


  ];

  @override
  Widget build(BuildContext context) {

    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType
        .toString()
        .split('.')
        .last;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
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
          'Coupon Code',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: (displayType == 'desktop' || displayType == 'tablet')
                  ? 70
                  : 37,
              child: ElevatedButton(
                  onPressed: () async {


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCouponCode(isEdit: '',)
                      ),

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
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      backgroundColor: Colors.white),
                  child: Text(
                    "Create",
                    style: FTextStyle.loginBtnStyle
                        .copyWith(color: AppColors.primaryColour,fontSize: 13),
                  )),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: 10),
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
            child:     ListView.builder(
            itemCount: activeConferenceList.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final item = activeConferenceList[index];

              // Provide default values for null fields
              final title = item['titleName'] ?? 'Unknown Title';
              final id = item['id'] ?? '0';

              final couponCode = item['code'] ?? 'N/A';
              final discountTypes = item['discountTypes'] ?? 'N/A';
              final validFrom = item['validFrom'] ?? 'N/A';
              final validTo = item['validTo'] ?? 'N/A';
              final usageLimit = item['usageLimit'] ?? 'N/A';

              final bookingStatus = item['bookingStatus'] ?? 'Pending';


              return Container(
                // height: height * 0.24,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
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
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.listTitle,
                    ),

                    const SizedBox(height: 8),

                    // Coupon Info
                    Text(
                      'Coupon Code: $couponCode',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
                    Text(
                      'Discount Types: $discountTypes',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),
                    Text(
                      'Usage Limit: $usageLimit',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FTextStyle.style,
                    ),



                    // Valid From/To in Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Valid From: $validFrom',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FTextStyle.style,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Valid To: $validTo',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FTextStyle.style,
                          ),
                        ),
                      ],
                    ),



                    // Booking Status
                    Row(
                      children: [
                        const Text('Booking Status: ', style: FTextStyle.listTitle),
                        Text(
                          bookingStatus,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: bookingStatus == "Success" ? Colors.green : Colors.orange,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddCouponCode(isEdit: 'Yes'),
                              ),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0db050),
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
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            CommonPopups.showDeleteCustomPopup(
                              context,
                              "Are you sure you want to delete?",
                                  () {
                                // Handle delete logic
                              },
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.red,
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


              ),
                ]),
              );
            },
          )
          ),
        ],
      ),
    );
  }

  // Toggle Button Widget




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
