import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_conference/screen/delegates_section/conference_sub_category.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
import 'dart:async';
class ConferenceCategory extends StatefulWidget {
  const ConferenceCategory({super.key});

  @override
  State<ConferenceCategory> createState() => _ConferenceCategoryState();
}

class _ConferenceCategoryState extends State<ConferenceCategory> {
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
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> FeaturesCategoryList = [
    {"id":"1",
      "title":"African Studies",
      "imageConference": "assets/images/IndianConferences.png",

    },

    {
      "id":"2",
      "title":"Anthropology",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"3",
      "title":"Asian Studies",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"4",
      "title":"Biology",
      "imageConference": "assets/images/IndianConferences.png",

    },

    {
      "id":"5",
      "title":"Chemistry",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"6",
      "title":"Culture",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {"id":"7",
      "title":"Chemistry",
      "imageConference": "assets/images/IndianConferences.png",

    },

    {
      "id":"8",
      "title":"Education",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"9",
      "title":"Social",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"10",
      "title":"English",
      "imageConference": "assets/images/IndianConferences.png",

    },

    {
      "id":"11",
      "title":"Math",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"12",
      "title":"History",
      "imageConference": "assets/images/IndianConferences.png",

    }, {
      "id":"13",
      "title":"Electronics and Electrical",
      "imageConference": "assets/images/IndianConferences.png",

    },{
      "id":"14",
      "title":"Environment",
      "imageConference": "assets/images/IndianConferences.png",

    },
    {
      "id":"15",
      "title":"Robotics",
      "imageConference": "assets/images/IndianConferences.png",

    },
  ];
  String searchQuery = "";
  bool _isTextEmpty = true;
  final TextEditingController controllerText = TextEditingController();

  void _clearText() {
    controllerText.clear();
    setState(() {
      _isTextEmpty = true;
      // data.clear();
      // pageNo = 1;
      // hasMoreData = true;
      // totalPages = 0;
      // BlocProvider.of<AllRequesterBloc>(context)
      //     .add(GetBillingListHandler("", pageNo, pageSize));
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
      // pageNo=1;
      // // Call the API only after the user has stopped typing for 500 milliseconds
      // BlocProvider.of<AllRequesterBloc>(context).add(
      //     GetBillingListHandler(searchQuery, pageNo, pageSize));
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));


    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          backgroundColor: AppColors.formFieldBackColour,
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
              'Conference Category',
              style: FTextStyle.HeadingTxtWhiteStyle,
            ),
            centerTitle: true,
          ),
          // backgroundColor:      Color(0xf5c6f6da),

          body:Center(
            child: Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     stops: [0.2, 0.5, 0.95, 0.3],
              //     colors: [
              //       Color(0xffffffff),
              //       Color(0xf5c6f6da),
              //       Color(0xf5c6f6da),
              //       Color(0xf5c6f6da),
              //     ],
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Align(
                //     alignment: Alignment.topLeft,
                //     child: Container(
                //       height: 42,
                //       width: 42,
                //       decoration: BoxDecoration(
                //         color: AppColors.appSky,
                //         borderRadius: BorderRadius.all(Radius.circular(25)),
                //       ),
                //       child: Align(
                //         alignment: Alignment.center, // Center the icon within the container
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 4.0),
                //           child: IconButton(
                //             icon: Icon(
                //               Icons.arrow_back_ios,
                //               color: Colors.white,
                //               size: 25,
                //             ), // Menu icon
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),


                    // SizedBox(height: 12,),
                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                    //     child: Text(
                    //       "Category Wise Conferences",
                    //       style: FTextStyle.headingMiddle,
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: 10),
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
                          onChanged:_onSearchChanged,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical, // Horizontal scroll
                        itemCount: FeaturesCategoryList.length ,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Show 2 items per row
                      mainAxisSpacing: 10,
                          crossAxisSpacing: 10
                        ),
                        itemBuilder: (context, index) {
                          final category = FeaturesCategoryList[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>SubCategoryScreen(id: category["id"], name: category["title"],)
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Fill color
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: AppColors.appSky,
                                    width: 1.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Shadow color with transparency
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 3), // Shadow position (x, y)
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Circular Image
                                      ClipOval(
                                        child: Image.asset(
                                          category["imageConference"],
                                          height: 70,
                                          width: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 4,),
                                      // Text below the image
                                      Expanded(
                                        child: Text(
                                          category["title"],
                                          style: FTextStyle.listTitle.copyWith(fontSize: 12),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),



                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

}
