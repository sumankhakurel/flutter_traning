part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> product;
  final List<dynamic> productKeys;

  ProductLoaded({required this.product, required this.productKeys});
}

final class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
