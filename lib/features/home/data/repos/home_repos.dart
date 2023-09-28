import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../model/home/home_data_model.dart';

abstract class HomeRepo {
  Future<Either<Failure , HomeDataModel>> getHomeData (String userId);
}