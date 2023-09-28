import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/class/api/api_errors.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/models/products.dart';
import '../../../../home/data/model/home/categories_data.dart';
import '../../../data/models/products_data_model.dart';
import '../../../data/repos/products_repo_impl.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepoImpl) : super(ProductsInitial());
  final ProductsRepoImpl _productsRepoImpl ;
  static ProductsCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> getProductsData(
      String categoryID, String userId, context) async {
    emit(GetProductsDataLoading());
    var response = await _productsRepoImpl.getProductsData(categoryID, userId);
    response.fold((failere) {
      emit(GetProductsDataFailere(failere.errMessage, failere.apiErrors));
    }, (productsDataModel) {
      getProductsDataSuccessState(productsDataModel, context);
    });
  }

  ProductsDataModel productsData = ProductsDataModel();
  void getProductsDataSuccessState(
      ProductsDataModel productsDataModel, context) {
       productsData = productsDataModel;
    emit(GetProductsDataSuccess());
  }

  String? categorySelectedId;
  getCategorySelectedId() {
    categorySelectedId = sharedPreferences.getString('categorySelectedId');
  }

  int? categorySelectedIndex;
  getCategorySelectedIndex() {
    categorySelectedIndex = sharedPreferences.getInt('categorySelectedIndex');
  }

  List<Categories>? categoriesData;

  initialData(context) {
    getCategorySelectedId();
    getCategorySelectedIndex();
    getProductsData(
        categorySelectedId!, sharedPreferences.getString('userID')!, context);
  }

  goToProductDetailsScreen(context, Products products) {
    toNamed(context, RouteManager.productsDetails, arguments: {
      'productsDetails': products,
    });
  }

  changeCatSelected(int index, context) {
    categorySelectedIndex = index;
    index++;
    getProductsData(
        index.toString(), sharedPreferences.getString('userID')!, context);
    emit(ChangeCatSelected());
  }
}
