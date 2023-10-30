import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'show_user_event.dart';
part 'show_user_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  List<User> useres = [];

  UsersListBloc() : super(UsersListInitial()) {
    on<UsersListAddUser>(addUser);
    on<UsersListRemoveUser>(removeUser);
  }

  Future<void> addUser(
    UsersListAddUser event,
    Emitter<UsersListState> emit,
  ) async {
    emit(UsersListLoading());

    // Functionality
    useres.add(
      event.user,
      // User(
      //   name: event.user.name,
      //   email: event.user.email,
      //   userName: event.user.userName,
      //   // Not entering fatherName, because it is not required field.
      // ),
    );

    emit(
      UsersListLoaded(
        users: useres,
      ),
    );
  }

  Future<void> removeUser(
    UsersListRemoveUser event,
    Emitter<UsersListState> emit,
  ) async {
    emit(UsersListLoading());

    // Functionality
    useres.remove(
      event.user,
      // User(
      //   name: event.user.name,
      //   email: event.user.email,
      //   userName: event.user.userName,
      //   // Not entering fatherName, because it is not required field.
      // ),
    );

    emit(
      UsersListLoaded(
        users: useres,
      ),
    );
  }
}
