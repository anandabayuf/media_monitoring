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
  @FormUrlEncoded()
  @POST("user/login")
  Future<LoginApiResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Header("DeviceID") String deviceID,
  );

  @FormUrlEncoded()
  @POST("user/register")
  Future<SignupApiResponse> signup(
      @Field("nama") String name,
      @Field("email") String email,
      @Field("password") String password,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @DELETE("user/delete")
  Future<SignupApiResponse> deleteUser(
      @Field("id") int id,
      @Field("password") String password,
      @Header("token") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("news/search")
  Future<ApiResponse> search(@Query("q") String keyword,
      @Header("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("user/refreshToken")
  Future<AuthResponse> auth(
      @Header("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("news/search/publisherNews")
  Future<ApiResponse> publisher(@Query("q") String keyword,
      @Header("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("news/search/rangeNews")
  Future<ApiResponse> getDataChart(
      @Query("q") String keyword,
      @Field("firstDate") String firstDate,
      @Field("lastDate") String lastDate,
      @Header("token") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @PUT("user/update/name")
  Future<SignupApiResponse> updateName(
      @Field("id") int id,
      @Field("name") String name,
      @Header("token") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @PUT("user/update/password")
  Future<SignupApiResponse> updatePassword(
      @Field("id") int id,
      @Field("oldPassword") String oldPassword,
      @Field("newPassword") String newPassword,
      @Header("token") String token,
      @Header("DeviceID") String deviceID);
}
