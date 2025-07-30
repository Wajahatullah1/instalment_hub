import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:installment_hub/bloc/user_bloc/user_bloc.dart';
import 'package:installment_hub/bloc/user_bloc/user_state.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/app_images.dart';
import 'package:installment_hub/constraints/app_materials/flutter_cherry_toast.dart';
import 'package:installment_hub/constraints/global_keys.dart';
import 'package:installment_hub/services/fire_base_auth.dart';
import 'package:installment_hub/services/forms_validation.dart';
import 'package:installment_hub/view/home_screen/homeScreen.dart';
import 'package:installment_hub/view/signUp_screen/sign_up.dart';
import 'package:installment_hub/widgets/custom_button.dart';
import '../../widgets/bottom_text_widget.dart';
import '../../widgets/login_form_fields.dart';

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
        gradient: LinearGradient(
          colors: [
            AppColors().skyblue,
            Colors.blue[900]!, // or use Color(0xff0D47A1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
         image: DecorationImage(
           fit: BoxFit.cover,
             image: AssetImage(
           AppImages.splashScreenImage,
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
                'Login',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Text(
                'Sign in your account and start managing',
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
      child: Form(
        key: GlobalFormKeys.loginFormKey,
        child: SizedBox(
          width: mediaSize.width,
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
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 14),
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
            controller: passwordController,
            hintText: 'Password',
            placeHolder: 'Enter your password',
            isPassword: true,
            prefixIcon: Icon(Icons.lock_outline_rounded,color: AppColors().greyColor,),
            validator:CustomerFormValidator.validatePassword,
          ),
          const SizedBox(height: 20),
          _buildRememberForgot(),
          const SizedBox(height: 20),
          _buildLoginButton(),
          const SizedBox(height: 150),
           Align(
            alignment: Alignment.bottomCenter,
            child: BottomTextWidget(
              textBlack: 'Do not have an account? ',
              textBlue: 'Signup',
              onTap: (){
                Get.to(const SignUpPage());
              },
            ),
          ),
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
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.7, // 80% of original size (adjust as needed)
                child: Checkbox(
                  value: rememberUser,
                  onChanged: (value) {
                    setState(() {
                      rememberUser = value!;
                    });
                  },
                ),
              ),
          
              _buildGreyText("Remember me"),
          
             ]
          ),
          _buildForgot('Forget Password?')
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<UserBloc, UserState>(
   builder: (context, state) {
     final isLoader  = state is UserLoadingState;
    return
      CustomButton(
      title: 'Sign in',
      textColor: Colors.white,
      color: AppColors().skyblue,
      onTap: () {
        _login();
      },
      isIconVisible: false,
      isLoaderTrue: isLoader,
    );
  },
);
  }


  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if(GlobalFormKeys.loginFormKey.currentState!.validate()){
      User? user =
      await _authServices.signInWithEmailAndPassword(email, password);
      if (user != null) {

        ZBotToast.showToastSuccess(message:  'Successfully logged in',);
        Get.to(const HomePage());
      } else {
        print('please sigup first ');
        ZBotToast.showToastError(message:  'Invalid user',);

      }
    }

  }
  
  Widget _buildForgot (String text){
    return GestureDetector(
      onTap: (){
        
      },
      child: Text(
        text,
        style:  TextStyle(color: AppColors().blueColor),
      ),
    );
  }
}

