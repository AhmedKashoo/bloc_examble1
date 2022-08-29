import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_examble/Data/Repo/Dio.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      if (event is UserLogin) {
        emit(LoginLoading());
        await DioHelper.postData(
            url: 'https://souq-mahala.com/rest/rest.matgar/login', data: {
          'name': event.name,
          'password': event.password
        }).then((value) {
          emit(LoginSucess());
          print(value.data);
        }).catchError((onError) {
          emit(LoginError(onError));
          print(onError.toString());
        });
      }
      if (event is RegisterEvent){
        emit(LoginLoading());
       await DioHelper.postData(
            url: 'https://souq-mahala.com/rest/rest.matgar/register', data: {
          'name': event.name,
          'mail':event.email,
         'password': event.password,
          'phone':event.phone,
          'client':event.client,

        }).then((value) {
          emit(LoginSucess());
          print(value.data);
        }).catchError((onError) {
          emit(LoginError(onError));
          print(onError);
        });
      }
    });
  }
}
