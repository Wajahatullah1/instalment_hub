import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';
import 'package:installment_hub/widgets/top_app_bar.dart';

import '../../constraints/app_materials/media_query.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildHeader(mq),
                Row(
                  children: [
                    _buildContainer(mq , Icons.supervised_user_circle_sharp,AppColors().lightBlueColor,'Customers'),
                    _buildContainer(mq,Icons.next_plan_sharp,AppColors().blueColor,'Plans'),
                  ],
                )  ,
                Row(
                  children: [
                    _buildContainer(mq,Icons.add_circle_outline,AppColors().skyblue,'Installments'),
                    _buildContainer(mq,Icons.attach_money_sharp,AppColors().skyblue,'Revenue'),
                  ],
                )
              ],
            ),
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
          vertical: mq.total * 0.05, horizontal: mq.total * 0.01),
      child: TopAppBar(heading: 'Welcome to InstalMate', subTitle: 'Manage Your Plans')
    ),
  );
}
Widget _buildContainer (MediaQuerySize mq, IconData icon , Color color,String title){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mq.width,
        height: mq.height*0.2,
        decoration: BoxDecoration(
          color: color
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(icon , size: mq.total*0.03,color: Colors.white,),
              (mq.height*0.02).toHeight,
               Text(title, style: TextStyle(
                color: Colors.white, fontSize: mq.total*0.020
              ),),
            ],
          ),
        ),
      ),
    ),
  );
}