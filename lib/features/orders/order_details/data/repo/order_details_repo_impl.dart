// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/orders/order_details/data/models/order_details_model/order_details_model.dart';
import 'package:e_commerce_app/features/orders/order_details/data/repo/order_details_repo.dart';

class OrderDetailsRepoImpl implements OrderDetailsRepo {
  ApiService apiService;
  OrderDetailsRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
    String orderID,
    String userID,
  ) async {
    try {
      var response = await apiService.postData(
          ApiLinks.getOrderDetails, {'userid': userID, 'orderId': orderID});
      return response.fold((failere) {
        return left(failere);
      }, (orderModel) {
        return right(OrderDetailsModel.fromJson(orderModel));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
