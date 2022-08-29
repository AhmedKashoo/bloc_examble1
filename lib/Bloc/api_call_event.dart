part of 'api_call_bloc.dart';

@immutable
abstract class ApiCallEvent {}
class fetchData extends ApiCallEvent{}
class openDrawer extends ApiCallEvent{}
class closeDrawer extends ApiCallEvent{}
class PostEvent extends ApiCallEvent{
final int uid;
  final String description;
final List<dynamic>ints;

PostEvent(this.uid, this.description, this.ints );
}
