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

import '../../../constraints/app_materials/media_query.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/top_app_bar.dart';
class AddCusomers extends StatefulWidget {
  const AddCusomers({super.key});

  @override
  State<AddCusomers> createState() => _AddCusomersState();
}

class _AddCusomersState extends State<AddCusomers> {
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildHeader(mq),
              // Content goes here - can be any widget, e.g., a ListView, text, images, etc.
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Column(
                      children: [
                        FormFields(
                            text: 'Name',
                            placeHolder: 'Enter customer name',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Phone no',
                            placeHolder: 'Enter customer ph no',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Email',
                            placeHolder: 'Enter customer email',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Id Card Number',
                            placeHolder: 'Enter customer id card number',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Product Name',
                            placeHolder: 'Enter product name',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Plan',
                            placeHolder: 'Enter installment plan',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Advance Payment',
                            placeHolder: 'Enter advance payment',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Monthly Installment fee',
                            placeHolder: 'Enter customer monthly fee',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Customer Location',
                            placeHolder: 'Enter customer location',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Customer Postal Address',
                            placeHolder: 'Enter customer post address',
                            fucntion: (){},
                            controller: name
                         ),(mq.total*0.01).toHeight,

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Add Evidence',style: TextStyle(
                            fontSize: mq.total*0.014,fontWeight: FontWeight.bold,fontFamily: 'Inter',color: AppColors().blueColor
                          ),),
                        ),
                        (mq.total*0.01).toHeight,
                        FormFields(
                            text: 'Evidence Name',
                            placeHolder: 'Enter evidence name',
                            fucntion: (){},
                            controller: name
                         ),  FormFields(
                            text: 'Evidence Phone',
                            placeHolder: 'Enter evidence Phone no',
                            fucntion: (){},
                            controller: name
                         ),  FormFields(
                            text: 'Evidence Id Card',
                            placeHolder: 'Enter evidence Id card number',
                            fucntion: (){},
                            controller: name
                         ),
                        FormFields(
                            text: 'Evidence Designation',
                            placeHolder: 'Enter evidence designation',
                            fucntion: (){},
                            controller: name
                         ),
                        FormFields(
                            text: 'Evidence occupation',
                            placeHolder: 'Enter evidence occupation',
                            fucntion: (){},
                            controller: name
                         ),
                      ],
                    ),
                  ),
                ),
              ),

              // The InkWell button at the bottom
              BlocBuilder<CustomerBloc, CustomerState>(

                builder: (BuildContext context, state) {
                  return
                    CustomButton(title: 'Submit',onTap: ()async{
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                     var id  =  prefs.getString('id').toString();
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
                              installmentFee: 3000)
                        ],
                        evidence: [
                          Evidence(
                              evidenceId: 3,
                              evidenceName: 'shoaib',
                              evidenceIdcardNumber: '1345939433232',
                              idCardFrontImage: '3232',
                              idCardBackImage: '3232',
                              designation: 'govt officor',
                              occupation: 'IT technition ')
                        ]);
                    BlocProvider.of<CustomerBloc>(context).add(LoadCustomerEvent(model));
                    if (state is CustomerInitialState) {
                      return Text('Ready to add a customer');
                    } else if (state is CustomerLoadingState) {
                      return CircularProgressIndicator();
                    } else if (state is CustomerSuccessState) {
                      return Text(state.successMessage);
                    } else if (state is CustomerErrorState) {
                      return Text(state.errorMessage);
                    } else {
                      return SizedBox.shrink();
                    }
                    },);
                },
              ),
            ],
          ),
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
