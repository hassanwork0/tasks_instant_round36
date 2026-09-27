import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsShimmer extends StatelessWidget {
  const DetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlightColor = Theme.of(context).colorScheme.surface;

    Widget box({double? w, double? h}) {
      return Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 280),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  box(w: 24, h: 24),
                  const SizedBox(height: 16),
                  box(w: 220, h: 24),
                  const SizedBox(height: 12),
                  box(w: 150, h: 16),
                  const SizedBox(height: 24),
                  box(w: 120, h: 32),
                  const SizedBox(height: 32),
                  box(w: double.infinity, h: 120),
                  const SizedBox(height: 32),
                  box(w: double.infinity, h: 56),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
