import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_bloc.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_event.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_state.dart';
import 'package:installment_hub/bloc/user_bloc/user_state.dart';
import 'package:installment_hub/constraints/app_materials/app_colors.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';
import 'package:installment_hub/constraints/global_keys.dart';
import 'package:installment_hub/models/customers/customers.dart';
import 'package:installment_hub/services/forms_validation.dart';
import 'package:installment_hub/view/customers/add_customer/success_screen.dart';
import 'package:installment_hub/widgets/common/custom_app_bar.dart';
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
       if(currentStep!=0){
         currentStep--;

       }
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
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CustomAppBar(pageName: 'Instalment'),
              StepProgressIndicator(currentStep: currentStep ,onTap: ()=>decrement(),),
              const SizedBox(height: 20),

              /// ✅ Make form content scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: GlobalFormKeys.customerFormKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (currentStep == 0)
                                Column(
                                  children: [
                                    _buildSectionTitle('Enter your personal details'),
                                    _buildFormField('Name', nameController,TextInputType.text,CustomerFormValidator.validateField),
                                    _buildFormField('Phone no', phoneNoController,TextInputType.number,CustomerFormValidator.validatePhone),
                                    _buildFormField('Email', emailController,TextInputType.text,CustomerFormValidator.validateEmail),
                                    _buildFormField('Id Card Number', idCardNumberController,TextInputType.number,CustomerFormValidator.validateCNIC),
                                    _buildFormField('Product Name', productNameController,TextInputType.text,CustomerFormValidator.validateField),
                                    _buildFormField('Plan', planController,TextInputType.text,CustomerFormValidator.validateField),
                                    _buildFormField('Advance Payment', advancePaymentController,TextInputType.number,CustomerFormValidator.validateField),
                                    _buildFormField('Monthly Installment fee', monthlyInstallmentFeeController,TextInputType.number,CustomerFormValidator.validateInstalmentField),
                                    _buildFormField('Customer Postal Address', customerPostalAddressController,TextInputType.text,CustomerFormValidator.validateField),
                                  ],
                                ),
                              if (currentStep == 1)
                                Column(
                                  children: [
                                    _buildSectionTitle('Evidence Information'),
                                    _buildFormField('Evidence Name', evidenceNameController,TextInputType.text,CustomerFormValidator.validateField),
                                    _buildFormField('Evidence Phone', evidencePhoneController,TextInputType.number,CustomerFormValidator.validatePhone),
                                    _buildFormField('Evidence Id Card', evidenceIdCardController,TextInputType.number,CustomerFormValidator.validateCNIC),
                                    _buildFormField('Evidence Occupation', evidenceOccupationController,TextInputType.text,CustomerFormValidator.validateField),
                                  ],
                                ),
                              if (currentStep == 2)
                                Column(
                                  children: [
                                    _buildSectionTitle('Product Information'),
                                    _buildFormField('Product Name', productNameStep2Controller,TextInputType.text,CustomerFormValidator.validateField),
                                    _buildFormField('Product Price', productPriceController,TextInputType.number,CustomerFormValidator.validateField),
                                    _buildFormField('Product Brand', productBrandController,TextInputType.text,CustomerFormValidator.validateField),
                                    _buildFormField('Product Plan', productPlanController,TextInputType.text,CustomerFormValidator.validateField),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              /// ✅ Fixed button at the bottom
              BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  return CustomButton(
                    title: currentStep != 2 ? 'Next' : "Submit",
                    onTap: () async {
                      if (currentStep == 0&&GlobalFormKeys.customerFormKey.currentState!.validate()) {
                        setState(() => currentStep = 1);
                      } else if (currentStep == 1&&GlobalFormKeys.customerFormKey.currentState!.validate()) {
                        setState(() => currentStep = 2);
                      } else {
                        if(GlobalFormKeys.customerFormKey.currentState!.validate()){
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          String? id = prefs.getString('id');
                          final Uuid uuid = Uuid();

                          CustomerModel model = CustomerModel(
                            userId: id!,
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
                          if(state is CustomerSuccessState){
                            Get.to(SuccessScreen());
                          }
                      }

                      }
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    isIconVisible: true,
                    isLoaderTrue: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller,TextInputType type, String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: FormFields(
        text: label,
        placeHolder: 'Enter $label',
        fucntion: () {},
        controller: controller,
        type:type ,
        validator:validator ,
      ),
    );
  }
}

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;// 0, 1, or 2
  final void Function()? onTap;
  const StepProgressIndicator({super.key, required this.currentStep, this.onTap});

  final List<String> steps = const [
    'Personal Info',
    'Avoidance Info',
    'Product Info'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress bar
        LinearProgressIndicator(
          value: (currentStep + 1) / steps.length,
          backgroundColor: Colors.grey[300],
          color: AppColors().skyblue,
          minHeight: 4,
        ),
        const SizedBox(height: 20),

        // Steps row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final isActive = index == currentStep;
            final isCompleted = index < currentStep;

            return GestureDetector(
               onTap: onTap,
              child: Column(
                children: [
                  // Circle
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isCompleted || isActive ? AppColors().skyblue : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isCompleted || isActive ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Step label
                  Text(
                    steps[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive ? AppColors().skyblue : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

