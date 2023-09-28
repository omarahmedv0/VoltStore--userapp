part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LogoutState extends ProfileState {}

class UploadImage extends ProfileState {}

class EditProfileSuccess extends ProfileState {}
class EditProfileFailere extends ProfileState {}
class EditProfileLoading extends ProfileState {}
