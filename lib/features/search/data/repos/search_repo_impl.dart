import 'package:dartz/dartz.dart';

import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../models/search_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;
  SearchRepoImpl(this._apiService);
  @override
  Future<Either<Failure, SearchModel>> getSearchData(String text) async {
    try {
      var response = await _apiService.postData(ApiLinks.getSearchDataLink, {
        'text': text,
      });

      return response.fold((failere) {
        return left(failere);
      }, (searchDataModel) {
        return right(SearchModel.fromJson(searchDataModel));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
