
import 'package:loc_camp_app/core/networking/error_handler_base.dart';
import 'package:loc_camp_app/features/notification/data/repo/notification_api_call.dart';
import '../../../../core/networking/api_service/api_error_handler.dart';
import '../../../../core/networking/api_service/api_result.dart';
import '../models/notification_model.dart';

class NotificationRepo {
  final NotificationApiCall notificationApiCall;

  NotificationRepo(this.notificationApiCall);

  Future<ServiceResult> sendNotification(NotificationModel notificationModel) async{
    try {
      final response = await notificationApiCall.sendNotification(notificationModel);
      return ServiceResult.success(response);
    } catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
  }
}
