// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_api_call.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NotificationApiCall implements NotificationApiCall {
  _NotificationApiCall(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://fcm.googleapis.com/fcm/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> sendNotification(NotificationModel notificationModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json',
      r'Authorization':
          'key=AAAAy4FeQq8:APA91bG4WQWFPCNHY_tA1b9pelCn7ENJUZT1GRKHUC8m-GC8pwcZ3saAngB5uRE0EaUcKiwGLSmEpqNQMkIlhmFaU_9--HykpZyijl-yhQ1f6q67zoB7GnfjekY2bzqmbrU6rq3VUHHH',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(notificationModel.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
        .compose(
          _dio.options,
          'send',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
