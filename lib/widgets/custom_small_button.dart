import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';

import '../constraints/app_materials/app_colors.dart';
class CustomSmallButton extends StatefulWidget {
  final String title;
  final Color? color ;
  final Color? textColor;
  final Function()? onTap;
  final IconData? iconButton;
  final bool isIconVisible;
  final bool  isLoaderTrue ;
  const CustomSmallButton({super.key, required this.title,  this.color, this.onTap, this.iconButton,this.textColor, required this.isIconVisible, required this.isLoaderTrue});

  @override
  State<CustomSmallButton> createState() => CustomSmallButtonState();
}

class CustomSmallButtonState extends State<CustomSmallButton> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return InkWell(
      onTap:widget.onTap ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: mq.width*0.3,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: mq.total * 0.015, color:widget.textColor,fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
