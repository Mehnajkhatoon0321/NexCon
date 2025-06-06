
import 'package:flutter/material.dart';


class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(title: const Text("QR Scanner")),

    );
  }
}
