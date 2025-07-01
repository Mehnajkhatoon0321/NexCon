import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomConferenceShimmer extends StatelessWidget {
  const CustomConferenceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: title and texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Container(
                      height: 18,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    // Date row
                    Row(
                      children: [
                        Container(
                          height: 14,
                          width: 120,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 14,
                          width: 60,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Category
                    Container(
                      height: 14,
                      width: 150,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    // Buttons placeholder
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(3, (index) {
                        return Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
