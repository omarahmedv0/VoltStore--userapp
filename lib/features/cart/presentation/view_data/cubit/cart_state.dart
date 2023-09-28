// ignore_for_file: must_be_immutable

part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddedCartSuccessfully extends CartState {}

class AddedCartFailere extends CartState {}

class DeletedCartSuccessfully extends CartState {}

class DeletedCartFailere extends CartState {}

class GetCartDataSuccess extends CartState {
  GetCartDataSuccess();
}

class GetCartDataFailere extends CartState {
  String errMessage;
  ApiErrors apiErrors;
  GetCartDataFailere(this.errMessage, this.apiErrors);
}

class GetCartDataLoading extends CartState {}

class GetCountCartSuccess extends CartState {
  GetCountCartSuccess();
}

class GetCountCartFailere extends CartState {
  String errMessage;
  ApiErrors apiErrors;
  GetCountCartFailere(this.errMessage, this.apiErrors);
}

class GetCountCartLoading extends CartState {}

class CheckCouponSuccess extends CartState {}

class CheckCouponLoading extends CartState {}

class CheckCouponFailere extends CartState {}

class RemoveCouponSuccess extends CartState {}

class Update extends CartState {}

class IncreaseQuantitySuccess extends CartState {}

class IncreaseQuantityFailere extends CartState {}

class IncreaseQuantityLoading extends CartState {}

class DecreaseQuantitySuccess extends CartState {}

class DecreaseQuantityFailere extends CartState {}

class DecreaseQuantityLoading extends CartState {}
