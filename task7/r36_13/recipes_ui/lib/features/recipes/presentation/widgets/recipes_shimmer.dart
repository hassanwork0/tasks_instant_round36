import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  static const _grayBase = Color(0xFFE6E3E2);
  static const _grayHighlight = Color(0xFFF5F3F2);
  static const _peachBase = Color(0xFFF6CBB8);
  static const _peachHighlight = Color(0xFFFBE3D8);

  static const double _imageHeight = 160;
  static const double _cardExtent = 232;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardCount = (screenHeight / _cardExtent).ceil() + 1;

    return Container(
      color: const Color(0xFFFFF9F7),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildChips(),
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 12),
            for (int i = 0; i < cardCount; i++) ...[
              _buildCard(),
              const SizedBox(height: 14),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildChips() {
    final widths = [76.0, 76.0, 88.0, 80.0];
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: widths.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final isFirst = i == 0;
          return Shimmer.fromColors(
            baseColor: isFirst ? _peachBase : _grayBase,
            highlightColor: isFirst ? _peachHighlight : _grayHighlight,
            child: _box(width: widths[i], height: 36, radius: 18),
          );
        },
      ),
    );
  }

  // Section title (left) + small action (right)
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Shimmer.fromColors(
        baseColor: _grayBase,
        highlightColor: _grayHighlight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _box(width: 88, height: 16, radius: 5),
            _box(width: 38, height: 12, radius: 5),
          ],
        ),
      ),
    );
  }


  Widget _buildCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Shimmer.fromColors(
        baseColor: _grayBase,
        highlightColor: _grayHighlight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            _box(width: double.infinity, height: _imageHeight, radius: 10),
            const SizedBox(height: 10),
            // Title
            FractionallySizedBox(
              widthFactor: 0.74,
              child: _box(width: double.infinity, height: 12, radius: 5),
            ),
            const SizedBox(height: 8),
            // Meta row:  [pill] • [pill]
            Row(
              children: [
                _box(width: 50, height: 9, radius: 4),
                const SizedBox(width: 8),
                _box(width: 5, height: 5, radius: 3),
                const SizedBox(width: 8),
                _box(width: 64, height: 9, radius: 4),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
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