import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
class AbstractOrganizerView extends StatefulWidget {
  String id;
  AbstractOrganizerView({required this.id,super.key});

  @override
  State<AbstractOrganizerView> createState() => _AbstractOrganizerViewState();
}

class _AbstractOrganizerViewState extends State<AbstractOrganizerView> {
  Map<String, dynamic> activeConferenceList =
  {
    "id":"1",
    'title': "30th ISCB International Conference (ISCBC-2025)",



    'ramark': "Remark",
    'paperStatus': "Pending",
    'abstracTopic': "Lorem",

    "dateOfDate": "23-11-2025",
    "fromDate": "23-11-2025",
    "toDate": "24-12-2025",
  }

  ;


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


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor:AppColors.backgroundColor,
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
            'Abstract Paper View',
            style: FTextStyle.appBarTitleWhite,
          ),
          centerTitle: true,

        ),
        body: Column(
          children: [
            Expanded(
              child: isInitialLoading && activeConferenceList.isEmpty
                  ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
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
                    );
                  },
                ),
              )
                  : (errorMessage != null || errorServerMessage.isNotEmpty)
                  ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    errorMessage ?? errorServerMessage.toString(),
                    style: FTextStyle.listTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
                  : activeConferenceList.isEmpty
                  ? const Center(
                child: Text("No data available.",
                    style: FTextStyle.listTitle),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                child: ListView(
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 12),
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     gradient: const LinearGradient(
                    //       begin: Alignment.topRight,
                    //       end: Alignment.bottomLeft,
                    //       stops: [0.0, 0.5],
                    //       colors: [
                    //         Color(0xffffffff),
                    // AppColors.appSky,
                    //
                    //
                    //       ],
                    //     ),
                    //     // borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       activeConferenceList['title'],
                    //       maxLines: 2,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: FTextStyle.listTitle.copyWith(fontSize: 16,color: AppColors.cardColor),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    SizedBox(height: 10,),
                    _buildDetailTile(
                        'Conference Name',
                        activeConferenceList['title']),

                    _buildDetailTile(
                      "Abstract Session/Themes",
                      activeConferenceList['abstracTopic'],
                    ),

                    _buildDetailTile(
                      "Remark",
                      activeConferenceList['ramark'],
                    ),
                    _buildDetailTile(
                      "Abstract Paper Status",
                      activeConferenceList['paperStatus'],
                    ),
                    _buildDetailTile(
                      "Date of Submission",
                      activeConferenceList['dateOfDate'],
                    ),



                  ],
                ),
              ),
            ),
          ],
        ),



      ),
    );
  }
  Widget _buildDetailTile(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Text(
                "$title:",
                style:
                FTextStyle.subtitle.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 6,
              child: Text(
                value,
                style: valueColor != null
                    ? FTextStyle.style.copyWith(
                    color: valueColor, fontWeight: FontWeight.bold)
                    : FTextStyle.style,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
