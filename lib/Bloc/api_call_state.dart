part of 'api_call_bloc.dart';

@immutable
abstract class ApiCallState {}

class ApiCallInitial extends ApiCallState {}
class ApiLoadingData extends ApiCallState{}

class ApiLoadedData extends ApiCallState{
  final ApiTest apiTest;
  final DataModel dataModel;
  final Autogenerated autogenerated;
  ApiLoadedData(this.apiTest, this.dataModel, this.autogenerated);
}
class ApiLoadedSelectedData extends ApiCallState{
  final DataModel dataModel;
  ApiLoadedSelectedData( this.dataModel);
}
class ApiError extends ApiCallState{
  final String message;

  ApiError(this.message);

}
class OpenState extends ApiCallState{
  final ApiTest apiTest;
  OpenState(this.apiTest);
}
class CloseState extends ApiCallState{}
class PostLoading extends ApiCallState{}
class PostSucess extends ApiCallState{}
class PostError extends ApiCallState {
final  error;

PostError(this.error);

}




