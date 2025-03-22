import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_bloc.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_event.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_state.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/models/customers/customers.dart';
import 'package:installment_hub/widgets/form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:uuid/uuid.dart';

import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_small_button.dart';
import '../../../widgets/top_app_bar.dart';

class AddCusomers extends StatefulWidget {
  const AddCusomers({super.key});

  @override
  State<AddCusomers> createState() => _AddCusomersState();
}

class _AddCusomersState extends State<AddCusomers> {
  int currentStep = 0;

  // Controllers for Step 0: Customer Details
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idCardNumberController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController planController = TextEditingController();
  final TextEditingController advancePaymentController = TextEditingController();
  final TextEditingController monthlyInstallmentFeeController = TextEditingController();
  final TextEditingController customerLocationController = TextEditingController();
  final TextEditingController customerPostalAddressController = TextEditingController();

  // Controllers for Step 1: Add Evidence
  final TextEditingController evidenceNameController = TextEditingController();
  final TextEditingController evidencePhoneController = TextEditingController();
  final TextEditingController evidenceIdCardController = TextEditingController();
  final TextEditingController evidenceDesignationController = TextEditingController();
  final TextEditingController evidenceOccupationController = TextEditingController();

  // Controllers for Step 2: Add Product
  final TextEditingController productNameStep2Controller = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productBrandController = TextEditingController();
  final TextEditingController productPlanController = TextEditingController();

  void decrement() {
    setState(() {
      currentStep--;
    });
  }

  @override
  void dispose() {
    // Dispose all controllers to avoid memory leaks
    nameController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    idCardNumberController.dispose();
    productNameController.dispose();
    planController.dispose();
    advancePaymentController.dispose();
    monthlyInstallmentFeeController.dispose();
    customerLocationController.dispose();
    customerPostalAddressController.dispose();
    evidenceNameController.dispose();
    evidencePhoneController.dispose();
    evidenceIdCardController.dispose();
    evidenceDesignationController.dispose();
    evidenceOccupationController.dispose();
    productNameStep2Controller.dispose();
    productPriceController.dispose();
    productBrandController.dispose();
    productPlanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(mq),
                _buildTimeLines(currentStep),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                    BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (currentStep == 0)
                        Column(
                          children: [
                            _buildSectionTitle('Customer Details'),
                            _buildFormField('Name', nameController),
                            _buildFormField('Phone no', phoneNoController),
                            _buildFormField('Email', emailController),
                            _buildFormField('Id Card Number', idCardNumberController),
                            _buildFormField('Product Name', productNameController),
                            _buildFormField('Plan', planController),
                            _buildFormField('Advance Payment', advancePaymentController),
                            _buildFormField('Monthly Installment fee', monthlyInstallmentFeeController),
                            _buildFormField('Customer Location', customerLocationController),
                            _buildFormField('Customer Postal Address', customerPostalAddressController),
                          ],
                        ),
                      if (currentStep == 1)
                        Column(
                          children: [
                            _buildSectionTitle('Add Evidence'),
                            _buildFormField('Evidence Name', evidenceNameController),
                            _buildFormField('Evidence Phone', evidencePhoneController),
                            _buildFormField('Evidence Id Card', evidenceIdCardController),
                            _buildFormField('Evidence Designation', evidenceDesignationController),
                            _buildFormField('Evidence Occupation', evidenceOccupationController),
                          ],
                        ),
                      if (currentStep == 2)
                        Column(
                          children: [
                            _buildSectionTitle('Add Product'),
                            _buildFormField('Product Name', productNameStep2Controller),
                            _buildFormField('Product Price', productPriceController),
                            _buildFormField('Product Brand', productBrandController),
                            _buildFormField('Product Plan', productPlanController),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSmallButton(
                      title: "Previous",
                      onTap: () async {
                        if (currentStep > 0) {
                          decrement();
                        }
                      },
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      isIconVisible: true,
                      isLoaderTrue: true,
                    ),
                    BlocBuilder<CustomerBloc, CustomerState>(
                      builder: (context, state) {
                        return CustomSmallButton(
                          title: currentStep != 2 ? 'Next' : "Submit",
                          onTap: () async {
                            if (currentStep == 0) {
                              setState(() {
                                currentStep = 1;
                              });
                            } else if (currentStep == 1) {
                              setState(() {
                                currentStep = 2;
                              });
                            } else {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String? id =  prefs.getString('id');
                              final Uuid uuid = Uuid();


                              CustomerModel model = CustomerModel(
                                userId:id!,
                                customerId: uuid.v4(),
                                customerName: nameController.text,
                                phoneNo: phoneNoController.text,
                                email: emailController.text,
                                idCardNumber: idCardNumberController.text,
                                productName: productNameController.text,
                                plan: planController.text,
                                advancePayment: advancePaymentController.text,
                                monthlyInstallmentFee: monthlyInstallmentFeeController.text,
                                customerLocation: customerLocationController.text,
                                customerPostalAddress: customerPostalAddressController.text,
                                products: [
                                  Product(
                                    productId: uuid.v4(),
                                    productName: productNameStep2Controller.text,
                                    productWarranty: '1 year',
                                    totalPrice: double.parse(productPriceController.text),
                                    installmentFee: 3000,
                                  ),
                                ],
                                evidence: [
                                  Evidence(
                                    evidenceId: uuid.v4(),
                                    evidenceName: evidenceNameController.text,
                                    evidenceIdcardNumber: evidenceIdCardController.text,
                                    idCardFrontImage: '3232',
                                    idCardBackImage: '3232',
                                    designation: evidenceDesignationController.text,
                                    occupation: evidenceOccupationController.text,
                                  ),
                                ],
                              );
                              BlocProvider.of<CustomerBloc>(context).add(LoadCustomerEvent(model));
                            }
                          },
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          isIconVisible: true,
                          isLoaderTrue: true,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(MediaQuerySize mq) {
    return Container(
      width: mq.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mq.total * 0.05,
          horizontal: mq.total * 0.01,
        ),
        child: const TopAppBar(
          heading: 'Customers',
          subTitle: 'Manage Your Customers here!',
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: FormFields(
        text: label,
        placeHolder: 'Enter $label',
        fucntion: () {},
        controller: controller,
      ),
    );
  }
}
Widget _buildTimeLines(int currentStep) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return TimelineTile(
                axis: TimelineAxis.horizontal,
                alignment: TimelineAlign.center,
                isFirst: index == 0,
                isLast: index == 3 - 1,
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
              );
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     ElevatedButton(
        //       onPressed: currentStep > 0
        //           ? () => setState(() => currentStep--)
        //           : null,
        //       child: const Text('Previous'),
        //     ),
        //     ElevatedButton(
        //       onPressed: currentStep < 2
        //           ? () => setState(() => currentStep++)
        //           : null,
        //       child: const Text('Next'),
        //     ),
        //   ],
        // ),
      ],
    ),
  );
}
