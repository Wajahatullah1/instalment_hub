import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final String textBlack;
  final String textBlue;
  final void Function()? onTap;

  const BottomTextWidget({
    super.key,
    required this.textBlack,
    required this.textBlue, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style, // Ensures text is visible
          children: [
            TextSpan(
              text: textBlack,
              style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),
            ),
            TextSpan(
              text: textBlue,
              style: const TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
