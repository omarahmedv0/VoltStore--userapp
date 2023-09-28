import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/init_app.dart';
import '../../../data/models/myrating_model/myrating_model.dart';
import '../../../data/models/rating_model.dart';
import '../../../data/repo/rating_repo_impl.dart';

part 'my_rating_state.dart';

class MyRatingCubit extends Cubit<MyRatingState> {
  MyRatingCubit(
    this.ratingRepoImpl,
  ) : super(MyRatingInitial());
  static MyRatingCubit get(context) {
    return BlocProvider.of(context);
  }

  RatingRepoImpl ratingRepoImpl;
  MyratingModel myratingData = MyratingModel();

   Future<void> getMyratingData() async {
    emit(GetMyratingDataLoading());
    var response = await ratingRepoImpl
        .getMyRatingData(sharedPreferences.getString("userID")!);
    response.fold((failure) {
      emit(GetMyratingDataFailere());
    }, (data) {
      myratingData = data;
      emit(GetMyratingDataSuccess());
    });
  }

  bool checkRating(String userID, String productID) {
    bool res = false;
    int i = 0;
    for (i; i < ratingData.data.length; i++) {
      if (ratingData.data[i].rateProductid == productID &&
          ratingData.data[i].rateUserid == userID) {
        res = true;
        break;
      } else {
        res = false;
      }
    }
    i = 0;
    emit(CheckRateState());
    return res;
  }

  RatingModel ratingData = RatingModel();
  Future<void> getRatingData() async {
    emit(GetratingDataLoading());
    var response = await ratingRepoImpl.getRatingData();
    response.fold((failure) {
      emit(GetratingDataFailere());
    }, (data) {
      ratingData = data;
      emit(GetratingDataSuccess());
    });
  }
}
