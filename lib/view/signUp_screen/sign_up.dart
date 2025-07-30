
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/global_keys.dart';
import 'package:installment_hub/models/users/users.dart';
import 'package:installment_hub/services/fire_base_auth.dart';
import 'package:installment_hub/services/forms_validation.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';

import '../../constraints/app_materials/app_images.dart';
import '../../constraints/app_materials/flutter_cherry_toast.dart';
import '../../widgets/bottom_text_widget.dart';
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
            _buildTop(),
            Padding(
              padding: EdgeInsets.only(top: mediaSize.height * 0.25),
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
      height: mediaSize.height*0.23 ,
      decoration: BoxDecoration(
        color: AppColors().blueColor,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.backgroundImage,
            )),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ]
        ,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Text(
                'Sign up your account and start managing',
                style: TextStyle(
                  color: Colors.white, fontSize: 16, ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SingleChildScrollView(
      child: SizedBox(
        width: mediaSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 14),
      child: Form(
        key: GlobalFormKeys.signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginFormField(
              controller: emailController,
              hintText: 'Email',
              placeHolder: 'Enter your email',
              isPassword: false,
              prefixIcon: Icon(Icons.email_outlined,color:AppColors().greyColor,),
              validator: CustomerFormValidator.validateEmail,
            ),
            const SizedBox(height: 40),
            LoginFormField(
              controller: phoneController,
              hintText: 'Phone',
              placeHolder: 'Enter phone number',
              isPassword: false,
              prefixIcon: Icon(Icons.phone),
              validator: CustomerFormValidator.validatePhone,
            ),
            const SizedBox(height: 40),
            LoginFormField(
              controller: passwordController,
              hintText: 'Password',
              placeHolder: 'Enter your password',
              isPassword: true,
              prefixIcon: Icon(Icons.lock_outline_rounded,color: AppColors().greyColor,),
              validator: CustomerFormValidator.validatePassword,
            ),

            const SizedBox(height: 20),
            _buildSignUpButton(),
            const SizedBox(height: 150),
             Align(
              alignment: Alignment.bottomCenter,
              child: BottomTextWidget(
                textBlack: 'Already have an account? ',
                textBlue: 'Login',
                onTap: (){
                  Get.to(const LoginPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }




  // Widget _buildForm() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 60),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         LoginFormField(
  //           controller: emailController,
  //           hintText: 'Email',
  //           placeHolder: '',
  //           isPassword: false,
  //           prefixIcon: Icon(Icons.email_outlined),
  //         ),
  //         const SizedBox(height: 40),
  //         LoginFormField(
  //           controller: nameController,
  //           hintText: 'Name',
  //           placeHolder: '',
  //           isPassword: false,
  //           prefixIcon: Icon(Icons.person_2_outlined),
  //         ),  const SizedBox(height: 40),
  //         LoginFormField(
  //           controller: phoneController,
  //           hintText: 'Phone',
  //           placeHolder: '',
  //           isPassword: false,
  //           prefixIcon: Icon(Icons.phone),
  //         ),
  //         const SizedBox(height: 40),
  //         LoginFormField(
  //           controller: passwordController,
  //           hintText: 'Password',
  //           placeHolder: '',
  //           isPassword: true,
  //           prefixIcon: Icon(Icons.lock_outline),
  //         ),
  //
  //         const SizedBox(height: 20),
  //         _buildLoginButton(),
  //         const SizedBox(height: 20),
  //         _buildSignUpButton(),
  //       ],
  //     ),
  //   );
  // }






  Widget _buildSignUpButton() {
    return CustomButton(
      title: 'SignUp',
      textColor: Colors.white,
      color: AppColors().skyblue,
      onTap: () {
        _signUp();
      },
      isIconVisible: false,
      isLoaderTrue: false,
    );
  }

  void _signUp ()async{
    String email = emailController.text;
    String password = passwordController.text;
    int phone = phoneController.hashCode;
    String name = nameController.text;
     if(GlobalFormKeys.signUpFormKey.currentState!.validate()){
       AppUser? user  = await _auth.signUpWithEmailAndPassword(context,email, password,phone,name,);
       if(user != null){
         ZBotToast.showToastSuccess(message:  'You have successfully registered',);
         print('successfully created');
         Get.to(LoginPage());
       }
     }

  }
}


