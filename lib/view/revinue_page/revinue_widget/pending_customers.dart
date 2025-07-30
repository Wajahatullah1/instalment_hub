import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import '../../../constraints/app_materials/app_colors.dart';
import '../../../constraints/app_materials/media_query.dart';

class PendingCustomers extends StatefulWidget {
  const PendingCustomers({super.key});

  @override
  State<PendingCustomers> createState() => _PendingCustomersState();
}

class _PendingCustomersState extends State<PendingCustomers> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pending Customers',
            style: TextStyle(
              fontSize: mq.total * 0.016,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              color: AppColors().blueColor,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor: AppColors().lightBlueColor,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'Muhammad Abbas',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Status: Pending',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: Colors.blueAccent),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
