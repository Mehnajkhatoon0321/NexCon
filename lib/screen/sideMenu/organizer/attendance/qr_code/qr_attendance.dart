import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nexcon/screen/sideMenu/organizer/attendance/qr_code/attendance_confirmation_screen.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

class QRScannerScreen extends StatefulWidget {

   QRScannerScreen({super.key,});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen>     with SingleTickerProviderStateMixin{
  final MobileScannerController _controller = MobileScannerController();
  bool isTorchOn = false;
  bool isScanned = false;

  void _onDetect(BarcodeCapture capture) {
    if (isScanned) return; // Prevent multiple triggers

    final barcode = capture.barcodes.first;
    if (barcode.rawValue != null) {
      final code = barcode.rawValue!;
      debugPrint('QR Code Found: $code');

      try {
        final data = jsonDecode(code);
        final userId = data['user_id'];
        final userName = data['user_name'];

        setState(() {
          isScanned = true;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttendanceConfirmationScreen(
              userName: userName,
              userId: userId,
            ),
          ),
        ).then((_) {
          // Reset scanner state when returning from confirmation screen
          setState(() {
            isScanned = false;
          });
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid QR format.')),
        );
      }
    }
  }


  late AnimationController _animationController;
  late Animation<double> _animation;

  final double overlaySize = 250;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  Future<void> _scanFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        final qrCode = await QrCodeToolsPlugin.decodeFrom(pickedFile.path);
        if (qrCode != null && qrCode.isNotEmpty) {
          debugPrint("QR Code from gallery: $qrCode");

          final parsed = jsonDecode(qrCode);
          final name = parsed['user_name'];
          final id = parsed['user_id'];

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User: $name | ID: $id')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No QR code found in the image.")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid QR image or format.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'QR Code Attendance Mark',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:LayoutBuilder(builder: (context, constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;

    final scanRect = Rect.fromCenter(
    center: Offset(width / 2, height / 2),
    width: overlaySize,
    height: overlaySize,
    );
    return Stack(
    children: [

    MobileScanner(
    controller: _controller,
    onDetect: _onDetect,
    ),

    // Dark transparent mask with transparent hole
    CustomPaint(
    size: Size(width, height),
    painter: _ScannerMaskPainter(scanRect: scanRect),
    ),

    // Animated scanner corners overlay with zoom in/out
    Center(
    child: AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
    return Transform.scale(
    scale: _animation.value,
    child: SizedBox(
    width: overlaySize,
    height: overlaySize,
    child: CustomPaint(
    painter: _ScannerCornersPainter(),
    ),
    ),
    );
    },
    ),
    ),


    Positioned(
    bottom: 140,
    left: 0,
    right: 0,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    GestureDetector(
    onTap: _scanFromGallery,
    child: const Column(
    children: [
    Icon(Icons.image, color: Colors.white),
    SizedBox(height: 5),
    Text("Upload QR", style: TextStyle(color: Colors.white)),
    ],
    ),
    ),
    GestureDetector(
    onTap: () {
    setState(() {
    isTorchOn = !isTorchOn;
    _controller.toggleTorch();
    });
    },
    child: Column(
    children: [
    Icon(
    isTorchOn ? Icons.flashlight_off : Icons.flashlight_on,
    color: Colors.white,
    ),
    const SizedBox(height: 5),
    const Text("Torch", style: TextStyle(color: Colors.white)),
    ],
    ),
    ),
    ],
    ),
    ),

    const Positioned(
    bottom: 40,
    left: 0,
    right: 0,
    child: Center(
    child: Text(
    "Attendance Scan QR",
    style: TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.w500,
    fontSize: 16),
    ),
    ),
    ),
    ],
    );
    })

    );

  }
}



class _ScannerMaskPainter extends CustomPainter {
  final Rect scanRect;
  _ScannerMaskPainter({required this.scanRect});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.2);
    final clearPaint = Paint()
      ..blendMode = BlendMode.clear;

    // Draw dark overlay
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    // Clear the scan area
    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRRect(
      RRect.fromRectAndRadius(scanRect, const Radius.circular(15)),
      clearPaint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class _ScannerCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.9)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLength = 40.0;

    // Top Left corner
    canvas.drawLine(const Offset(0, 0), Offset(cornerLength, 0), paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, cornerLength), paint);

    // Top Right corner
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, cornerLength), paint);

    // Bottom Left corner
    canvas.drawLine(Offset(0, size.height), Offset(cornerLength, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - cornerLength), paint);

    // Bottom Right corner
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}