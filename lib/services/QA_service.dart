part of 'service.dart';

class QAService {
  static Future<ApiReturnValue> bertanya(
      String title, String body, int anonim) async {
    String apiUrl = baseUrl + 'questions';

    SharedPreferences logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token').toString();
    print(token);
    var client = http.Client();
    var apiResult = await client.post(Uri.parse(apiUrl),
        headers: {"auth-token": "$token"},
        body: {'title': title, 'body': body, 'anonym': anonim.toString()});
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    var data = jsonDecode(apiResult.body);

    // print(data['auth_token']);
    return ApiReturnValue(
        message: data['message'].toString(),
        success: data['status'].toString());
  }
}
