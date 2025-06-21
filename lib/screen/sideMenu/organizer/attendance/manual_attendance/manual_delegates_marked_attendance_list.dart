import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/qr_code/qr_attendance.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

import '../../registreation_all_types/fee_registration_for_delegates.dart';
import 'manual_attendance.dart';
class ManualDelegatesMarkedAttendanceList extends StatefulWidget {
  const ManualDelegatesMarkedAttendanceList({super.key});

  @override
  State<ManualDelegatesMarkedAttendanceList> createState() => _ManualDelegatesMarkedAttendanceListState();
}

class _ManualDelegatesMarkedAttendanceListState extends State<ManualDelegatesMarkedAttendanceList> {
  int pageNo = 1;
  int totalPages = 0;
  int pageSize = 10;
  bool hasMoreData = true;
  Set<int> selectedIndices = {};
  final controller = ScrollController();
  final TextEditingController controllerText = TextEditingController();
  bool isLoading = false;
  bool isInitialLoading = false;
  bool isLoadingEdit = false;
  String searchQuery = "";
  bool _isTextEmpty = true;
  List<String> selectedIds = [];
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

  final List<Map<String, String>> details = [
    {
      "id": "1",
      "registrationN0": "REG123",
      "accountName": "30th ISCB International Conference (ISCBC-2025)",
      "paymentMode": "PhonePay",
      "delegateName": "Dr. A. Sharma",
      "tnNumber": "2343546446",
      "tnDate": "2023-12-10",
      "couponCode": "EX001",
      "bankName": "HDFC",
      "amount": "23424343",
      "bookingStatus": "Pending",
      "feeDate": "2025-11-23",
      "fromDate": "2025-11-23",
      "toDate": "2025-12-24",
      "downloadReceipt": "https://example.com/receipt.pdf",
      "check_date": "12 dec 2025",
      "check_number": "233243233",
    }
  ];


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
      'title': "Category Name",
      "registrationNo": "1",
      "id": "1",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "delegatesName": " Name",
      "markedAttendance": "18 Dec- 2025 ,12:30 AM",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    }, {
      'title': "Category Name",
      "registrationNo": "2",
      "id": "2",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "delegatesName": " Name",
      "markedAttendance": "18 Dec- 2025 ,12:30 AM",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },{
      'title': "Category Name",
      "registrationNo": "2",
      "id": "3",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "delegatesName": " Name",
      "markedAttendance": " Not Marked",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
    {
      "id": "3",
      'title': "Category Name",
      "registrationNo": "2",
      'paymentStatus': "Pending",
      'bookingStatus': "Pending",
      "delegatesName": " Name",
      "markedAttendance": " Not Marked",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
    {
      'title': "Category Name",
      "registrationNo": "2",
      "id": "4",
      'bookingStatus': "Success",
      'paymentStatus': "Success",
      "delegatesName": " Name",
      "markedAttendance": " Not Marked",
      "delegatesCategory": "Delegates Category",
      "registrationDate": "2024-12-19",
      "country": "India",
      "city": "Lucknow",
      "sex": "Female",
      "email": "mahi@123mailinator.com"
    },
  ];
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
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
          'Delegate Registrations',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height:
                      35,

                      child: ElevatedButton(
                        onPressed: () async {

                          if (selectedIds.isEmpty) {

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No items selected. Please select at least one item.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {

                            // BlocProvider.of<AllRequesterBloc>(context).add(UnitActionHandler(
                            //   userID: PrefUtils.getUserId().toString(),
                            //   btnAssign: 'approve',
                            //   userRole: PrefUtils.getRole(),
                            //   count: selectedIds, // Count of selected IDs
                            // ));
                          }





                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: Text("Mark Attendance", style: FTextStyle.emailProfile),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QRScannerScreen()
                          ),
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 35,

                        decoration: BoxDecoration(
                          color:AppColors.secondYellowColour,
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
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),


                  ],
                ),
SizedBox(height: 20,),
                Container(
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
                        borderSide:
                        const BorderSide(color: AppColors.appSky, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide:
                        const BorderSide(color: AppColors.appSky, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide:
                        const BorderSide(color: AppColors.appSky, width: 1.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 18.0),
                      suffixIcon: _isTextEmpty
                          ? const Icon(Icons.search, color: AppColors.appSky)
                          : IconButton(
                        icon:
                        const Icon(Icons.clear, color: AppColors.appSky),
                        onPressed: _clearText,
                      ),
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                    onChanged: _onSearchChanged,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: activeConferenceList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemBuilder: (context, index) {
                final item = activeConferenceList[index];
                final bookingStatus = item['bookingStatus'] ?? 'Pending';

                return Row(
                  children: [
                    if (item['paymentStatus'] == 'Success'&&item['markedAttendance']==' Not Marked')
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: selectedIndices
                              .contains(index),
                          activeColor:
                          AppColors.appSky,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedIndices
                                    .add(index);
                                selectedIds.add(item['id']
                                    .toString()); // Add ID when checked
                              } else {
                                selectedIndices
                                    .remove(index);
                                selectedIds.remove(item[
                                'id']
                                    .toString()); // Remove ID when unchecked
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Title
                            Text(item['delegatesName'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: FTextStyle.subtitle),

                            /// Delegate Name
                            Row(
                              children: [
                                const Icon(Icons.person, size: 16, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  "Category Name: ${item['title']}",
                                  style: FTextStyle.style,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.mark_chat_read_rounded, size: 16, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  "Mark Attendance: ${item['markedAttendance']}",
                                  style: FTextStyle.style,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                const Icon(Icons.verified, size: 16, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  "Payment Status: ",
                                  style: FTextStyle.style,
                                ),
                                Text(
                                  item['paymentStatus'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: bookingStatus == "Success"
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),

                            // const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (item['paymentStatus'] == 'Success'&&item['markedAttendance']==' Not Marked')
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ManualAttendance(

                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        backgroundColor: AppColors.appSky,
                                        elevation: 2,
                                        minimumSize: const Size(80, 30),
                                      ),
                                      child: Text(
                                        "Mark Attendance Manually",
                                        style: FTextStyle.loginBtnStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                // Padding(
                                //   padding: const EdgeInsets.all(2.0),
                                //   child: ElevatedButton(
                                //     onPressed: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) => FreeRegistrationView(id: item['id'],
                                //
                                //           ),
                                //         ),
                                //       );
                                //     },
                                //     style: ElevatedButton.styleFrom(
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(30),
                                //       ),
                                //       backgroundColor: AppColors.appSky,
                                //       elevation: 2,
                                //       minimumSize: const Size(80, 30),
                                //     ),
                                //     child: Text(
                                //       "Fee Registration Details",
                                //       style: FTextStyle.loginBtnStyle.copyWith(
                                //         fontSize: 12,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                if (item['paymentStatus'] == 'Pending'||item['paymentStatus'] == 'Not Received'||item['paymentStatus'] == 'Not Registered')
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FeeRegistrationForDelegates(

                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        backgroundColor: AppColors.appSky,
                                        elevation: 2,
                                        minimumSize: const Size(80, 30),
                                      ),
                                      child: Text(
                                        "Update Payment Status",
                                        style: FTextStyle.loginBtnStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
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

  void _showBankDetailsDialog(BuildContext context) {
    final Map<String, String> data = details[0];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          color: AppColors.backgroundColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
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
                      if (data['bookingStatus']?.toLowerCase() == 'pending')
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () {
                            // Handle edit action here
                            Navigator.of(context).pop(); // Close dialog or open edit screen
                            // TODO: Implement your edit logic
                          },
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildDetailTile("Registration No.", data['registrationN0']),
                  _buildDetailTile("Delegate Name", data['delegateName']),
                  _buildDetailTile("Payment Mode", data['paymentMode']),
                  _buildDetailTile("Cheque/ Draft/ Transaction Date", data['check_date']),
                  _buildDetailTile("Cheque/ Draft/ Transaction Number", data['check_number']),
                  _buildDetailTile("Bank Name", data['bankName']),
                  _buildDetailTile("Amount", data['amount']),
                  _buildDetailTile("Coupon Code", data['couponCode']),
                  _buildDetailTile("Fee Payment Date", data['feeDate']),

                  // For Download Receipt, show download icon if not empty
                  _buildDetailTileWithIcon(
                    title: "Download Receipts",
                    value: data['downloadReceipt'],
                    icon: data['downloadReceipt']?.isNotEmpty == true
                        ? Icons.download
                        : null,
                    onIconPressed: () {
                      // Handle download action here
                      print('Download receipt tapped');
                    },
                  ),

                  _buildDetailTile(
                    "Booking Status",
                    data['bookingStatus'],
                    valueColor: data['bookingStatus']?.toLowerCase() == "success"
                        ? Colors.green
                        : Colors.orange,
                  ),

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
      ),
    );
  }

// Modified helper widget to support optional icon button
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
