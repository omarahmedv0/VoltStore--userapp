import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/products.dart';
import '../../../data/models/products_reviews/products_reviews_model.dart';
import '../../../data/repo/rating_repo_impl.dart';

part 'products_reviews_state.dart';

class ProductsReviewsCubit extends Cubit<ProductsReviewsState> {
  ProductsReviewsCubit(this.ratingRepoImpl) : super(ProductsReviewsInitial());

  static ProductsReviewsCubit get(context) {
    return BlocProvider.of(context);
  }

  Products? productDetails;

  RatingRepoImpl ratingRepoImpl;
  initialData(context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    productDetails = arguments['productReview'];
  }

  ProductsReviewsModel productsReviewsData = ProductsReviewsModel();
  Future<void> getProductReviewsData(String productsID) async {
    emit(GetProductsReviewsLoading());
    var response = await ratingRepoImpl.getProductReviewsData(productsID);
    response.fold((failure) {
      emit(GetProductsReviewsFailere());
    }, (data) {
      productsReviewsData = data;
      emit(GetProductsReviewsSuccess());
    });
  }
}
