import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/constraints/app_materials/app_images.dart';
import 'package:installment_hub/constraints/app_materials/app_text_style.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';
import 'package:installment_hub/view/main_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void navigateToLoginPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const LoginPage());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLoginPage(context);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // space between top-center and bottom
          children: [
            const SizedBox(height: 20), // Optional spacing from top
            Expanded(
              child: Center(
                child: _buildCenterText(),
              ),
            ),
            buildImageContainer(AppImages.splashScreenImage),
          ],
        ),
      ),
    );
  }
}


  Widget _buildCenterText () {
  return Center(
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(text: 'Install',style: AppTextStyles.appTextBlack),
          TextSpan(text: 'Mate',style: AppTextStyles.appTextBlue),
        ]
      ),
    ),
  );
}

Widget buildImageContainer(String imagePath) {
  return Container(
    width: double.infinity,
    height: 200, // or MediaQuery.of(context).size.height * 0.3
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.contain, // or BoxFit.cover
      ),
    ),
  );
}
