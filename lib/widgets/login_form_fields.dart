import 'package:flutter/material.dart';

class LoginFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String placeHolder;
  final bool isPassword;
  final Icon? prefixIcon;
  const LoginFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.placeHolder,
    required this.isPassword,
    this.prefixIcon
  });

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  bool _obscureText = true; // For toggling password visibility

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        labelText: widget.hintText, // Adds a floating label
        hintText: widget.placeHolder,
        border: OutlineInputBorder( // Rounded border
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : Icon(null),
      ),
    );
  }
}
