
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';

class Customer_cart_detail extends StatefulWidget {
  final String heading ;
  const Customer_cart_detail({super.key, required this.heading});

  @override
  State<Customer_cart_detail> createState() => _Customer_cart_detailState();
}

class _Customer_cart_detailState extends State<Customer_cart_detail> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Container(
      child: Column(
        children: [
          _buildAbout(widget.heading, context),
          Center(
            child: Card(
              elevation: 8, // Shadow elevation
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Muhammad Abbas',
                            style: TextStyle(fontSize:mq.total*0.018 , fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            Get.to(AddCusomers());
                          }, icon: Icon(Icons.edit,color: Colors.red,))
                        ],
                      ),
                    ),
                    (mq.height*0.01).toHeight,
                    _buildRow('Name:', 'Muhhamd abbas'),
                   _buildRow('Email:', 'ab@gmail.com'),
                    _buildRow('Phone:', '0335934343'),
                    _buildRow('Address:', 'KOAHT ,KDA'),
                    _buildRow('ID:', '13323232329328392'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _buildRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: '   ', // Adding space between title and value
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget _buildAbout (String heading , BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0),
    child: Align(
        alignment: Alignment.topLeft,
      child: Text(heading , style: TextStyle(
        color: AppColors().blueColor, fontSize: MediaQuerySize(context).total*0.016, fontWeight: FontWeight.bold, fontFamily: 'Inter'
      ),),
    ),
  );
}