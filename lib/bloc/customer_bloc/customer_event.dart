 import 'package:installment_hub/models/customers/customers.dart';

abstract class CustomerEvent {}
 
 class LoadCustomerEvent extends CustomerEvent {
   final CustomerModel model ;
     LoadCustomerEvent(this.model);
 }
 class LoadCustomerEventList extends CustomerEvent {
   final String managerId;
   LoadCustomerEventList(this.managerId);
 }
 