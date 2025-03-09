import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/services/fire_base_auth.dart';
import 'package:installment_hub/view/main_screen.dart';
import 'package:installment_hub/view/signUp_screen/sign_up.dart';
import 'package:installment_hub/widgets/custom_button.dart';

import '../../widgets/login_form_fields.dart';
import '../introduction_screen/introduction_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildTop(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 180,
              child: _buildBottom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      width: mediaSize.width,
      height: mediaSize.height * 0.3,
      decoration: BoxDecoration(color: AppColors().blueColor),
      child: const Center(
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SingleChildScrollView(
      child: SizedBox(
        width: mediaSize.width,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginFormField(
            controller: emailController,
            hintText: 'Email',
            placeHolder: '',
            isPassword: false,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 40),
          LoginFormField(
            controller: passwordController,
            hintText: 'Password',
            placeHolder: '',
            isPassword: true,
            prefixIcon: Icon(Icons.lock_outline_rounded),
          ),
          const SizedBox(height: 20),
          _buildRememberForgot(),
          const SizedBox(height: 20),
          _buildLoginButton(),
          const SizedBox(height: 20),
          _buildSignUpButton(),
        ],
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildRememberForgot() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildGreyText("Remember me"),
           Icon(Icons.arrow_forward, color: AppColors().greyColor,),
          Checkbox(
          value: rememberUser,
          onChanged: (value) {
            setState(() {
              rememberUser = value!;
            });
          }),
         ]
      ),
    );
  }

  Widget _buildLoginButton() {
    return CustomButton(
      title: 'Login',
      textColor: Colors.white,
      color: AppColors().blueColor,
      onTap: () {
        _login();
      },
      isIconVisible: false,
      isLoaderTrue: true,
    );
  }

  Widget _buildSignUpButton() {
    return CustomButton(
      title: 'Sign Up',
      textColor: Colors.white,
      color: AppColors().greyColor,
      onTap: () {
        Get.to(SignUpPage());
       },
      isIconVisible: false,
      isLoaderTrue: true,
    );
  }

  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;
    User? user =
        await _authServices.signInWithEmailAndPassword(email, password);
    if (user != null) {

      Get.to(OnBoardingPage());
    } else {
      print('please sigup first ');
    }
  }
}
