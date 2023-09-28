import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/init_app.dart';
import '../../../data/models/order_details_model/order_details_model.dart';
import '../../../data/repo/order_details_repo_impl.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.orderDetailsRepoImpl) : super(OrderDetailsInitial());
    static OrderDetailsCubit get(context) {
    return BlocProvider.of(context);
  }

  OrderDetailsRepoImpl orderDetailsRepoImpl;
  OrderDetailsModel? orderDetailsData;
  Future<void> getOrderDetails(context, String orderID) async {
    emit(GetOrderDetailsLoading());
    var response = await orderDetailsRepoImpl.getOrderDetails(
        orderID, sharedPreferences.getString("userID")!);
    response.fold((failure) {
      emit(GetOrderDetailsFailere());
    }, (orderDetails) {
      orderDetailsData = orderDetails;
      emit(GetOrderDetailsSuccess());
    });
  }
}
