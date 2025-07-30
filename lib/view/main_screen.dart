import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';
import 'package:installment_hub/view/customers/customer_main/customer_main.dart';
import 'package:installment_hub/view/home_screen/homeScreen.dart';
import 'package:installment_hub/view/profile/profile_page.dart';
import 'package:installment_hub/view/revinue_page/revinue_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    HomePage(),
    CustomerMainPage(),
    RevinuePage(),
    ProfileScreen(),
  ];

  final _selectedIndex = 0.obs; // Observable for selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex.value = index; // Update selected index

    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _pages[_selectedIndex.value]), // Use Obx to reactively build the selected page
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex.value,
        onTap: _onItemTapped,
        selectedItemColor: AppColors().blueColor,
        unselectedItemColor: AppColors().greyColor,
        selectedIconTheme: IconThemeData(size: mq.total*0.0360), // Set selected icon size
        unselectedIconTheme: IconThemeData(size: mq.total*0.02), // Set unselected icon size
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigate to Second Screen while keeping the bottom nav
          Get.to(SecondScreen());
        },
        child: Text('Go to Second Screen'),
      ),
    );
  }
}

// Second Screen Example
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the second screen'),
      ),
    );
  }
}

// Search Screen
