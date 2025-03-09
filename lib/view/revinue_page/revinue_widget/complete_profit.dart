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

  final TextEditingController _totalCostController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();

  double? calculatedProfit;

  void calculateProfit() {
    double? totalCost = double.tryParse(_totalCostController.text);
    double? percentage = double.tryParse(_percentageController.text);

    if (totalCost == null || percentage == null) {
      setState(() => calculatedProfit = null);
      return;
    }

    calculatedProfit = (totalCost * percentage) / 100;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      backgroundColor: AppColors().backgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(mq),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputField(_totalCostController, 'Total Amount', Icons.attach_money),
                        const SizedBox(height: 16),
                        _buildInputField(_percentageController, 'Percentage', Icons.percent),
                        const SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            onPressed: calculateProfit,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: AppColors().blueColor,
                            ),
                            child: const Text(
                              'Calculate Profit',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        if (calculatedProfit != null)
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: 1.0,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Calculated Profit:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '\$${calculatedProfit!.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        const SizedBox(height: 16),
                        const Text(
                          'Note: This tool helps you calculate the profit based on a percentage of the total amount, enabling efficient financial planning.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors().blueColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

Widget _buildHeader(MediaQuerySize mq) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
    child: TopAppBar(
      heading: 'Profit Calculator',
      subTitle: 'Enter values to calculate your profit efficiently',
    ),
  );
}
