import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';
import 'package:installment_hub/view/customers/customer_detail/customer_detail_page.dart';
import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/top_app_bar.dart';

class CustomerMainPage extends StatefulWidget {
  const CustomerMainPage({super.key});

  @override
  State<CustomerMainPage> createState() => _CustomerMainPageState();
}

class _CustomerMainPageState extends State<CustomerMainPage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildHeader(mq),
              _buildSearchBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCustomerCard(mq);
                    },
                  ),
                ),
              ),
              CustomButton(
                title: 'Add New Customer',
                onTap: () => Get.to(AddCusomers()),
                isIconVisible: true,
                isLoaderTrue: true,
                color: Colors.blueAccent,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader(MediaQuerySize mq) {
  return Container(
    width: mq.width,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: mq.total * 0.05,
        horizontal: mq.total * 0.01,
      ),
      child: const TopAppBar(
        heading: 'Customers',
        subTitle: 'Manage Your Customers here!',
      ),
    ),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search your customers here...',
          prefixIcon: Icon(Icons.search, color: AppColors().blueColor),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    ),
  );
}

Widget _buildCustomerCard(MediaQuerySize mq) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blueAccent, AppColors().skyblue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.blueAccent.withOpacity(0.3),
          blurRadius: 10,
          offset: Offset(0, 4),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Muhammad Abbas',
              style: TextStyle(
                fontSize: mq.total * 0.018,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Customer ID: 12345',
              style: TextStyle(
                fontSize: mq.total * 0.012,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => Get.to(CustomerDetailScreen()),
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
