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

  final TextEditingController _totalCostController = TextEditingController();
  final TextEditingController _profitPercentageController = TextEditingController();
  final TextEditingController _partialInstallmentController = TextEditingController();

  double? profitInInstallment;

  void calculateProfit() {
    double? totalCost = double.tryParse(_totalCostController.text);
    double? profitPercentage = double.tryParse(_profitPercentageController.text);
    double? partialInstallment = double.tryParse(_partialInstallmentController.text);

    if (totalCost == null || profitPercentage == null || partialInstallment == null) {
      setState(() => profitInInstallment = null);
      return;
    }

    double totalProfit = totalCost * (profitPercentage / 100);
    double totalCostWithProfit = totalCost + totalProfit;
    double profitRate = totalProfit / totalCostWithProfit;
    profitInInstallment = partialInstallment * profitRate;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(mq),
            Form(
              key: _formKey,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(_totalCostController, 'Total Cost'),
                      _buildTextField(_profitPercentageController, 'Profit Percentage %'),
                      _buildTextField(_partialInstallmentController, 'Partial Monthly Installment'),

                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors().blueColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: calculateProfit,
                          child: const Text('Calculate Profit'),
                        ),
                      ),
                      const SizedBox(height: 24),

                      if (profitInInstallment != null)
                        _buildProfitResult(profitInInstallment!),

                      const SizedBox(height: 24),
                      _buildNote(),
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

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildProfitResult(double result) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Profit in this installment: ${result.toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildNote() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Note: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors().blueColor,
            ),
          ),
          const TextSpan(
            text:
            'This tool is ideal for businesses that offer flexible payment options. Track profits transparently, make informed decisions, and maintain consistent revenue flow. Adapt installment plans to customer needs with ease.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

Widget _buildHeader(MediaQuerySize mq) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: mq.total * 0.05, horizontal: mq.total * 0.01),
    child: TopAppBar(
      heading: 'Partial Installment Calculator',
      subTitle: 'Enter the amount, percentage, and customer installment to calculate the profit.',
    ),
  );
}
