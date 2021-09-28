// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://127.0.0.1:8000/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginApiResponse> login(email, password, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginApiResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'DeviceID': deviceID},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupApiResponse> signup(name, email, password, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'nama': name, 'email': email, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignupApiResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'DeviceID': deviceID},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignupApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupApiResponse> deleteUser(id, password, token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'id': id, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignupApiResponse>(Options(
                method: 'DELETE',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/delete',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignupApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApiResponse> search(keyword, token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': keyword};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'news/search',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthResponse> auth(token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/refreshToken',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApiResponse> publisher(keyword, token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': keyword};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'news/search/publisherNews',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApiResponse> getDataChart(
      keyword, firstDate, lastDate, token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': keyword};
    final _data = {'firstDate': firstDate, 'lastDate': lastDate};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'news/search/rangeNews',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupApiResponse> updateName(id, name, token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'id': id, 'name': name};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignupApiResponse>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/update/name',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignupApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupApiResponse> updatePassword(
      id, oldPassword, newPassword, token, deviceID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'id': id,
      'oldPassword': oldPassword,
      'newPassword': newPassword
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignupApiResponse>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'token': token,
                  r'DeviceID': deviceID
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/update/password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignupApiResponse.fromJson(_result.data!);
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
}
