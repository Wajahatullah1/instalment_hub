import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/media_query.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/models/customers/customers.dart';
import 'package:installment_hub/view/customers/add_customer/add_customer.dart';

class CustomerCartDetail extends StatefulWidget {
  final String heading;
  final CustomerModel model;
  const CustomerCartDetail({super.key, required this.heading, required this.model});

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
                          widget.model.customerName,
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
                    if(widget.heading=="Personal Information")
                      Column(children: [
                        _buildRow('Name:', widget.model.customerName),
                        _buildRow('Email:', widget.model.email),
                        _buildRow('Phone:', widget.model.phoneNo),
                        _buildRow('Address:', widget.model.customerPostalAddress),
                        _buildRow('ID:', widget.model.idCardNumber),
                      ],),
                    if(widget.heading!="Personal Information")
                      ListView.builder(
                        itemCount: widget.model.evidence.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return widget.heading=="Evidence"?
                              Container():
                            Column(
                            children: [
                              _buildRow('Name:', widget.model.evidence[index].evidenceName),
                              _buildRow('Occupation:', widget.model.evidence[index].occupation),
                              _buildRow('Id Card Number:', widget.model.evidence[index].evidenceIdcardNumber),
                            ],
                          );
                        },
                      ), if(widget.heading=='Product Detail' &&widget.heading!='Evidence')
                      ListView.builder(
                        itemCount: widget.model.products.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              _buildRow('Name:', widget.model.products[index].productName),
                              _buildRow('Installment Fee:', widget.model.products[index].installmentFee.toString()),
                              _buildRow('Total Price:', widget.model.products[index].totalPrice.toString()),
                              _buildRow('Total Price:', widget.model.products[index].productWarranty.toString()),
                              _buildRow('Plan:', widget.model.plan),
                              _buildRow('Plan:', widget.model.monthlyInstallmentFee),
                            ],
                          );
                        },
                      )
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
