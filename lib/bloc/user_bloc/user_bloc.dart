import 'package:bloc/bloc.dart';
import 'package:installment_hub/models/users/users.dart';
import '../../repository/user_authentication.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    // Register event handlers
    on<AddUserEvent>(_onAddUserEvent);
    // on<UpdateUserEvent>(_onUpdateUserEvent);
  }

  // Handler for AddUserEvent
  Future<void> _onAddUserEvent(AddUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      await UserRepository().addUser(event.user);
      emit(UserSuccessState('User added successfully'));
    } catch (e) {
      emit(UserErrorState('Failed to add user: $e'));
    }
  }

  // Handler for UpdateUserEvent
  Future<void> getCustomers(UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      await UserRepository().updateUser(event.user);
      emit(UserSuccessState('User updated successfully'));
    } catch (e) {
      emit(UserErrorState('Failed to update user: $e'));
    }
  }

}
