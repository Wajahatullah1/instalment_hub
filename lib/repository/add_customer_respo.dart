import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/customers/customers.dart';

class CustomerRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addCustomer(CustomerModel customer) async {
    try {
      await _firestore.collection('customers').doc(customer.customerId.toString()).set(customer.toMap());
      print('Customer added successfully');
    } catch (e) {
      print('Failed to add customer: $e');
      throw Exception('Failed to add customer');
    }
  }
}
