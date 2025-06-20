import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class ScannerDetails extends StatefulWidget {
  const ScannerDetails({super.key});

  @override
  State<ScannerDetails> createState() => _ScannerDetailsState();
}


class _ScannerDetailsState extends State<ScannerDetails> {
  final Map<String, dynamic> scannerImageList = {
    "id": "1",
    "conferenceName": "30th ISCB International Conference (ISCBC-2025)",
    "delegateName": "Mahi",
    "delegateCategory": "Category",
    "QRCode": "", // Set path or keep empty
    "feeStatus": "Success",
    "abstractStatus": "Success",
    "accommodationStatus": "Success",
  };

  @override
  Widget build(BuildContext context) {
    final String qrCodePath = scannerImageList['QRCode'] ?? '';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Delegates User Details', style: FTextStyle.HeadingTxtWhiteStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: qrCodePath.isNotEmpty
                  ? Image.asset(
                qrCodePath,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              )
                  : Container(

                    decoration: BoxDecoration(color: AppColors.gray_2,),
                    child: Image.asset(
                      "assets/images/attendance_scanner.png",
                      width: 180,
                      height: 180,
                      fit: BoxFit.contain,
                    )
                  ),
            ),
            const SizedBox(height: 40),
            _buildDetailTile("Conference Name", scannerImageList["conferenceName"]),
            _buildDetailTile("Delegate Name", scannerImageList["delegateName"]),
            _buildDetailTile("Delegate Category", scannerImageList["delegateCategory"]),
            _buildDetailTile(
              "Abstract Status",
              scannerImageList["abstractStatus"],
              valueColor: scannerImageList["abstractStatus"] == "Success"
                  ? AppColors.appSky
                  : Colors.orange,
            ),
            _buildDetailTile(
              "Accommodation Status",
              scannerImageList["accommodationStatus"],
              valueColor: scannerImageList["accommodationStatus"] == "Success"
                  ? AppColors.appSky
                  : Colors.orange,
            ),
            _buildDetailTile(
              "Fee Status",
              scannerImageList["feeStatus"],
              valueColor: scannerImageList["feeStatus"] == "Success"
                  ? AppColors.appSky
                  : Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile(String title, String value, {Color? valueColor}) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Text(
                "$title:",
                style: FTextStyle.subtitle.copyWith(
                  fontSize: 15
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: valueColor != null
                    ? FTextStyle.style.copyWith(color: valueColor, fontWeight: FontWeight.bold)
                    : FTextStyle.style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


