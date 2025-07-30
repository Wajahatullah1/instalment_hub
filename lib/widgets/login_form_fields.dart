import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';

class LoginFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String placeHolder;
  final bool isPassword;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  const LoginFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.placeHolder,
    required this.isPassword,
    this.prefixIcon,
    this.validator
  });

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  bool _obscureText = true; // For toggling password visibility

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            style: const TextStyle(
              color: Colors.grey
            ),
            validator: widget.validator,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              hintText: widget.placeHolder,
              labelStyle: const TextStyle(
                color: Colors.grey
              ),
              hintStyle: const TextStyle(
                color: Colors.grey
              ),
              prefixStyle:  TextStyle(
                color: AppColors().skyblue
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none, // Remove inner border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none, // Keep focus border clean too
              ),
              filled: true,
              fillColor: AppColors().lightGreyColor,
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  color: AppColors().skyblue,
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
