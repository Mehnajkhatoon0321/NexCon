import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoNetworkWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const NoNetworkWidget({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie animation
          Lottie.asset(
            'assets/animation/Network.json',
            width: 220,
            height: 220,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          // Message
          Text(
            message ?? "No Internet Connection",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          // Retry button
          if (onRetry != null)
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label:  Text("Retry"),

            ),
        ],
      ),
    );
  }
}
