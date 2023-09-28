// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetHomeDataSuccess extends HomeState {}

class GetHomeDataFailere extends HomeState {
  String errMessage;
    ApiErrors apiErrors;

  GetHomeDataFailere(this.errMessage,this.apiErrors);
}

class GetHomeDataLoading extends HomeState {}

