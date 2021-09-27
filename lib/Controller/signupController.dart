import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/Controller/signupInterface.dart';

class SignupController implements SignupInterface {
  SignupViewModel view;
  SignupController(this.view);
  RestClient api = RestClient(Dio());

  @override
  void success(String token, String deviceID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("device_id", deviceID);
  }

  @override
  void destroy() => view = Null as SignupViewModel;

  @override
  void signup(
      String name, String email, String password, String deviceID) async {
    print('nama: $name');
    print('email: $email');
    print('Password: $password');
    print('deviceID: $deviceID');
    await api.signup(name, email, password, deviceID).then((response) {
      if (response.status == 1) {
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
