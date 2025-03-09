
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/models/users/users.dart';
import 'package:installment_hub/services/fire_base_auth.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/login_form_fields.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController  = TextEditingController();
  TextEditingController phoneController  = TextEditingController();
  bool rememberUser = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();

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
          'SIGNUP',
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
            controller: nameController,
            hintText: 'Name',
            placeHolder: '',
            isPassword: false,
            prefixIcon: Icon(Icons.person_2_outlined),
          ),  const SizedBox(height: 40),
          LoginFormField(
            controller: phoneController,
            hintText: 'Phone',
            placeHolder: '',
            isPassword: false,
            prefixIcon: Icon(Icons.phone),
          ),
          const SizedBox(height: 40),
          LoginFormField(
            controller: passwordController,
            hintText: 'Password',
            placeHolder: '',
            isPassword: true,
            prefixIcon: Icon(Icons.lock_outline),
          ),

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
      title: 'Sign Up',
      textColor: Colors.white,
      color: AppColors().blueColor,
      onTap: () {
        _signUp();
      },
      isIconVisible: false,
      isLoaderTrue: true,
    );
  }

  Widget _buildSignUpButton() {
    return CustomButton(
      title: 'Login',
      textColor: Colors.white,
      color: AppColors().greyColor,
      onTap: () {
        Get.to(LoginPage());
      },
      isIconVisible: false,
      isLoaderTrue: true,
    );
  }

  void _signUp ()async{
    String email = emailController.text;
    String password = passwordController.text;
    int phone = phoneController.hashCode;
    String name = nameController.text;
    AppUser? user  = await _auth.signUpWithEmailAndPassword(context,email, password,phone,name,);
    if(user != null){
      print('successfully created');
      Get.to(LoginPage());
    }
  }
}


