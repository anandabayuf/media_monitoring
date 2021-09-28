import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/Controller/loginInterface.dart';
import 'package:web_media_monitoring/model/userModel.dart';

class LoginController implements LoginInterface {
  LoginViewModel view;
  LoginController(this.view);
  RestClient api = RestClient(Dio());
  String? deviceID;

  @override
  void destroy() {
    view = Null as LoginViewModel;
  }

  @override
  void login(String email, String password, String deviceID) async {
    print('email: $email');
    print('Password: $password');
    if (deviceID is String) {
      print('deviceID: $deviceID');
    }
    await api.login(email, password, deviceID).then((response) async {
      int status = response.status;
      print(status);
      if (response.status == 1) {
        UserModel user = UserModel.fromJson(response.data);
        this.success(user.token, deviceID, user.role, user.id);
        view.finish();
      } else {
        view.toast("Login Gagal, Silahkan Ulangi");
      }
    }).catchError((e) {
      print("Exception $e");
      view.toast("Terjadi Kesalahan");
    });
  }

  @override
  void success(String token, String deviceID, String role, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("deviceID", deviceID);
    await prefs.setString("role", role);
    await prefs.setInt("id", id);
  }
}
