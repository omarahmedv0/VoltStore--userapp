import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/class/api/api_errors.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/models/products.dart';
import '../../../data/models/search_model.dart';
import '../../../data/repos/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
  final SearchRepoImpl searchRepoImpl;
  static SearchCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  checkisSearch(String val) {
    if (val == '') isSearch = false;
    emit(Update());
  }

  changeStateScreen() {
    isSearch = true;
    emit(Update());
  }

  SearchModel searchModel = SearchModel();

  getSearchData() async {
    emit(GetSearchDataLoading());
    var response = await searchRepoImpl.getSearchData(
      searchController.text,
    );
    response.fold((failere) {
      emit(
        GetSearchDataFailere(
          failere.errMessage,
          failere.apiErrors,
        ),
      );
    }, (searchDataModel) {
      searchModel = searchDataModel;
      emit(GetSearchDataSuccess());
    });
  }

  toProductDetailsScreen(context, Products products) {
    toNamed(context, RouteManager.productsDetails, arguments: {
      'productsDetails': products,
    });
  }
}
