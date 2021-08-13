import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';

class Authentication {
  RestClient api = RestClient(Dio());

  Future<String> formatToken() async {
    String token = await getToken();
    token = "Bearer $token";
    return token;
  }

  Future<String> formatDeviceID() async {
    String deviceID = await getDeviceID();
    deviceID = "$deviceID";
    return deviceID;
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return token;
  }

  Future<String> getDeviceID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String deviceID = (prefs.getString('deviceID') ?? "undifined");
    return deviceID;
  }

  Future<void> auth() async {
    String token = await formatToken();
    String deviceID = await formatDeviceID();
    await api.auth(token, deviceID).then((response) {
      if (response.status == 1) {
        return 1;
      } else {
        return 0;
      }
    });
  }
}
