import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';
import 'package:installment_hub/view/customers/customer_detail/customer_detail_page.dart';

import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/top_app_bar.dart';

class CustomerMainPage extends StatefulWidget {
  const CustomerMainPage({super.key});

  @override
  State<CustomerMainPage> createState() => _CustomerMainPageState();
}

class _CustomerMainPageState extends State<CustomerMainPage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildHeader(mq),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search you customers here...'
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              // Content goes here - can be any widget, e.g., a ListView, text, images, etc.
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: 10,
                         shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                               borderRadius: BorderRadius.circular(7)
                            ),
                                margin: EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Muhammad Abbas',style: TextStyle(
                                        fontSize: mq.total*0.015,color: Colors.black38
                                      ),),
                                      IconButton(onPressed: (){
                                        Get.to(CustomerDetailScreen());
                                      }, icon: Icon(Icons.arrow_forward_ios_outlined, color: AppColors().blueColor,))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },)
                      // Example content

                      // Add more content widgets as needed
                    ],
                  ),
                ),
              ),

              // The InkWell button at the bottom
              CustomButton(title: 'Add New Customer',onTap: (){
                   Get.to(AddCusomers());
              },),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader(MediaQuerySize mq) {
  return Container(
    width: mq.width,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: mq.total * 0.05,
        horizontal: mq.total * 0.01,
      ),
      child: const TopAppBar(
        heading: 'Customers',
        subTitle: 'Manage Your Customers here!',
      ),
    ),
  );
}