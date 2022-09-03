part of 'produc_bloc.dart';

@immutable
abstract class ProducState {}

class ProducInitial extends ProducState {}
class ProducLoading extends ProducState {}


class ProductLoaded extends ProducState{
  final Details product;
  ProductLoaded(this.product );
}
class ProductError extends ProducState{
  final dynamic message;

  ProductError(this.message);

}
