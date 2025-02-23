 import 'package:installment_hub/models/customers/customers.dart';

abstract class CustomerEvent {}
 
 class LoadCustomerEvent extends CustomerEvent {
   final CustomerModel model ;
     LoadCustomerEvent(this.model);
 }
 