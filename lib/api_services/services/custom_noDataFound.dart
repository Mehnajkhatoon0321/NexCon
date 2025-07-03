import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class CustomNoFoundWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const CustomNoFoundWidget({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Lottie animation
          Lottie.asset(
            'assets/animations/noDataFound.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          // const SizedBox(height: 20),
          // Message
          Center(
            child: Text(
              message ?? "Server Exception Error",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          // const SizedBox(height: 20),
          // // Retry button
          // if (onRetry != null)
          //   ElevatedButton.icon(
          //     onPressed: onRetry,
          //     icon: const Icon(Icons.refresh),
          //     label:  Text("Retry"),
          //
          //   ),
        ],
      ),
    );
  }
}
