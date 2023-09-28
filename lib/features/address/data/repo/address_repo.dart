import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/address_model/address_model.dart';
import '../models/cities_model/cities_model.dart';

abstract class AddressRepo {
  addAddress(
    String addressName,
    String cityID,
    String street,
    String addetionalDetails,
    String phone,
    String lat,
    String long,
    String userID,
  );


  editAddress(
    String addressNo,
    String addressName,
    String cityID,
    String addetionalDetails,
    String phone,
    String street,
  );
  Future<Either<Failure, AddressModel>> getAddress(
    String userId,
  );

  Future<Either<Failure, CitiesModel>> getCities();
}
