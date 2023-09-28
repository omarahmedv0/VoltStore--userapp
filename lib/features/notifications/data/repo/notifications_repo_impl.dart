// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/notifications/data/models/notifications_model.dart';
import 'package:e_commerce_app/features/notifications/data/repo/notifications_repo.dart';

class NotificationsRepoImpl extends NotificationsRepo {
  ApiService apiService;
  NotificationsRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, NotificationsModel>> getNotifications(
      String userID) async {
    try {
      var response = await apiService.postData(ApiLinks.getNotifications, {
        'userid': userID,
      });
      return response.fold((failere) {
        return left(failere);
      }, (notifyModel) {
        return right(NotificationsModel.fromJson(notifyModel));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
