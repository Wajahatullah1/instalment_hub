import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';

import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/top_app_bar.dart';
class ProfitCalculatorForm extends StatefulWidget {
  const ProfitCalculatorForm({super.key});

  @override
  State<ProfitCalculatorForm> createState() => _ProfitCalculatorFormState();
}

class _ProfitCalculatorFormState extends State<ProfitCalculatorForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _totalCostController = TextEditingController();
  final TextEditingController _profitPercentageController =
  TextEditingController();
  final TextEditingController _partialInstallmentController =
  TextEditingController();

  // Variables to store calculated results
  double? profitInInstallment;

  // Function to calculate profit
  void calculateProfit() {
    // Parse inputs
    double? totalCost = double.tryParse(_totalCostController.text);
    double? profitPercentage = double.tryParse(_profitPercentageController.text);
    double? partialInstallment =
    double.tryParse(_partialInstallmentController.text);

    if (totalCost == null ||
        profitPercentage == null ||
        partialInstallment == null) {
      setState(() {
        profitInInstallment = null;
      });
      return;
    }

    // Calculate total profit and profit percentage
    double totalProfit = totalCost * (profitPercentage / 100);
    print('here is total profit $totalProfit');
    double totalCostWithProfit = totalCost + totalProfit;

    // Calculate profit percentage of each installment
    double profitRate = totalProfit / totalCostWithProfit;

    // Calculate profit in the partial installment
    profitInInstallment = partialInstallment * profitRate;

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
                        labelText: 'Total Cost',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Profit Percentage input
                    TextFormField(
                      controller: _profitPercentageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Profit Percentage %',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Partial Monthly Installment input
                    TextFormField(
                      controller: _partialInstallmentController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Partial Monthly Installment',
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

                    // Display profit result and the note
                    if (profitInInstallment != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Profit in this installment: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87, // Adjust the color as needed
                                  ),
                                ),
                                TextSpan(
                                  text: profitInInstallment!.toStringAsFixed(2),
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
                              color: AppColors().blueColor, // Adjust the color as needed
                            ),
                          ),
                          TextSpan(
                            text: 'This tool is perfect for businesses that offer flexible payment options, '
                                'allowing you to transparently track profits even on partial payments. '
                                'Make informed decisions and keep your payment plans efficient and profitable! '
                                'With this tool, you can easily adjust installment plans based on customer needs, '
                                'ensuring both customer satisfaction and consistent revenue flow. '
                                'Track every partial payment effortlessly, helping you stay on top of your finances. '
                                'Whether you’re a small business or a large enterprise, streamline your payment process and maximize profitability.',

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
Widget _buildHeader(MediaQuerySize mq) {
  return Container(
    width: mq.width,
    child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mq.total * 0.05, horizontal: mq.total * 0.01),
        child: TopAppBar(heading: 'Partial Installment Calculator', subTitle: 'Enter amount and percentage , and customer partial instalment to find out the profit')
    ),
  );
}