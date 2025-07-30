import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import '../../../constraints/app_materials/app_colors.dart';
import '../../../constraints/app_materials/media_query.dart';

class CompletedCustomer extends StatefulWidget {
  const CompletedCustomer({super.key});

  @override
  State<CompletedCustomer> createState() => _CompletedCustomerState();
}

class _CompletedCustomerState extends State<CompletedCustomer> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Completed Customers',
              style: TextStyle(
                fontSize: mq.total * 0.018,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: AppColors().blueColor,
              ),
            ),
          ),
          (mq.height * 0.03).toHeight,
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: mq.total * 0.01,
                    horizontal: mq.total * 0.02,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors().lightBlueColor,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'Muhammad Abbas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mq.total * 0.016,
                    ),
                  ),
                  subtitle: Text(
                    'Status: Completed',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever, color: Colors.red),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
