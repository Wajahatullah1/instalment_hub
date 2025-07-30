import 'package:bloc/bloc.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_event.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_state.dart';
import 'package:installment_hub/models/customers/customers.dart';
import 'package:installment_hub/repository/add_customer_respo.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitialState()) {
    on<LoadCustomerEvent>(_addCustomer);
    on<LoadCustomerEventList>(_getCustomer);
  }

  Future<void> _addCustomer(LoadCustomerEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoadingState(true));

    try {
      await CustomerRepository().addCustomer(event.model);
      emit(CustomerSuccessState('Customer added successfully'));
    } catch (e) {
      emit(CustomerErrorState('Failed to add customer'));
      throw Exception('Failed to add customer: $e');
    }
  }

  Future<void> _getCustomer(LoadCustomerEventList event, Emitter<CustomerState> emit) async {
    emit(CustomerLoadingState(true));

    try {
      // Fetch customers by managerId
      print('888888888');
      List<CustomerModel> customers = await CustomerRepository().getCustomersByManagerId(event.managerId);
      print('Fetched ${customers[0].customerName} customers for managerId: ${event.managerId}');
      emit(CustomerCompleteState(customers));
    } catch (e) {
      emit(CustomerErrorState('Failed to fetch customers'));
      throw Exception('Failed to fetch customers: $e');
    }
  }
}