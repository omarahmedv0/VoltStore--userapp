// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_address_cubit.dart';

@immutable
abstract class AddAddressState {}

class AddressDetailsInitial extends AddAddressState {}

class OnChangedCountryState extends AddAddressState {}

class OnChangedCityState extends AddAddressState {}

class OnChangedState extends AddAddressState {}

class AddAddressLoading extends AddAddressState {}

class AddAddressSuccess extends AddAddressState {}

class AddAddressFailere extends AddAddressState {}

class GetCitiesDataSuccess extends AddAddressState {}

class GetCitiesDataFailere extends AddAddressState {}

class GetCitiesDataLoading extends AddAddressState {}
