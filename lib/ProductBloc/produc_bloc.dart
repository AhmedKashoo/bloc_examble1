import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Data/Model/product.dart';
import '../Data/Repo/Dio.dart';

part 'produc_event.dart';
part 'produc_state.dart';

class ProducBloc extends Bloc<ProducEvent, ProducState> {
  Details?product;
  ProducBloc() : super(ProducInitial()) {
    on<ProducEvent>((event, emit) async{
      if(event is GetProduct){
        emit(ProducLoading());
        await DioHelper.getData(
            url: 'http://192.168.0.201:8080/souq/matgarDetailsServe?id=179',
            ).then((value) {

          product= Details.fromJson(value.data) ;
          print(value.data);
          emit(ProductLoaded(product!));
        }).catchError((onError) {
          emit(ProductError(onError));
          print(onError);


        });

      }
    });
  }
}
