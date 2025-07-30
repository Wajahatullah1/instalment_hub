import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';

import '../constraints/app_materials/app_colors.dart';

class TopAppBar extends StatefulWidget {
  final String heading;
  final String subTitle;

  const TopAppBar({
    super.key,
    required this.heading,
    required this.subTitle,
  });

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${widget.heading}\n',
            style: TextStyle(
              color: Colors.black87,
              fontSize: mq.total * 0.018,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
          // WidgetSpan(
          //   child: SizedBox(width: mq.height * 0.01),
          // ),
          TextSpan(
            text: widget.subTitle,
            style: TextStyle(
              color: AppColors().blueColor,
              fontSize: mq.total * 0.018,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
