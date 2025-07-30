import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/revinue_page/revinue_widget/completed_customers.dart';
import 'package:installment_hub/view/revinue_page/revinue_widget/custom_process_bar.dart';
import 'package:installment_hub/view/revinue_page/revinue_widget/pending_customers.dart';
import 'package:installment_hub/view/revinue_page/revinue_widget/plans.dart';

import '../../constraints/app_materials/media_query.dart';
import '../../widgets/top_app_bar.dart';
class RevinuePage extends StatefulWidget {
  const RevinuePage({super.key});

  @override
  State<RevinuePage> createState() => _RevinuePageState();
}

class _RevinuePageState extends State<RevinuePage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(mq),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Total Invest ', style: TextStyle(
                            fontSize: mq.total*0.013, color: AppColors().lightBlueColor
                        ),),
                        (mq.height*0.03).toHeight,
                        Container(
                          height: mq.total*0.07,
                          width:  mq.total*0.07,
                          child: CustomCircularProgressBar(progress: 0.6, color: AppColors().blueColor, totalDots: 20,),
                        ),
                        (mq.height*0.03).toHeight,
                        Text('PKR 70000 ', style: TextStyle(
                            fontSize: mq.total*0.013, color: AppColors().greyColor
                        ),),
                      ],
                    ), Column(
                      children: [
                        Text('Total Profit ', style: TextStyle(
                            fontSize: mq.total*0.013, color: AppColors().blueColor
                        ),),
                        (mq.height*0.03).toHeight,
          
                        Container(
                          height: mq.total*0.07,
                          width:  mq.total*0.07,
                          child: CustomCircularProgressBar(progress: 0.6, color: AppColors().lightBlueColor, totalDots: 25,),
                        ),
                        (mq.height*0.03).toHeight,
          
                        Text('PKR 30000 ', style: TextStyle(
                            fontSize: mq.total*0.013, color: AppColors().greyColor
                        ),),
                      ],
                    ), Column(
                      children: [
                        Text('Product Sold ', style: TextStyle(
                            fontSize: mq.total*0.013 , color: Colors.green
                        ),),
                        (mq.height*0.03).toHeight,
          
                        Container(
                          height: mq.total*0.07,
                          width:  mq.total*0.07,
                          child: CustomCircularProgressBar(progress: 0.6, color: Colors.green,totalDots: 25,),
                        ),
                        (mq.height*0.03).toHeight,
                        Text('35', style: TextStyle(
                            fontSize: mq.total*0.013 , color: AppColors().greyColor
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              (mq.height*0.03).toHeight,
              PlansWid(),
              (mq.height*0.03).toHeight,
              PendingCustomers(),
              (mq.height*0.03).toHeight,
              CompletedCustomer(),
          
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
            vertical: mq.total * 0.0240, horizontal: mq.total * 0.01),
        child: TopAppBar(heading: 'Installment revenue , total investment ,Profit.', subTitle: 'Manage Your Plans')
    ),
  );
}