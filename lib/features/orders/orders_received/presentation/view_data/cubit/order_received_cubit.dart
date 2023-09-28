import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/init_app.dart';
import '../../../../shared/models/order_model/order_model.dart';
import '../../../data/repo/order_received_repo_impl.dart';

part 'order_received_state.dart';

class OrderReceivedCubit extends Cubit<OrderReceivedState> {
  OrderReceivedCubit(this.orderReceivedRepoImpl)
      : super(OrderReceivedInitial());
  OrderReceivedRepoImpl orderReceivedRepoImpl;

  static OrderReceivedCubit get(context) {
    return BlocProvider.of(context);
  }

  OrderModel ordersData = OrderModel();
  Future<void> getOrdersReceivedData(context) async {
    emit(GetOrdersReceivedLoading());
    var response = await orderReceivedRepoImpl
        .getOrdersReceived(sharedPreferences.getString("userID")!);
    response.fold((failure) {
      emit(GetOrdersReceivedFailere());
    }, (orders) {
      ordersData = orders;
      emit(GetOrdersReceivedSuccess());
    });
  }
}
