
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc_camp_app/core/service/notification_service/notification_service.dart';
import 'package:loc_camp_app/features/notification/data/models/notification_data_model.dart';
import 'package:loc_camp_app/features/notification/data/models/notification_model.dart';
import '../data/models/data_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationService notificationService;
  NotificationCubit(this.notificationService) : super(const NotificationState.initial());

  static NotificationCubit get(context) => BlocProvider.of<NotificationCubit>(context);


  void emitNotificationStates(BuildContext context) async {
    emit(const NotificationState.loading());
    notificationService.requestNotificationPermission();
    notificationService.firebaaseInit(context);
    notificationService.setupInteractMessage(context);
    notificationService.getDeviceToken().then((value) {
      print('device Token');
      print(value);
    });
    // response.when(success: (loginModel) {
    //   emit(NotificationState.success(loginModel));
    //   debugPrint(loginModel.toString());
    // }, failure: (error) {
    //   emit(NotificationState.error(error: error.firebaseErrorModel.message ?? ''));
    // });
  }

  void emitSendNotification() async{
    NotificationDataModel nd = NotificationDataModel(
        body: 'How are you? ', title: 'Welcom To Our World');
    NotificationModel n = NotificationModel(
        notification: nd,
        priority: 'high',
        to: await notificationService.getDeviceToken(),
    );
    notificationService.sendNotification(n);
  }
}
