import 'package:flutter/material.dart';
import 'dart:async';

import '../../constraints/app_materials/app_colors.dart';

class SuccessContainer extends StatefulWidget {
  const SuccessContainer({super.key});

  @override
  _SuccessContainerState createState() => _SuccessContainerState();
}

class _SuccessContainerState extends State<SuccessContainer> {
  bool isSuccess = false;

  @override
  void initState() {
    super.initState();
    // Trigger animation after 1 second
    Future.delayed(const Duration(microseconds: 50), () {
      setState(() {
        isSuccess = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer container (largest)
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            width: isSuccess ? 200 : 0,
            height: isSuccess ? 200 : 0,
            decoration: BoxDecoration(
              color: AppColors().container3.withOpacity(0.3),
              shape: BoxShape.circle, // Ensures it's always a perfect circle
            ),
          ),
          // Middle container
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            width: isSuccess ? 160 : 0,
            height: isSuccess ? 160 : 0,
            decoration: BoxDecoration(
              color: AppColors().container3.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          ),
          // Inner container (smallest with checkmark)
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isSuccess ? 120 : 0,
            height: isSuccess ? 120 : 0,
            decoration: BoxDecoration(
              color: AppColors().container3,
              shape: BoxShape.circle,
            ),
            child: AnimatedOpacity(
              opacity: isSuccess ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(Icons.done, color: Colors.white, size: 50),
            ),
          ),
        ],
      ),
    );
  }
}