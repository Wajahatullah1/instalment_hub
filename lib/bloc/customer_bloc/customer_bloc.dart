import 'package:bloc/bloc.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_event.dart';
import 'package:installment_hub/bloc/customer_bloc/customer_state.dart';
import 'package:installment_hub/repository/add_customer_respo.dart';

class CustomerBloc extends Bloc<CustomerEvent ,CustomerState>  {
     CustomerBloc (): super(CustomerInitialState()){
       on<LoadCustomerEvent> (_addCustomer);
     }

     Future<void> _addCustomer (LoadCustomerEvent event , Emitter<CustomerState> emit) async{
         emit(CustomerLoadingState(true));

         try{
           await CustomerRepository().addCustomer(event.model);
            emit (CustomerSuccessState('Customer added successfully'));
         }
         catch (e){
            emit(CustomerErrorState('failed to add Customer'));
           throw Exception('failed to add customer $e');
         }
     }
}