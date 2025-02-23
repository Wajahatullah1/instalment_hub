import 'package:flutter/material.dart';
import '../../constraints/app_materials/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
        children: [
      const SizedBox(height: 16),
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(' assets/images/electronics.jpg'),
            child:  Icon(Icons.person),                      ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
                ],
               ),
            ),

          ],
        ),
      ),
    )
    );

  }
}
