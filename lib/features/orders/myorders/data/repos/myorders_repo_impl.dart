// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/orders/myorders/data/repos/myorders_repo.dart';
import 'package:e_commerce_app/features/orders/shared/models/order_model/order_model.dart';

class MyordersRepoImpl implements MyordersRepo {
  ApiService apiService;
  MyordersRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, OrderModel>> getOrders(String userID) async {
    try {
      var response =
          await apiService.postData(ApiLinks.getOrdersData, {'userid': userID});
      return response.fold((failere) {
        return left(failere);
      }, (orderModel) {
        return right(OrderModel.fromJson(orderModel));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  

  @override
  Future<Either<Failure, Map<String, dynamic>>> cancelOrder(
      String orderID) async {
    try {
      var response =
          await apiService.postData(ApiLinks.cancelOrder, {'orderid': orderID});
      return response.fold((failere) {
        return left(failere);
      }, (success) {
        return right(success);
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
