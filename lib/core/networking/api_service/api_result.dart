import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loc_camp_app/core/networking/error_handler_base.dart';

import 'api_error_handler.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ServiceResult<T> with _$ServiceResult<T> {
  const factory ServiceResult.success(T data) = Success<T>;
  const factory ServiceResult.failure(Handler errorHandler) = Failure<T>;
}

