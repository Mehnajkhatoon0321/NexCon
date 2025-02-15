import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_conference/screen/delegates_section/bank_details/bank_view_details.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
import 'package:smart_conference/utils/form_field_style.dart';
class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({super.key});

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}



class _BankDetailsPageState extends State<BankDetailsPage> {

  bool _isTextEmpty = true;

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

  int pageNo = 1;
  int totalPages = 0;
  int pageSize = 10;
  bool hasMoreData = true;
  List<dynamic> data = [
    {
      "id":"1",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },

    {
      "id":"2",
      "title": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
    },  {
      "id":"3",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },

    {
      "id":"4",
      "title": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
    },  {
      "id":"5",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },

    {
      "id":"6",
      "title": "4th International Science Communication Conference & 24th Indian Science Communication Conference",
    },  {
      "id":"7",
      "title": "30th ISCB International Conference (ISCBC-2025)",
    },


  ];
  final controller = ScrollController();
  final TextEditingController controllerText = TextEditingController();
  bool isLoading = false;
  bool isInitialLoading = false;
  bool isLoadingEdit = false;
  String searchQuery = "";
  @override
  void dispose() {
    controllerText.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controllerText.addListener(() {
      setState(() {
        _isTextEmpty = controllerText.text.isEmpty;
      });
    });
    // BlocProvider.of<AllRequesterBloc>(context)
    //     .add(GetBillingListHandler("", pageNo, pageSize));
    paginationCall();
  }
  Map<String, dynamic> errorServerMessage = {};
  String? errorMessage;
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
      pageNo=1;
      // Call the API only after the user has stopped typing for 500 milliseconds
      // BlocProvider.of<AllRequesterBloc>(context).add(
      //     GetBillingListHandler(searchQuery, pageNo, pageSize));
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.white,

        body:  Column(
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

              child: isInitialLoading && data.isEmpty

                  ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 10, // Number of shimmer placeholders
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03, vertical: 5),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 10, color: Colors.grey),
                                  const SizedBox(height: 5),
                                  Container(
                                      height: 10, color: Colors.grey),
                                  const SizedBox(height: 5),
                                  Container(
                                      height: 10, color: Colors.grey),
                                ],
                              ),
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
                child: Text(
                  errorMessage ?? errorServerMessage.toString(),
                  style: FTextStyle.listTitle,
                  textAlign: TextAlign.center,
                ),
              )
                  : (data.isEmpty)
                  ? const Center(
                child: Text("No  data available.",
                    style: FTextStyle.listTitle),

              )
                  :ListView.builder(
                itemCount: data.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewBankDetails()));
                    },
                    child: Container(
                      // height: height*0.12,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? const Color(0xFFFFF7E6)
                            : const Color(0xFFFF8D70).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item['title']!,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 16,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              color: Color(0xFF0db050)),
                        ],
                      ),
                    ).animate().fadeIn(duration: 300.ms).slideX(
                      begin: 0.2,
                      curve: Curves.easeOut,
                    ),
                  );
                },
              ),

            ),
          ],
        ),


      ),
    );
  }

  void _clearText() {
    controllerText.clear();
    setState(() {
      _isTextEmpty = true;
      data.clear();
      pageNo = 1;
      hasMoreData = true;
      totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
    });
  }
}
