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
  @GET("berita/search")
  Future<ApiResponse> search(@Query("q") String keyword,
      @Field("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("user/refreshToken")
  Future<AuthResponse> auth(@Header("Authorization") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("berita/search/publisher")
  Future<ApiResponse> publisher(@Query("q") String keyword,
      @Field("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("berita/search/totalBerita")
  Future<ApiResponse> getDataChart(
      @Query("q") String keyword,
      @Field("tanggalAwal") String tanggalAwal,
      @Field("tanggalAkhir") String tanggalAkhir,
      @Field("token") String token,
      @Header("DeviceID") String deviceID);
}
