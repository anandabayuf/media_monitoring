import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'apiResponse.dart';
import 'loginApiResponse.dart';
import 'signupApiResponse.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: 'https://resep-mau.herokuapp.com/api/')
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
  @POST("search")
  Future<ApiResponse> search(@Field("keyword") String keyword,
      @Field("token") String token, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @POST("authentication")
  Future<LoginApiResponse> auth(@Header("Authorization") String token,
      @Header("DeviceID") String deviceID);
}
