import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_bloc.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_state.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/models/customers/customers.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';
import 'package:installment_hub/view/customers/customer_detail/customer_detail_page.dart';
import 'package:installment_hub/widgets/common/custom_app_bar.dart';
import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/common/bottom_nav_bar.dart';

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
               const CustomAppBar(pageName: 'Customers'),
              _buildSearchBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<CustomerBloc, CustomerState>(
                    builder: (context, state) {
                      if (state is CustomerLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CustomerCompleteState) {
                        return ListView.builder(
                          itemCount: state.customers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildCustomerCard(state.customers[index], mq);
                          },
                        );
                      } else if (state is CustomerErrorState) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return Center(child: Text('No customers found'));
                      }
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Add',
        backgroundColor: AppColors().skyblue,
        onPressed: () {
          Get.to(AddCusomers());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (int){

        },
      ),
    );
  }
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search your customers here...',
                  prefixIcon: Icon(Icons.search, color: AppColors().blueColor),
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            CircleAvatar(
              radius: 19,
              child: Image.asset('assets/images/filter.png'),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _buildCustomerCard(CustomerModel customer, MediaQuerySize mq) {
  return InkWell(
    onTap: () => Get.to(CustomerDetailScreen(model: customer)),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8,),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row: Name + Duration
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Name & Location
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.customerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mq.total * 0.018,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    customer.customerLocation,
                    style: TextStyle(
                      fontSize: mq.total * 0.014,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              /// Duration Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors().skyblue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                     Icon(Icons.watch_later_outlined, color: AppColors().whiteColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      customer.plan,
                      style:  TextStyle(
                        color: AppColors().whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Bottom Row: Financial Summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAmountColumn("Total Buying", '4000'),
              _buildAmountColumn("Paid", customer.advancePayment),
              _buildAmountColumn("Unpaid", '3000'),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildAmountColumn(String label, String amount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      const SizedBox(height: 4),
      Text(
        'PKR $amount',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
