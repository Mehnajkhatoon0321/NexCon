import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../utils/commonFunction.dart';
class ReviewAbstractView extends StatefulWidget {
  String id;
   ReviewAbstractView({ required this.id,super.key});

  @override
  State<ReviewAbstractView> createState() => _ReviewAbstractViewState();
}

class _ReviewAbstractViewState extends State<ReviewAbstractView> {


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





  bool isInitialLoading = false;


  @override
  void dispose() {

    super.dispose();
  }

  @override
  void initState() {
    super.initState();


  }
  Map<String, dynamic> errorServerMessage = {};
  String? errorMessage;
  Map<String, dynamic> activeConferenceList =
  {
    "id":"1",
    'conferenceName': "18th Indian Science Communication Congress (ISCC-2018)",
    "proposalType": "Lorem",
    "paperTitle":"vbncnbnnbnn",
    "dateOfSubmission":"12-05-2023",
    "status":"Success",
    "feeStatus":"Success",
    "Remark":"Chsnge some thingx",


  };


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
            'Accommodation View',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,

        ),
        body:  Column(
          children: [

            Expanded(

              child: isInitialLoading && activeConferenceList.isEmpty

                  ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount:activeConferenceList.length , // Number of shimmer placeholders
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
                  : (activeConferenceList.isEmpty)
                  ? const Center(
                child: Text("No  activeConferenceList available.",
                    style: FTextStyle.listTitle),

              )
                  :

              Column(
                children: [
                  Container(
                    height: height*0.06,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.5, 0.95, 0.95],
                        colors: [
                          Color(0xffffffff),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        activeConferenceList['conferenceName'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FTextStyle.listTitle,
                        textAlign:TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [



                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Proposal Type: ', style: FTextStyle.listTitle),
                              Text(
                                  activeConferenceList['proposalType'],
                                  style:FTextStyle.listTitleSub
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Date Of Submission: ', style: FTextStyle.listTitle),
                              Text(
                                activeConferenceList['dateOfSubmission'],
                                style:FTextStyle.listTitleSub,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Paper Title: ', style: FTextStyle.listTitle),
                              Text(
                                activeConferenceList['paperTitle'],
                                style:FTextStyle.listTitleSub,
                              ),
                            ],
                          ),
                        ),



                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Remark :', style: FTextStyle.listTitle),
                              Text(
                                activeConferenceList['Remark'],
                                style:FTextStyle.listTitleSub,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                'Booking Status: ', style: FTextStyle.listTitle),
                            Text(
                              activeConferenceList['status'],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: activeConferenceList['status'] == "Success"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text(
                                'Fee Status: ', style: FTextStyle.listTitle),
                            Text(
                              activeConferenceList['feeStatus'],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: activeConferenceList['feeStatus'] == "Success"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                                'Download ', style: FTextStyle.listTitle),
                            IconButton(
                              icon: const Icon(Icons.download_rounded, color: AppColors.appSky),
                              onPressed: () {

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Download fee receipt...")),
                                );
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),


      ),
    );
  }

}
