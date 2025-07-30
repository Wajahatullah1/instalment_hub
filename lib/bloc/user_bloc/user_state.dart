 import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState {}

 class UserInitialState  extends UserState {
 }
 class UserLoadingState extends UserState {}
 class UserSuccessState extends UserState {
   final String message ;
   UserSuccessState(this.message);
 }
 class UserErrorState extends UserState {
   final String errorMessage;

   UserErrorState(this.errorMessage);
 }