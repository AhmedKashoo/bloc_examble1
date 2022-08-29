part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class UserLogin extends LoginEvent{
  final String name;
  final String password;

  UserLogin(this.name, this.password);
}
class RegisterEvent extends LoginEvent{
  final String name;
  final String email;
  final String password;
  final String phone;
  final String client;

  RegisterEvent( this.name, this.email, this.password,this.phone, this.client);
}


