part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class Update extends ProductDetailsState {}

class GetProductColorSuccess extends ProductDetailsState {}

class GetProductColorFailere extends ProductDetailsState {}

class GetProductColorLoading extends ProductDetailsState {}

class GetProductSizeSuccess extends ProductDetailsState {}

class GetProductSizeLoading extends ProductDetailsState {}

class GetProductSizeFailere extends ProductDetailsState {}
class ChangeColorSelected extends ProductDetailsState {}
class ChangeSizeSelected extends ProductDetailsState {}
