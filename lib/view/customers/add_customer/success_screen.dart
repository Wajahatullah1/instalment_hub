import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';
import 'package:installment_hub/view/home_screen/homeScreen.dart';

import '../../../constraints/app_materials/app_colors.dart';
import '../../../widgets/common/success_container.dart';
import '../../../widgets/custom_button.dart';



class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center( // Ensures everything is centered
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SuccessContainer(),
                const SizedBox(height: 24.0), // More space for proper alignment

                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Successfully Added!",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

                Text(
                  "Good work! The Customer has been added\n  successfully. you can now add a new or\n go to customer Page. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors().greyColor,
                  ),
                ),

                const SizedBox(height: 100.0), // Spacing before button

                CustomButton(
                  title: "Add New Instalment",
                  color: AppColors().skyblue,
                  textColor: Colors.white,
                  onTap: () {
                     Get.off(AddCusomers());
                  }, isIconVisible: false, isLoaderTrue: false,
                ),
                SizedBox(height: 32.0), // Spacing before button

                CustomButton(
                  title: "Back To Home",
                  color: AppColors().greyColor,
                  textColor: Colors.white,
                  onTap: () {
                    Get.offAll(HomePage());
                  }, isIconVisible: false, isLoaderTrue: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}