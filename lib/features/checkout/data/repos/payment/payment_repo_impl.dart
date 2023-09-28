// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/features/checkout/data/repos/payment/payment_repo.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../../../core/constants/api_links.dart';

class PaymentRepoImpl implements PaymentRepo {
  ApiService apiService;
  PaymentRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, Map>> getClintSecretKey(
      String amount, String currency) async {
    try {
      var response = await apiService.postData(ApiLinks.paymentGatewayStripe, {
        'amount': amount,
        'currency': currency,
      }, headers: {
        'Authorization': 'Bearer ${ApiLinks.secretKeyStripe}',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      return response.fold((failere) {
        return left(
          failere,
        );
      }, (clientSecret) {
        return right(clientSecret);
      });
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }
}
