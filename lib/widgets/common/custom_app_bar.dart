import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_text_style.dart';

class CustomAppBar extends StatefulWidget {
  final String pageName;
  const CustomAppBar({super.key, required this.pageName});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        const SizedBox(
          width: 30,
        ),
        Text(
          widget.pageName,
          style: AppTextStyles.heading2,
        )
      ],
    );
  }
}
