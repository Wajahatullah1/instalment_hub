import 'package:flutter/material.dart';
import '../constraints/app_materials/app_colors.dart';
import '../constraints/app_materials/media_query.dart';
class FormFields extends StatefulWidget {
  final Function? callBackFunction;
  String text;
  String placeHolder;
  bool isPassword;
  bool readOnly;
  String? validatorText;
  TextInputType? type;

  void Function(String)? onChanged;
  void Function() fucntion;
  TextEditingController controller;

  FormFields({
    Key? key,
    this.callBackFunction,
    required this.text,
    required this.placeHolder,
    this.isPassword = false,
    this.readOnly = false,
    required this.fucntion,
    this.type,
    this.validatorText,
    this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  // List<String> items = [
  //   "am",
  //   "pm",
  // ];
  // String? selectedItem = "am";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text,

            style: TextStyle(

              color: AppColors().blueColor,
              fontSize: mq.total*0.0128,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: mq.height*0.01,
        ),
        Row(
          children: [
            Expanded(
              flex: 8,
              child: TextFormField(
                keyboardType:widget.type ,
                controller: widget.controller,
                readOnly: widget.readOnly,
                obscureText: widget.isPassword,
                style:  TextStyle(color: Colors.black87,fontSize: mq.total*0.012),
                cursorColor: AppColors().greyColor,
                textInputAction: TextInputAction.done,
                onChanged: widget.onChanged,
                // validator: (value)=>FunctionClass().validateField(widget.controller.text, widget.validatorText!),
                decoration: InputDecoration(
                  filled: true,
                  hintText: widget.placeHolder,
                  hintStyle:
                  TextStyle(fontSize: mq.total*0.0125, color: Colors.black87),
                  fillColor: Colors.grey[300],
                  focusedBorder:  OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide:widget.readOnly==true?BorderSide(color: AppColors().blueColor): const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors().backgroundcolor,
                      width: 1.0,
                    ),
                  ),
                ),
                onTap: widget.fucntion,
              ),
            ),

          ],
        ),
      ],
    );
  }
}
