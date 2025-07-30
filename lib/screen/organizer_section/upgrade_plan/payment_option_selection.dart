import 'package:flutter/material.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/bank_transfer_details.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/payment_details_uploades.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class UpgradeMembershipPayment extends StatefulWidget {
  const UpgradeMembershipPayment({super.key});

  @override
  State<UpgradeMembershipPayment> createState() => _UpgradeMembershipPaymentState();
}

class _UpgradeMembershipPaymentState extends State<UpgradeMembershipPayment> {
  int _selectedMethod = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        title: Text('Upgrade Membership', style: FTextStyle.HeadingTxtWhiteStyle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (_selectedMethod == 1) {
              // Navigate to online payment page (replace with your actual page)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BankTransferDetailsOnline


                  ()), // You can replace with your CCAvenue integration page
              );
            } else if (_selectedMethod == 2) {
              // Navigate to offline bank transfer form
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubmitBankTransferDetails()),
              );
            }
          },

          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColors.appSky,
          ),
          child: Text("Proceed", style: FTextStyle.loginBtnStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Payment Method", style: FTextStyle.listTitle),
            const SizedBox(height: 12),
            _paymentOption(
              title: "Pay Online",
              description: "Netbanking, Debit/Credit Cards (via CCAvenue)",
              icon: Icons.credit_card,
              value: 1,
            ),
            const SizedBox(height: 12),
            _paymentOption(
              title: "Pay Offline",
              description: "Wire / Bank Transfer",
              icon: Icons.account_balance,
              value: 2,
            ),
            const SizedBox(height: 24),
            _bankDetailsSection(),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption({
    required String title,
    required String description,
    required IconData icon,
    required int value,
  }) {
    final bool selected = _selectedMethod == value;

    return InkWell(
      onTap: () => setState(() => _selectedMethod = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected ? AppColors.appSky : Colors.grey.shade300,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Radio<int>(
              value: value,
              groupValue: _selectedMethod,
              onChanged: (val) => setState(() => _selectedMethod = val!),
              activeColor: AppColors.appSky,
            ),
            const SizedBox(width: 10),
            Icon(icon, color: AppColors.secondaryColour),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: FTextStyle.cardTitleBlack),
                  const SizedBox(height: 2),
                  Text(description, style: FTextStyle.cardSubtitleBlack),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bankDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bank Transfer Details", style: FTextStyle.listTitle),
        const SizedBox(height: 12),
        _bankField("Beneficiary", "Smart Conference Private Limited"),
        _bankField("Bank Name", "Vijaya Bank"),
        _bankField("Branch", "Hazratganj, Lucknow, India"),
        _bankField("Address", "6, Sapru Marg, Opp. Hotel India Awadh, Hazratganj"),
        _bankField("Account No", "710600301000453"),
        _bankField("IFSC", "VIJB0007106"),
        _bankField("MICR", "226029002"),
        _bankField("SWIFT", "VIJBINBBRSM"),
        const SizedBox(height: 20),
        Text("Payment Instructions:", style: FTextStyle.listTitle),
        const SizedBox(height: 6),
        Text(
          "After transferring the amount, email the bank receipt, transaction ID, date of transfer, originating bank, and your account number. Your membership will be activated within 3 working days.",
          style: FTextStyle.style,
        ),
      ],
    );
  }

  Widget _bankField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: FTextStyle.style.copyWith(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, style: FTextStyle.style)),
        ],
      ),
    );
  }
}

