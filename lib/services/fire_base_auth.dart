import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_event.dart';
import '../models/users/users.dart';
import '../repository/user_authentication.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AppUser?> signUpWithEmailAndPassword(
      BuildContext context, // Pass context here
      String email,
      String password,
      int phone,
      String name,
      ) async {
    try {
      SharedPreferences preferences =await SharedPreferences.getInstance();
      // Create a new user with email and password
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create an AppUser object
      AppUser appUser = AppUser(
        uid: credential.user!.uid,
        name: name,
        email: email,
        phone: phone.toString(),
        password: password, // Normally, avoid storing the password in plain text
      );

      // Dispatch the event to add the user in Firestore via the BLoC
      BlocProvider.of<UserBloc>(context).add(AddUserEvent(appUser));
      preferences.setString('id', credential.user!.uid.toString());

      return appUser;
    } catch (e) {
      // Print the error for debugging
      print('Error during sign-up: $e');
      return null; // Return null in case of an error
    }
  }


  Future<User?> signInWithEmailAndPassword(String email , String password) async{
    SharedPreferences preferences =await SharedPreferences.getInstance();

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        print('User created successfully with UID: ${credential.user!.uid}');
       await preferences.setString('id', credential.user!.uid.toString());

      } else {
        print('Error: User is null after sign-up');
        return null;
      }
      return  credential.user;
    }catch(e){
      print('error$e');
    }
    return null;
  }
}