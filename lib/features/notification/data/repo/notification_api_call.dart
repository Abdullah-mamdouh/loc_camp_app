import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:loc_camp_app/features/notification/data/models/notification_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_service/api_constants.dart';
part 'notification_api_call.g.dart';

@RestApi(baseUrl: ApiNotificationConstants.baseUrl)
abstract class NotificationApiCall {
  factory NotificationApiCall(Dio dio, {String baseUrl}) = _NotificationApiCall;

  @POST(ApiNotificationConstants.send)
  @Headers(ApiNotificationConstants.headers)
  @JsonEncoder()
  Future sendNotification(
    @Body() NotificationModel notificationModel,
  );
//
// @POST(ApiConstants.signup)
// Future<SignupResponse> signup(
//   @Body() SignupRequestBody signupRequestBody,
// );
}
