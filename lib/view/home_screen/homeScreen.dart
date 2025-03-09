import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';
import 'package:installment_hub/widgets/top_app_bar.dart';

import '../../constraints/app_materials/media_query.dart';
import '../customers/add_customer/time_line_screen.dart';

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
                    _buildAnimatedContainer(mq, Icons.supervised_user_circle_sharp, AppColors().lightBlueColor, 'Customers'),
                    _buildAnimatedContainer(mq, Icons.next_plan_sharp, AppColors().blueColor, 'Plans'),
                  ],
                ),
                Row(
                  children: [
                    _buildAnimatedContainer(mq, Icons.add_circle_outline, AppColors().skyblue, 'Installments'),
                    _buildAnimatedContainer(mq, Icons.attach_money_sharp, AppColors().skyblue, 'Revenue'),
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

Widget _buildAnimatedContainer(MediaQuerySize mq, IconData icon, Color color, String title) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.to(AddCustomerTimeline());
          // Add your navigation or functionality here
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: mq.width,
          height: mq.height * 0.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(0, 8),
              )
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: mq.total * 0.05, color: Colors.white),
                SizedBox(height: mq.height * 0.02),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mq.total * 0.022,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
