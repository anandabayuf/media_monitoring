import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_media_monitoring/Services/authResponse.dart';

import 'apiResponse.dart';
import 'loginApiResponse.dart';
import 'signupApiResponse.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/')
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  static const header = "Access-Control-Allow-Origin: *";
  @FormUrlEncoded()
  @POST("login")
  Future<LoginApiResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Header("DeviceID") String deviceID,
  );

  @FormUrlEncoded()
  @POST("signup")
  Future<SignupApiResponse> signup(
      @Field("nama") String name,
      @Field("email") String email,
      @Field("password") String password,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("search")
  Future<ApiResponse> search(@Query("q") String keyword,
      @Field("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("userRefreshToken")
  Future<AuthResponse> auth(@Header("Authorization") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("search/publisher")
  Future<ApiResponse> publisher(@Query("q") String keyword,
      @Field("token") String token, @Header("DeviceID") String deviceID);
}
