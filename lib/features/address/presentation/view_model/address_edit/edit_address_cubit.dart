import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../data/models/address_model/address_data.dart';
import '../../../data/models/cities_model/cities_data.dart';
import '../../../data/repo/address_repo_impl.dart';

part 'edit_address_state.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  EditAddressCubit(this._addressRepoImpl) : super(EditAddressInitial());

  final AddressRepoImpl _addressRepoImpl;
  static EditAddressCubit get(context) {
    return BlocProvider.of(context);
  }

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController addetionalDetailsController = TextEditingController();
  AddressData? addressData;

  initialData(context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    addressData = arguments['address'];
    if (nameController.text == '') {
        nameController.text = addressData!.addressName!;
      phoneController.text = addressData!.addressPhoneNumber!;
      streetController.text = addressData!.addressStreet!;
      addetionalDetailsController.text = addressData!.additionalDetails!;
    } 
  }

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

  editAddressData(
    context,
  ) async {
    emit(EditAddressDataLoading());
    var response = await _addressRepoImpl.editAddress(
      addressData!.addressNo!,
      nameController.text,
      getCityID(),
      addetionalDetailsController.text,
      phoneController.text,
      streetController.text,
    );

    if (response is ServerFailere) {
      customSnackBar(
        context,
        'An error has occurred',
        AnimatedSnackBarType.error,
        30,
      );
    } else if (response['status'] == 'success') {
      customSnackBar(
        context,
        'Address Edit Successfully',
        AnimatedSnackBarType.success,
        30,
      );
      toNamedandRemoveUntil(
        context,
        RouteManager.address,
      );

      emit(EditAddressDataSuccess());
    } else {
      customSnackBar(
        context,
        'An error occurred while Editing the address',
        AnimatedSnackBarType.error,
        30,
      );
      emit(EditAddressDataFailere());
    }
  }
}
