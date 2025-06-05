import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
class PaperView extends StatefulWidget {
  String id ;
   PaperView({required this.id ,super.key});

  @override
  State<PaperView> createState() => _PaperViewState();
}

class _PaperViewState extends State<PaperView> {
  Map<String, dynamic> activeConferenceList =
  {
    "id":"1",
    'title': "30th ISCB International Conference (ISCBC-2025)",


    'proposalType': "Oral",
    'paperTitle': "Paper Title",
    'ramark': "Remark",
    'paperStatus': "Pending",
    'subtitle': "Lorem",
    'authorName': "Author Name",
    'authorNamePresenting': "Author Name Presenting",
    'keyword': "keyword",
    'description': "description ",

    "dateOfDate": "23-11-2025",
    "fromDate": "23-11-2025",
    "toDate": "24-12-2025",
    'abstracTopic': "30th ISCB International Conference (ISCBC-2025)",
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
            'Paper View',
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

                    SizedBox(height: 10,),
                    _buildDetailTile(
                        'Conference Name',
                        activeConferenceList['title']),
                    _buildDetailTile(
                      "Paper Title",
                      activeConferenceList['paperTitle'],
                    ),
                    _buildDetailTile(
                      "Proposal Type",
                      activeConferenceList['proposalType'],
                    ),
                _buildDetailTile(
                      "Author(s) Name",
                      activeConferenceList['authorName'],
                    ),
                _buildDetailTile(
                    "Presenting Author(s) Name",
                      activeConferenceList['authorNamePresenting'],
                    ),
                 _buildDetailTile(
                    'Keywords',
                      activeConferenceList['keyword'],
                    ),
                    _buildDetailTile(
                    'Description',
                      activeConferenceList['description'],
                    ),


                    _buildDetailTile(
                      "Paper Status",
                      activeConferenceList['paperStatus'],
                    ),
                    _buildDetailTile(
                      "Date of Submission",
                      activeConferenceList['dateOfDate'],
                    ),


                    Padding(
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
                                "Paper Upload",
                                style:
                                FTextStyle.listTitle.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 6,
                              child: _buildImage(activeConferenceList['gst_file']),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildImage(String? fileName) {
    if (fileName == null || fileName.isEmpty) {
      return const Text('No upload available.');
    }

    // Check file extension
    String extension = fileName.split('.').last.toLowerCase();

    // Assuming the fileName is a complete URL for network images
    String fileUrl = '/public/uploads/vendor/$fileName';

    if (extension == 'jpeg' || extension == 'jpg' || extension == 'png') {
      return Image.network(fileUrl, width: 200, height: 200); // Increased size
    } else if (extension == 'pdf') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              if (await canLaunch(fileUrl)) {
                await launch(fileUrl);
              } else {
                // Optionally show an error message or alert to the user
                throw 'Could not launch $fileUrl';
              }
            },
            child: const Text('View Pdf', style: TextStyle(color: Colors.blue)),
          ),
        ],
      );
    } else {
      return const Text('Unsupported file type.');
    }
  }
}
