import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../../core/functions/init_app.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../../../order_details/presentation/view_data/cubit/order_details_cubit.dart';
import '../../../../shared/models/order_model/order_model.dart';
import '../../../data/repos/myorders_repo_impl.dart';

part 'myorders_state.dart';

class MyordersCubit extends Cubit<MyordersState> {
  MyordersCubit(this.myordersRepoImpl) : super(MyordersInitial());
  static MyordersCubit get(context) {
    return BlocProvider.of(context);
  }

  MyordersRepoImpl myordersRepoImpl;

  OrderModel ordersData = OrderModel();
  Future<void> getOrdersData(context) async {
    emit(GetOrdersLoading());
    var response = await myordersRepoImpl
        .getOrders(sharedPreferences.getString("userID")!);
    response.fold((failure) {
      emit(GetOrdersFailere());
    }, (orders) {
      ordersData = orders;
      emit(GetOrdersSuccess());
    });
  }

  Future<void> cancelOrder(context, String orderID) async {
    emit(GetOrderDetailsLoading());
    var response = await myordersRepoImpl.cancelOrder(
      orderID,
    );
    response.fold((failure) {
      emit(GetOrderDetailsFailere());
    }, (success) {
      customSnackBar(
        context,
        'your order has been canceled',
        AnimatedSnackBarType.success,
        200,
      );
      getOrdersData(context);
      emit(GetOrderDetailsSuccess());
    });
  }

  toOrderDetailsScreen(context, String orderID) async {
    await OrderDetailsCubit.get(context).getOrderDetails(context, orderID);
    toNamed(
      context,
      RouteManager.orderDetails,
    );
  }
}
