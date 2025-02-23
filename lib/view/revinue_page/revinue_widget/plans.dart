import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/revinue_page/revinue_widget/partial_profit.dart';

import '../../../constraints/app_materials/app_colors.dart';
import '../../../constraints/app_materials/media_query.dart';
import 'complete_profit.dart';
class PlansWid extends StatefulWidget {
      const PlansWid({super.key});

      @override
      State<PlansWid> createState() => _PlansWidState();
    }

    class _PlansWidState extends State<PlansWid> {
      @override
      Widget build(BuildContext context) {
        final mq = MediaQuerySize(context);
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Create Your Plans',style: TextStyle(
                      fontSize: mq.total*0.014,fontWeight: FontWeight.bold,fontFamily: 'Inter',color: AppColors().blueColor
                  ),),
                ),
                (mq.height*0.03).toHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                       onTap: (){
                        Get.to(ProfitCalculatorForm2());
                       },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: mq.total*0.02, horizontal:  mq.total*0.03,),
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Icon(Icons.calculate_rounded,color: AppColors().lightBlueColor,),
                            (mq.height*0.01).toHeight,
                            Text( textAlign: TextAlign.center,
                              'Calculate full\ninstallment',overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ) 
                    ,InkWell(
                      onTap: (){
                        Get.to(ProfitCalculatorForm());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: mq.total*0.02, horizontal:  mq.total*0.03,),
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Icon(Icons.calculate_outlined,color: AppColors().lightBlueColor,),
                            (mq.height*0.01).toHeight,
                            Text(
                              textAlign: TextAlign.center,
                              'Calculate partial\ninstallment',
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        );
      }
    }
