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
      duration: const Duration(seconds: 2), // Animation duration
    );

    // Tween from 0.0 to the target progress
    _animation = Tween<double>(begin: 0.0, end: widget.progress).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation
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
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: _CircularProgressDotPainter(_animation.value, widget.color, widget.totalDots),
        child: Center(
          child: Text(
            "${(_animation.value * 100).toInt()}%", // Show animated percentage text
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      ..strokeWidth = 10.0;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Paint for the dots
    Paint dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw the progress dots
    double angleIncrement = 2 * pi / totalDots;
    int dotsToShow = (totalDots * progress).ceil();

    for (int i = 0; i < dotsToShow; i++) {
      double angle = -pi / 2 + (i * angleIncrement);
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      // Draw a dot
      canvas.drawCircle(Offset(x, y), 5.0, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint whenever progress changes
  }
}
