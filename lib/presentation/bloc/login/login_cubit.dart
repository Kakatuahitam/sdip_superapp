import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  final _storage = const FlutterSecureStorage();

  Future checkIfLoggedIn() async {
    final result = await _storage.read(key: 'isLoggedIn');
    bool isLoggedIn = result == "true";
    if (isLoggedIn) {
      emit(LoggedInState());
    } else {
      emit(LoggedOutState());
    }

    return isLoggedIn;
  }

  Future loggingOut() async {
    final result = await _storage.write(key: 'isLoggedIn', value: 'false');
  }

  // Future loggingIn() async {
  //   emit(LoggedInState());
  // }
}
