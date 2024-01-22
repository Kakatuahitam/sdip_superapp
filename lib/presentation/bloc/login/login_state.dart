part of 'login_cubit.dart';

abstract class LoginState extends Equatable {}

class InitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedInState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedOutState extends LoginState {
  @override
  List<Object> get props => [];
}
