abstract class CustomerState {}

class CustomerInitialState extends CustomerState {}

class CustomerLoadingState extends CustomerState {
  final bool isLoading;

  CustomerLoadingState(this.isLoading);
}

class CustomerErrorState extends CustomerState {
  final String errorMessage;

  CustomerErrorState(this.errorMessage);
}

class CustomerSuccessState extends CustomerState {
  final String successMessage;
  CustomerSuccessState(this.successMessage);
}
