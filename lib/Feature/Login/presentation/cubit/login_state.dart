part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginLoadedState extends LoginState {}

class LoginFauilreState extends LoginState {
  final String message;

  LoginFauilreState(this.message);
}

class ChangeObscureState extends LoginState {}

class ChangeCheckBoxValue extends LoginState {}
