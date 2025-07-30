import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/view/customers/customer_main/customer_main.dart';
import 'package:installment_hub/view/home_screen/homeScreen.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';
import 'package:installment_hub/view/profile/profile_page.dart';

mixin NavigationMixin {
  void navigateByTitle(BuildContext context, String title) {
    switch (title.toLowerCase()) {
      case 'home':
        Get.to(const HomePage());
        break;
      case 'profile':
        Get.to(const ProfileScreen());
        break;
      case 'settings':
        Navigator.pushNamed(context, '/settings');
        break;
      case 'login':
        Get.to(const LoginPage());
        break;

      case 'customers':
        Get.to(const CustomerMainPage());
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unknown destination: $title')),
        );
    }
  }
}
