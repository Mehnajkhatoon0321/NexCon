import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/commonFunction.dart';
class ManageScheduleView extends StatefulWidget {
  String id ;
   ManageScheduleView({required this.id,super.key});

  @override
  State<ManageScheduleView> createState() => _ManageScheduleViewState();
}

class _ManageScheduleViewState extends State<ManageScheduleView> {

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

  final controller = ScrollController();
  final TextEditingController controllerText = TextEditingController();
  bool isLoading = false;
  bool isInitialLoading = false;
  bool isLoadingEdit = false;
  String searchQuery = "";
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
    'title': "30th ISCB International Conference (ISCBC-2025)",
    'sessionName': "Session Name",
    'session_start_time': "Session Start Time",
    'session_end_time': "Session End Time",
    'name_chair': "Name of Chair	",
    'name_co_chair': "Name of Co-chair",
    'name_of_coordinator': "Name of Coordinator",
    'name_of_panelists': "Name of Panelists",
    'session_venue': "Session Venue",
    'bookingStatus': "Pending",

  }

  ;
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
            'Manage Schedule View',
            style: FTextStyle.HeadingTxtWhiteStyle,
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
                  : ListView(

                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.5, 0.95],
                        colors: [
                          Color(0xffffffff),
                          Color(0xf5c6f6da),
                          Color(0xf5c6f6da),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        activeConferenceList['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                        FTextStyle.listTitle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailTile("Session Name",
                      activeConferenceList['sessionName']),
                  _buildDetailTile("Name of Chair",
                      activeConferenceList['name_chair']),
                  _buildDetailTile("Name of Co-chair",
                      activeConferenceList['name_co_chair']),
                  _buildDetailTile("Name of Panelists",
                      activeConferenceList['name_of_panelists']),
                  _buildDetailTile("Session Venue",
                      activeConferenceList['session_venue']),
                  _buildDetailTile("Session Start Time",
                      activeConferenceList['session_start_time']),
                  _buildDetailTile("Session End Time",
                      activeConferenceList['session_end_time']),
                ],
              ),
            ),
          ],
        )



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
              flex: 4,
              child: Text(
                "$title:",
                style:
                FTextStyle.listTitle.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 6,
              child: Text(
                value,
                style: valueColor != null
                    ? FTextStyle.listTitleSub.copyWith(
                    color: valueColor, fontWeight: FontWeight.bold)
                    : FTextStyle.listTitleSub,
              ),
            ),
          ],
        ),
      ),
    );
  }



}
