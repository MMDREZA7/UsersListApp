part of 'show_user_bloc.dart';

@immutable
sealed class UsersListEvent {}

class UsersListAddUser extends UsersListEvent {
  final User user;

  UsersListAddUser({
    required this.user,
  });

  List<Object> get props => [user];
}

class UsersListRemoveUser extends UsersListEvent {
  final User user;

  UsersListRemoveUser({
    required this.user,
  });

  List<Object> get props => [user];
}
