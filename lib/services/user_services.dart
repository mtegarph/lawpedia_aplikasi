part of 'service.dart';

class UserService {
  static Future<ApiReturnValue> login(String email, String account) async {
    String apiUrl = baseUrl + 'login';
    var client = http.Client();
    var apiResult = await client.post(Uri.parse(apiUrl),
        body: {'email': email, 'account_type': account});
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    var data = jsonDecode(apiResult.body);
    Login login = Login.fromJson(data);
    // print(data['auth_token']);
    return ApiReturnValue(
        message: login.message, success: login.status, token: login.authToken);
  }

  static Future<ApiReturnValue<Login>> register(
      String email,
      String account,
      String profile,
      String first_name,
      String last_name,
      String tgl_lahir) async {
    String apiUrl = baseUrl + 'register';
    var client = http.Client();
    var apiResult = await client.post(Uri.parse(apiUrl), body: {
      'email': email,
      'account_type': account,
      'profile_pict': profile,
      'first_name': first_name,
      'last_name': last_name,
      'tngl_lahir': tgl_lahir
    });
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    var data = jsonDecode(apiResult.body);
    Login login = Login.fromJson(data);
    print(data['auth_token']);
    return ApiReturnValue(
        message: login.message, success: login.status, token: login.authToken);
  }
}