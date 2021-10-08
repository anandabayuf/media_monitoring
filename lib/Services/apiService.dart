import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("news/search")
  Future<ApiResponse> search(
      @Query("q") String keyword,
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("user/refreshToken")
  Future<AuthResponse> auth(@Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("news/search/publisherNews")
  Future<ApiResponse> publisher(
      @Query("q") String keyword,
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @GET("news/search/rangeNews")
  Future<ApiResponse> getDataChart(
      @Query("q") String keyword,
      @Query("firstDate") String firstDate,
      @Query("lastDate") String lastDate,
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @PUT("user/update/profile/name")
  Future<SignupApiResponse> updateName(
      @Field("id") int id,
      @Field("name") String name,
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @PUT("user/update/profile/password")
  Future<SignupApiResponse> updatePassword(
      @Field("id") int id,
      @Field("oldPassword") String oldPassword,
      @Field("newPassword") String newPassword,
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @PUT("user/update/profile/image")
  Future<SignupApiResponse> updateImage(
      @Field("id") int id,
      @Part() File file,
      @Header("Authoriaztion") String token,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @POST("news/manualInput")
  Future<SignupApiResponse> manualInput(
    @Field("category") String category,
    @Field("date") String date,
    @Field("title") String title,
    @Field("writer") String writer,
    @Field("content") String content,
    @Field("link") String link,
    @Field("publisher") String publisher,
    @Field("media") String media,
    @Header("DeviceID") String deviceID,
    @Header("token") String token,
  );

  @FormUrlEncoded()
  @POST("news/rssInput")
  Future<SignupApiResponse> rssInput(
    @Field("id") int id,
    @Field("link") String link,
    @Header("DeviceID") String deviceID,
    @Header("token") String token,
  );
}
