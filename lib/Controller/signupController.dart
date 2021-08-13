import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/model/signupModel.dart';

class SignupController implements SignupModel {
  SignupViewModel view;
  SignupController(this.view);
  RestClient api = RestClient(Dio());

  @override
  void success(String token, String deviceID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("api_token", deviceID);
  }

  @override
  void destroy() => view = Null as SignupViewModel;

  @override
  void signup(
      String name, String email, String password, String deviceID) async {
    await api.signup(name, email, password, deviceID).then((it) {
      if (it.status == 1) {
        view.finish();
      } else {
        view.toast("Register gagal. Mungkin email sudah digunakan");
      }
    }).catchError((e) {
      print(e);
      view.toast("Terjadi kesalahan. Coba lagi nanti");
    });
  }
}
