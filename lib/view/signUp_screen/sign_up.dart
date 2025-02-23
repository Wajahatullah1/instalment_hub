
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/models/users/users.dart';
import 'package:installment_hub/services/fire_base_auth.dart';
import 'package:installment_hub/view/login_screen/login_screen.dart';


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
      decoration: BoxDecoration(
            color: AppColors().greyColor,
          image: DecorationImage(
            opacity: 3.6,
              scale: 1.5,
              image: AssetImage(
                '',

              ),fit: BoxFit.cover)
      ),
      child: Image.asset('assets/images/electronics.jpg'),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              color:  AppColors().lightBlueColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Please login with your information"),
        const SizedBox(height: 30),
        _buildGreyText("Name"),
        _buildInputField(nameController),
        const SizedBox(height: 10),
        _buildGreyText("Email"),
        _buildInputField(emailController, ),
        const SizedBox(height: 10),
        _buildGreyText("Phone No"),
        _buildInputField(phoneController,),
        const SizedBox(height: 10),
        _buildGreyText("Password"),
        _buildInputField(passwordController,),
        const SizedBox(height: 10),

        _buildLoginButton(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }


  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
        _signUp();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors().lightBlueColor,
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: AppColors().lightBlueColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("SIGNUP"),
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


