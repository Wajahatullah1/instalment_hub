import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/app_images.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';
import 'package:installment_hub/widgets/common/bottom_nav_bar.dart';
import 'package:installment_hub/widgets/top_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/customer_bloc/customer_bloc.dart';
import '../../bloc/customer_bloc/customer_event.dart';
import '../../constraints/app_materials/media_query.dart';
import '../../routes/navigation_mixin.dart';
import '../customers/add_customer/add_customer.dart';
import '../customers/add_customer/time_line_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with  NavigationMixin{
  @override
  void initState() {
    super.initState();
    // Fetch the managerId from SharedPreferences or another source
    SharedPreferences.getInstance().then((prefs) {
      String? managerId = prefs.getString('id');
      if (managerId != null) {
        BlocProvider.of<CustomerBloc>(context).add(LoadCustomerEventList(managerId));
      }
    });
  }
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
                    _buildAnimatedContainer(mq, Icons.supervised_user_circle_sharp, AppColors().container1, 'Customers'),
                    _buildAnimatedContainer(mq, Icons.next_plan_sharp, AppColors().container2, 'Plans'),
                  ],
                ),
                Row(
                  children: [
                    _buildAnimatedContainer(mq, Icons.add_circle_outline, AppColors().container3, 'Installments'),
                    _buildAnimatedContainer(mq, Icons.attach_money_sharp, AppColors().container4, 'Revenue'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Add',
        backgroundColor: AppColors().skyblue,
        onPressed: () {
          Get.to(AddCusomers());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (int){

        },
      ),
    );
  }
  Widget _buildAnimatedContainer(MediaQuerySize mq, IconData icon, Color color, String title ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            navigateByTitle(context, title);// Add your navigation or functionality here
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: mq.width*0.14,
            height: mq.height * 0.14,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: mq.total * 0.022,
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                    ),
                    SizedBox(height: mq.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mq.total * 0.013,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(icon, size: mq.total * 0.03, color: Colors.white),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

Widget _buildHeader(MediaQuerySize mq) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            // width: mq.width,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: mq.total * 0.03, horizontal: mq.total * 0.00),
                child: const TopAppBar(heading: 'Welcome to InstalMate Your Smart', subTitle: 'Plan Manager')
            ),
          ),
        ),
        ClipOval(
          child: Image.asset(
            'assets/images/bg.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        )

      ],
    ),
  );
}

