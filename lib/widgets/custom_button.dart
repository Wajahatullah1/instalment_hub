import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';

import '../constraints/app_materials/app_colors.dart';
class CustomButton extends StatefulWidget {
   final String title;
   final Color? color ;
   final Function()? onTap;
  const CustomButton({super.key, required this.title,  this.color, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return InkWell(
      onTap:widget.onTap ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: mq.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_circle,color: AppColors().blueColor,),
                SizedBox(width: mq.width * 0.010),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: mq.total * 0.015, color: AppColors().blueColor,fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
