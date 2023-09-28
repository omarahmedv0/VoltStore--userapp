// ignore_for_file: avoid_print

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/features/address/data/models/cities_model/cities_data.dart';
import 'package:e_commerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../data/repo/address_repo_impl.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit(this._addressRepoImpl) : super(AddressDetailsInitial());
  static AddAddressCubit get(context) {
    return BlocProvider.of(context);
  }
  
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController addetionalDetailsController = TextEditingController();
  final AddressRepoImpl _addressRepoImpl;

  String? citySelected;
  getCityID() {
    for (int i = 0; i < citiesData.length; i++) {
      if (citySelected == citiesData[i].cityNameEn ||
          citySelected == citiesData[i].cityNameAr) {
        return citiesData[i].cityId.toString();
      }
    }
  }

  onCityChanged(String? val) {
    citySelected = val;
    emit(OnChangedCityState());
  }

  List<CitiesData> citiesData = [];
  getCities() async {
    emit(GetCitiesDataLoading());
    var response = await _addressRepoImpl.getCities();
    response.fold((failere) {
      emit(GetCitiesDataFailere());
    }, (data) {
      citiesData = data.data!;
      emit(GetCitiesDataSuccess());
    });
  }

  addAddress(context, String lat, String long) async {
    var response = await _addressRepoImpl.addAddress(
      nameController.text,
      getCityID(),
      streetController.text,
      addetionalDetailsController.text,
      phoneController.text,
      lat,
      long,
      sharedPreferences.getString("userID")!,
    );

    if (response['status'] == 'success') {
      customSnackBar(
        context,
        'Address Added Successfully',
        AnimatedSnackBarType.success,
        30,
      );
      toNamedandRemoveUntil(
        context,
        RouteManager.address,
      );
      AddressCubit.get(context).getAddressData();
      emit(AddAddressSuccess());
    } else {
      customSnackBar(
        context,
        'An error occurred while adding the address',
        AnimatedSnackBarType.error,
        30,
      );
      emit(AddAddressFailere());
    }
  }

  @override
  Future<void> close() async {
    nameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    addetionalDetailsController.dispose();
    return super.close();
  }
}
