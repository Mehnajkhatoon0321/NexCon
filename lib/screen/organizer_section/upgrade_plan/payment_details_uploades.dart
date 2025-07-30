import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../utils/colours.dart';
import '../../../utils/font_text_Style.dart';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';



class BankTransferDetailsOnline extends StatefulWidget {
  const BankTransferDetailsOnline({super.key});

  @override
  State<BankTransferDetailsOnline> createState() => _BankTransferDetailsOnlineState();
}

class _BankTransferDetailsOnlineState extends State<BankTransferDetailsOnline> {
  final List<Map<String, dynamic>> paymentDataList = [
    {
      "credit_points": 12,
      "total_amount": 600,
      "igst_percent": 18,
    },
  ];

  late int creditPoints;
  late double totalAmount;
  late double igstPercent;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    loadPaymentData();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // release memory
    super.dispose();
  }

  void loadPaymentData() {
    final data = paymentDataList[0];
    creditPoints = data['credit_points'];
    totalAmount = (data['total_amount']).toDouble();
    igstPercent = (data['igst_percent']).toDouble();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Success: ${response.paymentId}");
    // TODO: Send to backend or move to success screen
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Wallet Selected: ${response.walletName}");
  }

  void startRazorpayCheckout(double amount) {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag', // Replace with live key in production
      'amount': (amount * 100).toInt(), // Razorpay uses paise
      'name': 'Smart Conference',
      'description': 'Credit Points Purchase',
      'prefill': {
        'contact': '9695844884', // Replace with real user data
        'email': 'user@example.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Razorpay Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final gstAmount = totalAmount * (igstPercent / 100);
    final netAmount = totalAmount + gstAmount;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Online Payment', style: FTextStyle.HeadingTxtWhiteStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.shield, color: AppColors.appSky),
                  SizedBox(width: 8),
                  Text(
                    "Secure Checkout",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.appSky,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildRow("Credit Points / Delegates", "$creditPoints"),
              buildRow("Total Amount", "₹ ${totalAmount.toStringAsFixed(0)}"),
              buildRow("IGST (${igstPercent.toStringAsFixed(0)}%)", "₹ ${gstAmount.toStringAsFixed(0)}"),
              const Divider(height: 30, thickness: 1.2),
              buildRow("Net Amount", "₹ ${netAmount.toStringAsFixed(0)}", isTotal: true),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(

                  label: const Text("Proceed to Pay"),
                  onPressed: () => startRazorpayCheckout(netAmount),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: AppColors.appSky,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.black : Colors.grey[800],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.teal.shade700 : Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}
