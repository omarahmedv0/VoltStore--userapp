// ignore_for_file: must_be_immutable

part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ChangeCatSelected extends ProductsState {}

class GetProductsDataSuccess extends ProductsState {}
class GetProductsDataLoading extends ProductsState {}
class GetProductsDataFailere extends ProductsState {
   String errMessage;
    ApiErrors apiErrors;

  GetProductsDataFailere(this.errMessage,this.apiErrors);
}


