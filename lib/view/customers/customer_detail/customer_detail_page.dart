import 'package:flutter/material.dart';
import 'package:installment_hub/view/customers/customer_detail/widgets/customer_cart_widget.dart';
import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/top_app_bar.dart';

class CustomerDetailScreen extends StatefulWidget {
  const CustomerDetailScreen({super.key});

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header
            _buildHeader(mq),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomerCartDetail(heading: 'Personal Information'),
                      CustomerCartDetail(heading: 'Evidence No 1'),
                      CustomerCartDetail(heading: 'Evidence No 2'),
                      CustomerCartDetail(heading: 'Product Detail'),
                      CustomerCartDetail(heading: 'Installment Detail'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(MediaQuerySize mq) {
  return Container(
    width: mq.width,
    padding: EdgeInsets.symmetric(
      vertical: mq.total * 0.05,
      horizontal: mq.total * 0.01,
    ),
    child: TopAppBar(
      heading: 'Customer Detail',
      subTitle: 'View your customer details, including personal and installment details',
    ),
  );
}
