// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/orders/orders_received/data/repo/order_received_repo.dart';
import 'package:e_commerce_app/features/orders/shared/models/order_model/order_model.dart';

class OrderReceivedRepoImpl extends OrderReceivedRepo {
  ApiService apiService;
  OrderReceivedRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, OrderModel>> getOrdersReceived(String userId) async {
    try {
      var response = await apiService
          .postData(ApiLinks.getOrdersReceived, {'userid': userId});
      return response.fold((failere) {
        return left(failere);
      }, (orderModel) {
        return right(OrderModel.fromJson(orderModel));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
