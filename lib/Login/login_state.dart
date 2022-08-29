part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSucess extends LoginState {}
class LoginError extends LoginState {
  final  error;

  LoginError(this.error);

}
class RegisterLoading extends LoginState {}
class RegisterSucess extends LoginState {}
class RegisterError extends LoginState {
  final String error;

  RegisterError(this.error);

}