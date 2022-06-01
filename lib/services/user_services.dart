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
      String firstName,
      String lastName,
      String tglLahir) async {
    String apiUrl = baseUrl + 'register';
    var client = http.Client();
    var apiResult = await client.post(Uri.parse(apiUrl), body: {
      'email': email,
      'account_type': account,
      'profile_pict': profile,
      'first_name': firstName,
      'last_name': lastName,
      'tngl_lahir': tglLahir
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

  static Future<ApiReturnValue<UserDetail>> getUser() async {
    String apiUrl = baseUrl + 'user-profile';
    SharedPreferences logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token').toString();
    print(token);
    var client = http.Client();
    var apiResult = await client.get(
      Uri.parse(apiUrl),
      headers: {"auth-token": token},
    );
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    // var data = jsonDecode(apiResult.body);
    UserDetail listUser = UserDetail.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: listUser.message, success: listUser.status, value: listUser);
  }

  static Future<ApiReturnValue> editUsesr(
      String firstName, String lastName, String tglLahir,String noTelp) async {
    String apiUrl = baseUrl + 'user-profile';
    var client = http.Client();
    SharedPreferences logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token').toString();
    print(token);
    var apiResult = await client.post(Uri.parse(apiUrl), headers: {
      "auth-token": token
    }, body: {
      '_method': 'patch',
      'no_telp': noTelp,
      'first_name': firstName,
      'last_name': lastName,
      'tngl_lahir': tglLahir
    });
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    var data = jsonDecode(apiResult.body);

    print(data['auth_token']);
    return ApiReturnValue(message: data['message'], success: data['status']);
  }
}
