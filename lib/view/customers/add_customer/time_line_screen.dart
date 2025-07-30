import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AddCustomerTimeline extends StatefulWidget {
  const AddCustomerTimeline({super.key});

  @override
  State<AddCustomerTimeline> createState() => _AddCustomerTimelineState();
}

class _AddCustomerTimelineState extends State<AddCustomerTimeline> {
  int currentStep = 0;

  List<String> steps = [
    "Add Customer Details",
    "Add Evidence",
    "Review & Submit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Customer')),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  isFirst: index == 0,
                  isLast: index == steps.length - 1,
                  beforeLineStyle: const LineStyle(color: Colors.blueAccent),
                  afterLineStyle: const LineStyle(color: Colors.blueAccent),
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    color: currentStep >= index ? Colors.blue : Colors.grey,
                    iconStyle: IconStyle(
                      iconData: currentStep >= index
                          ? Icons.check
                          : Icons.circle,
                      color: Colors.white,
                    ),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      steps[index],
                      style: TextStyle(
                        color: currentStep >= index
                            ? Colors.blue
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Step-wise content
          Expanded(
            child: IndexedStack(
              index: currentStep,
              children: [
                _buildCustomerDetailsForm(),
                _buildEvidenceForm(),
                _buildReviewAndSubmit()
              ],
            ),
          ),

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentStep > 0)
                ElevatedButton(
                  onPressed: () => setState(() => currentStep--),
                  child: const Text('Back'),
                ),
              ElevatedButton(
                onPressed: () {
                  if (currentStep < steps.length - 1) {
                    setState(() => currentStep++);
                  } else {
                    // Handle final submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Submitted Successfully")),
                    );
                  }
                },
                child: Text(
                    currentStep == steps.length - 1 ? 'Submit' : 'Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerDetailsForm() {
    return const Center(child: Text('Add Customer Details Form'));
  }

  Widget _buildEvidenceForm() {
    return const Center(child: Text('Add Evidence Form'));
  }

  Widget _buildReviewAndSubmit() {
    return const Center(child: Text('Review & Submit Details'));
  }
}
