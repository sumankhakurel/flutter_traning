import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void updateUser(String user) {
    // emit(UserLoading());
    if (state is UserLoaded) {
      final data = (state as UserLoaded).users;
      emit(UserLoaded(users: [...data, user]));
    } else {
      emit(UserLoaded(users: [user]));
    }
  }
}
