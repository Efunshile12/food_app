import 'package:aprilskuisine/data/api/api_client.dart';
import 'package:aprilskuisine/model/sign_in_model.dart';
import 'package:aprilskuisine/model/sign_up_model.dart';
import 'package:aprilskuisine/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }
  Future<Response> login(SignInBody signInBody) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URL, signInBody.toJson());
  }
  bool userLogged() {
    print("token" + sharedPreferences.getString(AppConstants.TOKEN).toString());
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }



  // Future<Response> login(String email, String password) async {
  //   return await apiClient.postData(
  //       AppConstants.LOGIN_URL, {"email": email, "password": password});
  // }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  // Future<bool> getUserToken2(String token) async {
  //   apiClient.token = token;
  //   apiClient.updateHeader(token);
  //   return await sharedPreferences.setString(AppConstants.TOKEN, token);
  // }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = "token";
    apiClient.updateHeader("");
    return true;
  }
}
