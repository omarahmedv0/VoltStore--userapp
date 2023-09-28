import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/init_app.dart';
import '../../../data/models/notifications_model.dart';
import '../../../data/repo/notifications_repo_impl.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepoImpl)
      : super(NotificationsInitial());
  static NotificationsCubit get(context) {
    return BlocProvider.of(context);
  }

  NotificationsRepoImpl notificationsRepoImpl;

  NotificationsModel notificationsModel = NotificationsModel();
  Future<void> getNotifications(context) async {
    emit(GetNotificationsLoading());
    var response = await notificationsRepoImpl
        .getNotifications(sharedPreferences.getString("userID")!);
    response.fold((failure) {
      emit(GetNotificationsFailere());
    }, (notifyModel) {
      notificationsModel = notifyModel;
      emit(GetNotificationsSuccess());
    });
  }
}
