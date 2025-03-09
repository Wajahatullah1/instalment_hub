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
  final TextEditingController name = TextEditingController();
  int currentStep=0;
  void decremnt(){
    setState(() {
      currentStep --;
    });
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(currentStep==0)
                       Column(
                         children: [
                           _buildSectionTitle('Customer Details'),
                           _buildFormField('Name'),
                           _buildFormField('Phone no'),
                           _buildFormField('Email'),
                           _buildFormField('Id Card Number'),
                           _buildFormField('Product Name'),
                           _buildFormField('Plan'),
                           _buildFormField('Advance Payment'),
                           _buildFormField('Monthly Installment fee'),
                           _buildFormField('Customer Location'),
                           _buildFormField('Customer Postal Address'),
                         ],
                       ),
                     if(currentStep==1)
                      Column(
                        children: [
                          _buildSectionTitle('Add Evidence'),
                          _buildFormField('Evidence Name'),
                          _buildFormField('Evidence Phone'),
                          _buildFormField('Evidence Id Card'),
                          _buildFormField('Evidence Designation'),
                          _buildFormField('Evidence Occupation'),

                        ],
                      ),
                       if(currentStep==2)
                       Column(
                         children: [
                           _buildSectionTitle('Add Product'),
                           _buildFormField('Product Name'),
                           _buildFormField('Product Price'),
                           _buildFormField('Product Brand'),
                           _buildFormField('Product Plan'),
                         ],
                       )

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSmallButton(
                      title:"Previous",
                      onTap: () async {
                        if(currentStep>0){
                          decremnt();
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
                          title: currentStep!=2?'Next':"Submit",
                          onTap: () async {
                            if(currentStep==0){
                              setState(() {
                                currentStep=1;
                              });
                            }
                            else if(currentStep==1){
                              setState(() {
                                currentStep=2;
                              });
                            }
                         else{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var id = prefs.getString('id').toString();

                              CustomerModel model = CustomerModel(
                                userId: 0,
                                customerId: id,
                                customerName: 'wajahat',
                                phoneNo: '03344554455',
                                email: 'oso.wajahatullah@gmail.com',
                                idCardNumber: '1430106271513',
                                productName: 'Mobile redmi',
                                plan: '12 month',
                                advancePayment: '6000',
                                monthlyInstallmentFee: '3000',
                                customerLocation: 'koaht',
                                customerPostalAddress: 'lachi kohat',
                                products: [
                                  Product(
                                    productId: 3,
                                    productName: 'redmi',
                                    productWarranty: '1 year',
                                    totalPrice: 56000,
                                    installmentFee: 3000,
                                  ),
                                ],
                                evidence: [
                                  Evidence(
                                    evidenceId: 3,
                                    evidenceName: 'shoaib',
                                    evidenceIdcardNumber: '1345939433232',
                                    idCardFrontImage: '3232',
                                    idCardBackImage: '3232',
                                    designation: 'govt officor',
                                    occupation: 'IT technician ',
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
                )

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

  Widget _buildFormField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: FormFields(
        text: label,
        placeHolder: 'Enter $label',
        fucntion: () {},
        controller: name,
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
