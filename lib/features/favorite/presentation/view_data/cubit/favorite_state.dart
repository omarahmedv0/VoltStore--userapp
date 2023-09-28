part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class AddorDeleteFavProductLoading extends FavoriteState {}

class ChangeStateIconFav extends FavoriteState {}

class AddedFavSuccessfully extends FavoriteState {}

class AddedFavFailere extends FavoriteState {}

class DeletedFavSuccessfully extends FavoriteState {}

class DeletedFavFailere extends FavoriteState {}

class GetFavoriteDataSuccess extends FavoriteState {
  FavoriteModel favoriteModel;
  GetFavoriteDataSuccess(this.favoriteModel);
}
class GetFavoriteDataFailere extends FavoriteState {
  String errMessage;
  ApiErrors apiErrors;
  GetFavoriteDataFailere(this.errMessage,this.apiErrors);
}
class GetFavoriteDataLoading extends FavoriteState {}


