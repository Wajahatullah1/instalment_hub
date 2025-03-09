import 'package:flutter/material.dart';
import 'dart:math';

class CustomCircularProgressBar extends StatefulWidget {
  final double progress; // Value between 0.0 and 1.0
  final Color color;
  final int totalDots;

  const CustomCircularProgressBar({
    Key? key,
    required this.progress,
    this.color = Colors.blue,
    this.totalDots = 40,
  }) : super(key: key);

  @override
  State<CustomCircularProgressBar> createState() => _CustomCircularProgressBarState();
}

class _CustomCircularProgressBarState extends State<CustomCircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(
        painter: _CircularProgressDotPainter(
            _animation.value, widget.color, widget.totalDots),
        child: Center(
          child: Text(
            "${(_animation.value * 100).toInt()}%",
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressDotPainter extends CustomPainter {
  final double progress;
  final Color color;
  final int totalDots;

  _CircularProgressDotPainter(this.progress, this.color, this.totalDots);

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundPaint);

    Paint dotPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blueAccent, Colors.cyanAccent],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.fill;

    double angleIncrement = 2 * pi / totalDots;
    int dotsToShow = (totalDots * progress).ceil();

    for (int i = 0; i < dotsToShow; i++) {
      double angle = -pi / 2 + (i * angleIncrement);
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      canvas.drawCircle(Offset(x, y), 6.0, dotPaint);

      if (i == dotsToShow - 1) {
        Paint glowPaint = Paint()
          ..color = Colors.blueAccent.withOpacity(0.5)
          ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 10);

        canvas.drawCircle(Offset(x, y), 8.0, glowPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
