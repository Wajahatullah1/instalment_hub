// lib/blocs/user_bloc/user_repository.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/users/users.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(AppUser user) async {
    final docRef = _firestore.collection('users').doc(user.uid);
    await docRef.set(user.toJson());
  }
  Future<void> updateUser(AppUser user) async {
    final docRef = _firestore.collection('users').doc(user.uid);
    await docRef.set(user.toJson());
  }
}
