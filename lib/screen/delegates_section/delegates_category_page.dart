import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/constant.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class DelegatesCategoryPage extends StatefulWidget {
  const DelegatesCategoryPage({super.key});

  @override
  State<DelegatesCategoryPage> createState() => _DelegatesCategoryPageState();
}

class _DelegatesCategoryPageState extends State<DelegatesCategoryPage> {
  List<dynamic> categoryList = [

    {
      'id': 1,
      "conferenceName": "30th ISCB International Conference (ISCBC-2025)",
      "category": "Accompanying Person",
    }, {
      'id': 2,

      "conferenceName": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
      "category": "	Indian Student/ Research Scholar",
    }, {
      'id': 3,
      "conferenceName": "30th ISCB International Conference (ISCBC-2025)",
      "category": "Accompanying Person",
    }, {
      'id': 4,
      "conferenceName": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
      "category": "	Indian Student/ Research Scholar",
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

            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: categoryList.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = categoryList[index];
                  return Container(
                    height: 120,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? const Color(0xFFFFF7E6) // Light yellow
                          : const Color(0xFFFF8D70).withOpacity(0.1),
                      // Light coral
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['conferenceName'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['category'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            _showRejectDialog(
                              context,
                              item['id'], // Pass the selected ID for identification
                                  () {
                                // Refresh callback after the dialog is closed
                                print("Dialog Closed, Refresh Callback");
                              },
                              item['category'], // Pass the initial category of the selected item
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0db050),
                              // Green background
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
      categoryList.clear();
      pageNo = 1;
      hasMoreData = true;
      totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
  }

  void _showRejectDialog(
      BuildContext context,
      int selectedIds, // Pass the selected ID for identifying the category
      Function refreshCallback,
      String initialCategory, // Pass the initial category when opening the dialog
      )
  {
    final formKey = GlobalKey<FormState>();
    final TextEditingController editController = TextEditingController();
    bool isButtonEnabled = false; // Initialize button state
    String? selectedCategory = initialCategory; // Use passed initial category

    // Ensure the category list has unique values
    final List<String> uniqueCategoryList = [
      ...Set<String>.from(Constants.categoryName)
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Add listener to monitor dropdown value changes
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              title: const Text(
                "Delegate Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView( // Wrap the content in a scroll view to avoid overflow
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8, // Adjust width to 80% of screen
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Delegate Category *",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        // Dropdown for Category Selection
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),// Add padding
                          child: DropdownButtonFormField<String>(
                            value: selectedCategory,
                            // Set selected category value
                            hint: const Text("Select category"),
                            items: uniqueCategoryList
                                .map((category) => DropdownMenuItem(
                              value: category,
                              child: Container(width: 200,
                                  child: Text(category)),
                            ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedCategory = newValue; // Update selected value
                                isButtonEnabled = newValue != null && newValue.isNotEmpty;
                              });
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a category.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed:

                  isButtonEnabled
                      ? () async {
                    setState(() {
                      if (formKey.currentState!
                          .validate()) {
                        print("Selected Category: $selectedCategory");

                        // Refresh the UI after updating the category
                        refreshCallback();
                        Navigator.of(context).pop();

                      } else {
                        formKey.currentState!.validate();
                      }
                    });
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? AppColors.appSky
                        : Colors.white70,// Disable if button not enabled
                  ),
                  child: const Text("Update"),
                ),
              ],
            );
          },
        );
      },
    );
  }


}
