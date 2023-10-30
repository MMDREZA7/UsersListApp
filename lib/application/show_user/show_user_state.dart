part of 'show_user_bloc.dart';

@immutable
sealed class UsersListState {}

class UsersListInitial extends UsersListState {}

class UsersListLoading extends UsersListState {}

class UsersListLoaded extends UsersListState {
  final List<User> users;

  UsersListLoaded({
    required this.users,
  });

  List<dynamic> get props => [
        users,
      ];
}
