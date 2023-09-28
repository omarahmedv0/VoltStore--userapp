// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class GetSearchDataSuccess extends SearchState {}

class GetSearchDataFailere extends SearchState {
  String errMessage;
  ApiErrors apiErrors;
  GetSearchDataFailere(
     this.errMessage,
     this.apiErrors,
  );
}

class GetSearchDataLoading extends SearchState {}

class Update extends SearchState {}

