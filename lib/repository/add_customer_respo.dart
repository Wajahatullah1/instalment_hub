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
  Future<List<CustomerModel>> getCustomersByManagerId(String managerId) async {
    try {
      // Query the 'customers' collection where managerId matches
      QuerySnapshot querySnapshot = await _firestore
          .collection('customers')
          .where('userId', isEqualTo: managerId)
          .get();

      // Convert Firestore documents to CustomerModel objects
      List<CustomerModel> customers = querySnapshot.docs.map((doc) {
        return CustomerModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      print('Fetched ${customers.length} customers for managerId: $managerId');
      return customers;
    } catch (e) {
      print('Failed to fetch customers: $e');
      throw Exception('Failed to fetch customers');
    }
  }
}

