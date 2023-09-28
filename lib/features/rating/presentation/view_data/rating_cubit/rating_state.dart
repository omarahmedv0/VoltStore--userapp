part of 'rating_cubit.dart';

@immutable
class RatingState {}

class RatingInitial extends RatingState {}

class SubmitRateSuccess extends RatingState {}

class SubmitRateError extends RatingState {}

class SubmitRateLoading extends RatingState {}

class EditRateSuccess extends RatingState {}

class EditRateError extends RatingState {}

class EditRateLoading extends RatingState {}
