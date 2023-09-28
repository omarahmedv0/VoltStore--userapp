import 'package:dartz/dartz.dart';

import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../models/address_model/address_model.dart';
import '../models/cities_model/cities_model.dart';
import 'address_repo.dart';

class AddressRepoImpl implements AddressRepo {
  final ApiService _apiService;

  AddressRepoImpl(this._apiService);



  @override
  Future<Either<Failure, AddressModel>> getAddress(
    String userId,
  ) async {
    try {
      var response = await _apiService.postData(ApiLinks.getAddress, {
        "userid": userId,
      });
      return response.fold(
        (failere) => left(failere),
        (addressData) => right(
          AddressModel.fromJson(addressData),
        ),
      );
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }

  @override
  Future<Either<Failure, CitiesModel>> getCities() async {
    try {
      var response = await _apiService.postData(ApiLinks.getCities, {});
      return response.fold(
        (failere) => left(failere),
        (data) => right(
          CitiesModel.fromJson(data),
        ),
      );
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }
  
  @override
  addAddress(String addressName, String cityID, String street, String addetionalDetails, String phone, String lat, String long, String userID) async{
     try {
      var response = await _apiService.postData(ApiLinks.addAddress, {
        "user_id": userID,
        "cityid": cityID,
        "addressname": addressName,
        'street': street,
        'phoneNumber': phone,
        'lat': lat,
        'long': long,
        'addetionalDetails': addetionalDetails,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }
  
  @override
  editAddress(String addressNo, String addressName, String cityID, String addetionalDetails, String phone, String street) async{
  try {
      var response = await _apiService.postData(ApiLinks.editAddress, {
        "address_no": addressNo,
        "cityid": cityID,
        "addressname": addressName,
        'street': street,
        'phoneNumber': phone,
        'addetionalDetails': addetionalDetails,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }
}
