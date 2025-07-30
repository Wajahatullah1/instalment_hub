import 'package:flutter/material.dart';

class AppTextStyles {
  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  // Body Text
  static const TextStyle appTextBlack = TextStyle(
    fontSize: 30,
    color: Colors.black87,
    fontWeight: FontWeight.bold
  );// Body Text
  static const TextStyle appTextBlue = TextStyle(
    fontSize: 30,
    color: Colors.blue,
    fontWeight: FontWeight.bold
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  // Subtle / Caption
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  // Buttons
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Error Text
  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w500,
  );
}
