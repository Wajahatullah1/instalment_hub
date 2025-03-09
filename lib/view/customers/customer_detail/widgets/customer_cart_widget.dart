import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';

class CustomerCartDetail extends StatefulWidget {
  final String heading;
  const CustomerCartDetail({super.key, required this.heading});

  @override
  State<CustomerCartDetail> createState() => _CustomerCartDetailState();
}

class _CustomerCartDetailState extends State<CustomerCartDetail> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          _buildAbout(widget.heading, context),
          Center(
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadowColor: Colors.blueAccent.withOpacity(0.2),
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Muhammad Abbas',
                          style: TextStyle(
                            fontSize: mq.total * 0.022,
                            fontWeight: FontWeight.bold,
                            color: AppColors().blueColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Get.to(AddCusomers()),
                          icon: const Icon(Icons.edit, color: Colors.red),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    const SizedBox(height: 10),
                    _buildRow('Name:', 'Muhammad Abbas'),
                    _buildRow('Email:', 'ab@gmail.com'),
                    _buildRow('Phone:', '0335934343'),
                    _buildRow('Address:', 'KOAHT, KDA'),
                    _buildRow('ID:', '13323232329328392'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget _buildAbout(String heading, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        heading,
        style: TextStyle(
          color: AppColors().blueColor,
          fontSize: MediaQuerySize(context).total * 0.018,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
    ),
  );
}
