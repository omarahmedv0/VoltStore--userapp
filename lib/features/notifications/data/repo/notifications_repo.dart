import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/notifications_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure,NotificationsModel>> getNotifications(String userID);
}