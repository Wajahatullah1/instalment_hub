import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';

import '../constraints/app_materials/app_colors.dart';
class TopAppBar extends StatefulWidget {
  final String heading ;
  final  String subTitle;
  const TopAppBar({super.key, required this.heading, required this.subTitle});

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    final mq =MediaQuerySize(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
            },
            child: Text(
              widget.heading,
              style: TextStyle(
                color: AppColors().blueColor,
                fontSize: mq.total * 0.020,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
          ),
          (mq.height * 0.02).toHeight,
          Text(
           widget.subTitle,
            style: TextStyle(
              color: AppColors().greyColor,
              fontSize: mq.total * 0.013,
            ),
          ),
        ],
      ),
    );
  }
}

