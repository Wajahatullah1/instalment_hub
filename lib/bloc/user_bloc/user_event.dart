import 'package:installment_hub/models/users/users.dart';

abstract class UserEvent {}


class AddUserEvent  extends UserEvent {
   final AppUser user;
     AddUserEvent(this.user);
}

class UpdateUserEvent  extends UserEvent {
  final AppUser user;
  UpdateUserEvent(this.user);
}