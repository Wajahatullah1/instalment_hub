import 'package:flutter/material.dart';
import 'package:installment_hub/constraints/app_materials/size.dart';

import '../../../constraints/app_materials/app_colors.dart';
import '../../../constraints/app_materials/media_query.dart';
class PendingCustomers extends StatefulWidget {
  const PendingCustomers({super.key});

  @override
  State<PendingCustomers> createState() => _PendingCustomersState();
}

class _PendingCustomersState extends State<PendingCustomers> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuerySize(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Pending customers',style: TextStyle(
                  fontSize: mq.total*0.014,fontWeight: FontWeight.bold,fontFamily: 'Inter',color: AppColors().blueColor
              ),),
            ),
            (mq.height*0.03).toHeight,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                 itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: mq.total*0.013, horizontal:  mq.total*0.01,),
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Muhammad Abbas'),
                                Text('Status: Pending'),
                                Icon(Icons.remove_red_eye, color: AppColors().lightBlueColor,)
                              ],
                            ),
                          ),
                        ),
                      (mq.height*0.01).toHeight,
                    ],
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}
