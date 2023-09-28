import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/language/initial_language.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../data/models/address_model/address_data.dart';
import '../../../data/models/address_model/address_model.dart';
import '../../../data/models/cities_model/cities_data.dart';
import '../../../data/repo/address_repo_impl.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this._addressRepoImpl) : super(AddressInitial());
  final AddressRepoImpl _addressRepoImpl;
  static AddressCubit get(context) {
    return BlocProvider.of(context);
  }

  getCityName(String cityID) {
    for (int i = 0; i < citiesData.length; i++) {
      if (cityID == citiesData[i].cityId) {
        return lange == 'en'
            ? citiesData[i].cityNameEn
            : citiesData[i].cityNameAr;
      }
    }
  }

  AddressModel addressData = AddressModel();
  getAddressData() async {
    emit(GetAddressDataLoading());
    var response = await _addressRepoImpl.getAddress(
      sharedPreferences.getString("userID")!,
    );
    response.fold((failere) {
      emit(GetAddressDataFailere());
    }, (address) {
      addressData = address;
      emit(GetAddressDataSuccess());
    });
  }



  List<CitiesData> citiesData = [];
  getCities() async {
    emit(GetCitiesDataLoading());
    var response = await _addressRepoImpl.getCities();
    response.fold((failere) {
      emit(GetCitiesDataFailere());
    }, (data) {
      citiesData = data.data!;
      print(citiesData[0]);
      emit(GetCitiesDataSuccess());
    });
  }

  toMapScreen(context) {
    toNamed(
      context,
      RouteManager.mapAddress,
    );
  }

  toEditScreen(context, AddressData address) {
    toNamed(
      context,
      RouteManager.addressEdit,
      arguments: {
        'address': address,
      },
    );
  }
}
