import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/top_app_bar.dart';

class ProfitCalculatorForm2 extends StatefulWidget {
  const ProfitCalculatorForm2({super.key});

  @override
  State<ProfitCalculatorForm2> createState() => _ProfitCalculatorForm2State();
}

class _ProfitCalculatorForm2State extends State<ProfitCalculatorForm2> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _totalCostController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();

  // Variable to store the calculated profit
  double? calculatedProfit;

  // Function to calculate the profit
  void calculateProfit() {
    // Parse inputs
    double? totalCost = double.tryParse(_totalCostController.text);
    double? percentage = double.tryParse(_percentageController.text);

    // Validate inputs
    if (totalCost == null || percentage == null) {
      setState(() {
        calculatedProfit = null;
      });
      return;
    }

    // Calculate the profit
    calculatedProfit = (totalCost * percentage) / 100;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(mq),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Total Cost input
                    TextFormField(
                      controller: _totalCostController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Total Amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Percentage input
                    TextFormField(
                      controller: _percentageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Percentage',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Calculate button
                    Center(
                      child: ElevatedButton(
                        onPressed: calculateProfit,
                        child: const Text('Calculate Profit'),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Display calculated profit
                    if (calculatedProfit != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Calculated Profit: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: '${calculatedProfit!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      )
                    else
                      const SizedBox.shrink(),

                    // Note text section
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Note: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              color: AppColors().blueColor,
                            ),
                          ),
                          TextSpan(
                            text: 'This tool helps you calculate the profit based on a percentage of the total amount, enabling efficient financial planning.',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors().greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Header section preserved from your original code
Widget _buildHeader(MediaQuerySize mq) {
  return Container(
    width: mq.width,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: mq.total * 0.05,
        horizontal: mq.total * 0.01,
      ),
      child: TopAppBar(
        heading: 'Complete Profit Calculator',
        subTitle: 'Enter amount and percentage to find out the profit',
      ),
    ),
  );
}
