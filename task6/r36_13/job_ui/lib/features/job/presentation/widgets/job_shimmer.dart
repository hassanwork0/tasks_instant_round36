import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class JobsShimmer extends StatelessWidget {
  const JobsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Shimmer.fromColors(
            baseColor: const Color(0xFFE0E5F8),
            highlightColor: const Color(0xFFF4F6FF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _box(width: 80, height: 10, radius: 5),
                    _box(width: 40, height: 10, radius: 5),
                  ],
                ),
                const SizedBox(height: 10),

                _box(width: 190, height: 14, radius: 6),
                const SizedBox(height: 8),

                _box(width: 110, height: 10, radius: 5),
                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _box(width: 46, height: 18, radius: 9),
                    _box(width: 56, height: 22, radius: 8),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _box({
    required double width,
    required double height,
    required double radius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}