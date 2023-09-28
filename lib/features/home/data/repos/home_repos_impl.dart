import 'package:dartz/dartz.dart';

import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../model/home/home_data_model.dart';
import 'home_repos.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService ;
    HomeRepoImpl(this._apiService);


  @override
  Future<Either<Failure, HomeDataModel>> getHomeData(String userId) async {
    try {
      var response = await _apiService.postData(ApiLinks.homeLink,{
        'userid':userId
      });
   return   response.fold((failere) {
        return left(failere);
      }, (homeDataModel) {
        return right(HomeDataModel.fromJson(homeDataModel));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
