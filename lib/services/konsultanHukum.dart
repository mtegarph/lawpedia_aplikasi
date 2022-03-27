part of 'service.dart';

class KonsultanHukumServices {
  static Future<ApiReturnValue<BannerKonsultan>> getBannerKonsultan() async {
    String apiUrl = baseUrl + 'home/konsultan-hukum';
    SharedPreferences logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token').toString();
    print(token);
    var client = http.Client();
    var apiResult = await client.get(
      Uri.parse(apiUrl),
      headers: {"auth-token": "$token"},
    );
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    // var data = jsonDecode(apiResult.body);
    BannerKonsultan konsultan =
        BannerKonsultan.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: konsultan.message,
        success: konsultan.status,
        value: konsultan);
  }

  static Future<ApiReturnValue<ListKonsultan>> getListKonsultanHukum(
      int? page) async {
    String apiUrl = baseUrl + 'konsultan-hukum?page=' + page.toString();
    SharedPreferences logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token').toString();
    print(token);
    var client = http.Client();
    var apiResult = await client.get(
      Uri.parse(apiUrl),
      headers: {"auth-token": "$token"},
    );
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    // var data = jsonDecode(apiResult.body);
    ListKonsultan listKonsultan =
        ListKonsultan.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: listKonsultan.message,
        success: listKonsultan.status,
        value: listKonsultan);
  }
}
