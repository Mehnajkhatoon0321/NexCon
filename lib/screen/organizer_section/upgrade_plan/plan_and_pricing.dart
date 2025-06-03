import 'package:flutter/material.dart';
import 'package:nexcon/screen/authFlow/organizer_register.dart';
import 'package:nexcon/screen/authFlow/selection_role.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class PricingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Plans & Pricing',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 10,
                dataRowMinHeight: 50, // increase height
                dataRowMaxHeight: 110,
                border: TableBorder.all(),
                columns: [
                  DataColumn(label: _tableHeaderText("Service")),
                  DataColumn(label: _tableHeaderText("BASIC")),
                  DataColumn(label: _tableHeaderText("PRO")),
                  DataColumn(label: _tableHeaderText("ELITE")),
                ],
                rows: _pricingRows(context),
              ),
            ),
            SizedBox(height: 20),
           Text("Service Terms",style: FTextStyle.listTitle,),
            SizedBox(height: 10),
            ...[
              '* GST of 18% to be paid additionally on Smart Conference Service Fee (not on the Fees received from Delegates)',
              '** Service currently available for Conferences organized within India. Payment gateway transaction charges (2% on Domestic Cards & Net Banking, 3% on International Cards) will be deducted from Fees received from Delegates.',
              '*** Service currently available for Conferences organized within India. For conferences outside India our team will get in touch with you with the best proposal.',
              'Smart Conference Service Fee would be calculated on total number of delegate registrations received.',
              'Registration Fee received from delegates will be transferred to you via Wire Transfer.',
              'Fees received in foreign currency will be transferred to you in USD via Wire Transfer. Currency exchange rate would depend on the receivers\nbank.'

                 ].map((item) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 6,),
                Expanded(
                  child: Text(
                    item,
                    style: FTextStyle.style,
                  ),
                ),

              ],
            )).toList(),
          ],
        ),
      ),
    );
  }

  Text _tableHeaderText(String text) {
    return Text(
      text,
      style: FTextStyle.subheading,
      textAlign: TextAlign.center,
    );
  }

  List<DataRow> _pricingRows(BuildContext context) {
    return  [
    _buildRow("Smart Conference Service Fee", "Nil", "INR 50*", "Request A Quote", isHeader: true),
    _buildRow("FREE Conference Listing", "✔️", "✔️", "✔️"),
    _buildRow("Single Login for Multiple Conferences", "✔️", "✔️", "✔️"),
    _buildRow("Featured Conference Listing", "", "✔️", "✔️"),
    _buildRow("Email Alerts for New Conferences", "", "✔️", "✔️"),
    _buildRow("Monthly Email Reminders", "", "✔️", "✔️"),
    _buildRow("Organizer's Profile", "✔️", "✔️", "✔️"),
    _buildRow("Delegate Registration", "", "✔️", "✔️"),
    _buildRow("Registration Form API", "", "✔️", "✔️"),
    _buildRow("Abstract Submission", "", "✔️", "✔️"),
    _buildRow("Review of Abstracts & Papers", "", "✔️", "✔️"),
    _buildRow("Full Paper Submission", "", "✔️", "✔️"),
    _buildRow("Accommodation Booking", "", "✔️", "✔️"),
    _buildRow("Accommodation Fee Payment", "", "✔️", "✔️"),
    _buildRow("Create Fee Discount Coupons", "", "✔️", "✔️"),
    _buildRow("Fee Payment Receipts for Delegates", "", "✔️", "✔️"),
    _buildRow("Travel Information", "", "✔️", "✔️"),
    _buildRow("Minute-to-minute Conference Programme", "", "✔️", "✔️"),
    _buildRow("Automatic Email Reminders to Delegates", "", "✔️", "✔️"),
    _buildRow("Automatic SMS Reminders to Delegates", "", "✔️", "✔️"),
    _buildRow("Online Reports", "", "✔️", "✔️"),
    _buildRow("Export Reports in Excel", "", "✔️", "✔️"),
    _buildRow("e-Wallet", "", "✔️", "✔️"),
    _buildRow("Smart Conference Payment Gateway**", "", "✔️", "✔️"),
    _buildRow("Smart Conference Payment Gateway Options**", "", "Debit & Credit Card (Domestic & International), NetBanking, PayPal", "Debit & Credit Card (Domestic & International), NetBanking, PayPal"),
    _buildRow("Personal Payment Gateway Setup", "", "✔️", "✔️"),
    _buildRow("Multiple Currency Processing (INR, USD, EURO & GBP)", "", "✔️", "✔️"),
    _buildRow("Print Conference Ticket", "", "✔️", "✔️"),
    _buildRow("Email Support", "✔️", "✔️", "✔️"),
    _buildRow("Phone Support", "", "✔️", "✔️"),
    _buildRow("Data Backup", "", "✔️", "✔️"),
    _buildRow("Live Webcast", "", "✔️", "✔️"),
    _buildRow("Conference Registration Desk Management***", "", "", "✔️"),
    _buildRow("Conference Kit***", "", "", "✔️"),
    _buildRow("Online Marketing (Facebook, Twitter, Linkedin, Google Adwords, Email Marketing, Newsletters etc.)", "", "", "✔️"),
      _buildRowWithButtons(context)
    ];
  }
  DataRow _buildRowWithButtons(context) {
    return DataRow(
      cells: [
        DataCell(Text("")),
        DataCell(_registerButton("Basic",context) ),
        DataCell(_registerButton("Pro",context)),
        DataCell(_registerButton("Elite",context)),
      ],
    );
  }

  Widget _registerButton(String plan,context ) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                const OrganizerRegister(),
              ),
            );

          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor:  AppColors.appSky ,
            minimumSize: const Size(80, 40),
          ),
          child: Center(child: Text("Register $plan", style: FTextStyle.loginBtnStyle)),
        ),
      ),
    );
  }
}

  DataRow _buildRow(String title, String basic, String pro, String elite, {bool isHeader = false}) {
    return DataRow(

      cells: [
        DataCell(_tableCellText(title, isHeader)),
        DataCell(_tableCellBasicText(basic, isHeader)),
        DataCell(_tableCellBasicText(pro, isHeader, color: isHeader ? Colors.red : Colors.black)),
        DataCell(_tableCellBasicText(elite, isHeader)),
      ],
    );
  }

  Widget _tableCellText(String text, bool isHeader, {Color color = Colors.black}) {
    return SizedBox(
      width: 180,
      // height: 90,
      child: Center(
        child: Text(
          text,
          style:isHeader ? FTextStyle.listTitle :FTextStyle.listTitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,
        ),
      ),
    );
  }
  Widget _tableCellBasicText(String text, bool isHeader, {Color color = Colors.black}) {
    return SizedBox(
      width: 120,
      // height: 120,
      child: Center(
        child: Text(
          text,
          style:isHeader ? FTextStyle.listTitle :FTextStyle.listTitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }


