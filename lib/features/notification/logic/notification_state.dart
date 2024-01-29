

import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_state.freezed.dart';

@freezed
class NotificationState<T> with _$NotificationState<T>{
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.loading() = Loading;
  const factory NotificationState.success(T data) = Success<T>;
  const factory NotificationState.error({required String error}) = Error;
}
