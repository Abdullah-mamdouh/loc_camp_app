
import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_state.freezed.dart';

@freezed
class UsersState<T> with _$UsersState<T>{
  const factory UsersState.initial() = _Initial;

  const factory UsersState.loading() = Loading;
  const factory UsersState.success(T data) = Success<T>;
  const factory UsersState.error({required String error}) = Error;
  const factory UsersState.isConnected() = IsConnected;
}
