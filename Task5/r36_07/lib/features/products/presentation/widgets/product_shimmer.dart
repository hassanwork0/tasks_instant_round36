import 'package:flutter/material.dart';

import '../screens/adaptive.dart';

class ProductShimmer extends StatefulWidget {
  ProductShimmer({super.key});

  @override
  State<ProductShimmer> createState() => _ProductShimmerState();
}

class _ProductShimmerState extends State<ProductShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1000),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> opacity = Tween<double>(begin: 0.4, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    return FadeTransition(
      opacity: opacity,
      child: ListView.separated(
        padding: Adaptive.screenPadding(context),
        itemCount: 6,
        separatorBuilder: (context, index) =>
            SizedBox(height: Adaptive.itemSpacing(context)),
        itemBuilder: (context, index) => _ShimmerCard(),
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    final Color baseColor =
        Theme.of(context).colorScheme.surfaceContainerHighest;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ColoredBox(color: baseColor),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShimmerBar(width: double.infinity, height: 16, color: baseColor),
                SizedBox(height: 8),
                _ShimmerBar(width: double.infinity, height: 12, color: baseColor),
                SizedBox(height: 4),
                _ShimmerBar(width: 180, height: 12, color: baseColor),
                SizedBox(height: 12),
                _ShimmerBar(width: 110, height: 20, color: baseColor),
                SizedBox(height: 12),
                _ShimmerBar(width: 70, height: 16, color: baseColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerBar extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  _ShimmerBar({
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
