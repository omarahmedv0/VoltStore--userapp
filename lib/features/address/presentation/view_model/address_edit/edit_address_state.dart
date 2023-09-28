part of 'edit_address_cubit.dart';

abstract class EditAddressState {}

class EditAddressInitial extends EditAddressState {}

class OnChangedState extends EditAddressState {}

class OnChangedCityState extends EditAddressState {}

class OnChangedCountryState extends EditAddressState {}

class InitialDataLoading extends EditAddressState {}

class InitialDataSuccess extends EditAddressState {}

class EditAddressDataSuccess extends EditAddressState {}

class EditAddressDataLoading extends EditAddressState {}

class EditAddressDataFailere extends EditAddressState {}

class GetCitiesDataSuccess extends EditAddressState {}

class GetCitiesDataFailere extends EditAddressState {}

class GetCitiesDataLoading extends EditAddressState {}
