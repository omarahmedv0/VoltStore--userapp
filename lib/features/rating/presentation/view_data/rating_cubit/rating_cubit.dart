import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/rating_dialog.dart';
import '../../../data/repo/rating_repo_impl.dart';
import '../myrating_cubit/my_rating_cubit.dart';
import '../products_reviews_cubit/products_reviews_cubit.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this.ratingRepoImpl) : super(RatingInitial());
  static RatingCubit get(context) {
    return BlocProvider.of(context);
  }

  RatingRepoImpl ratingRepoImpl;

  rateSubmit(
    String star,
    String? comment,
    String productID,
    context,
  ) async {
    emit(SubmitRateLoading());
    var response = await ratingRepoImpl.submitRate(
      sharedPreferences.getString("userID")!,
      productID,
      star,
      comment ?? 'none',
    );
    response.fold((error) {
      emit(SubmitRateError());
    }, (r) {
      MyRatingCubit.get(context).getRatingData();

      emit(SubmitRateSuccess());
    });
  }

   editRate(String star, String comment, String productID, context) async {
    emit(EditRateLoading());

    var response = await ratingRepoImpl.editRate(
      sharedPreferences.getString("userID")!,
      productID,
      star,
      comment,
    );
    response.fold((error) {
      emit(EditRateError());
    }, (r) {
      ProductsReviewsCubit.get(context).getProductReviewsData(productID);
      MyRatingCubit.get(context).getMyratingData();
      emit(EditRateSuccess());
    });
  }

  Future<void> showRatingDialog(context, String productID,
      {bool isAdd = true}) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => customRatingDialog((res) {
        if (isAdd == true) {
          rateSubmit(
            res.rating.toString(),
            res.comment,
            productID,
            context,
          );
        } else {
          editRate(res.rating.toString(), res.comment, productID, context);
        }
      }, context),
    );
  }
}
