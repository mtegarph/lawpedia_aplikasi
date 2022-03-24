part of 'service.dart';

class Question {
  Future<ApiReturnValue<List<Datum>>> getQuestionDetail(
      String? answered, int? page) async {
    String apiUrl = baseUrl +
        'questions?status=' +
        answered.toString() +
        '&page=' +
        page.toString();
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
    QuestionList questionList =
        QuestionList.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: questionList.message,
        success: questionList.status,
        value: questionList.data?.questions?.data?.toList());
  }

  static Future<ApiReturnValue<QuestionDetail>> detailBertanya(
      String id) async {
    String apiUrl = baseUrl + 'questions/$id';

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
    var data = jsonDecode(apiResult.body);
    QuestionDetail detail = QuestionDetail.fromJson(data);
    // print(data['auth_token']);
    return ApiReturnValue(
        message: detail.message, success: detail.status, value: detail);
  }
}
