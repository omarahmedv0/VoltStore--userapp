part of 'address_cubit.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class GetAddressDataSuccess extends AddressState {}

class GetAddressDataFailere extends AddressState {}

class GetAddressDataLoading extends AddressState {}



class AddressDetailsInitial extends AddressState {}

class OnChangedCountryState extends AddressState {}

class OnChangedCityState extends AddressState {}

class OnChangedState extends AddressState {}

class AddAddressLoading extends AddressState {}

class AddAddressSuccess extends AddressState {}

// ignore: must_be_immutable
class AddAddressFailere extends AddressState {}

class EditAddressInitial extends AddressState {}

class InitialDataLoading extends AddressState {}

class InitialDataSuccess extends AddressState {}

class EditAddressDataSuccess extends AddressState {}

class EditAddressDataLoading extends AddressState {}

class EditAddressDataFailere extends AddressState {}

class GetCitiesDataSuccess extends AddressState {}

class GetCitiesDataFailere extends AddressState {}

class GetCitiesDataLoading extends AddressState {}
