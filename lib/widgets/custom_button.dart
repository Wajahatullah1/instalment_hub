import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/custom_loader.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';

import '../constraints/app_materials/app_colors.dart';
class CustomButton extends StatefulWidget {
   final String title;
   final Color? color ;
   final Color? textColor;
   final Function()? onTap;
   final IconData? iconButton;
   final bool isIconVisible;
   final bool  isLoaderTrue ;
  const CustomButton({super.key, required this.title,  this.color, this.onTap, this.iconButton,this.textColor, required this.isIconVisible, required this.isLoaderTrue});

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
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: mq.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors().skyblue,
                Colors.blue[900]!, // or use Color(0xff0D47A1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isLoaderTrue?
                     Center(child: SizedBox(
                         width: mq.width*0.06,
                        height: mq.height*0.03,
                        child: CircularProgressIndicator(color: Colors.white,strokeWidth: 4,))):
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
