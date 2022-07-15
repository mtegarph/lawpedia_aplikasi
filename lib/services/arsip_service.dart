part of 'service.dart';

class ArsipApi {
  static Future<List<Cari>> getData(String query) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final respone = await http.get(url);

    if (respone.statusCode == 200) {
      final List cari = jsonDecode(respone.body);
      return cari.map((json) => Cari.fromJson(json)).where((element) {
        final title = element.title.toLowerCase();
        final queryTitle = query.toLowerCase();
        return title.contains(queryTitle);
      }).toList();
    } else {
      throw Exception();
    }
  }

  Future<ApiReturnValue<List<DatumSearch>>> getSearchArsip(
      String? search, int? page) async {
    String apiUrl = baseUrl +
        'consulting-archive?q=' +
        search.toString() +
        '&page=' +
        page.toString();
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
    SearchPertanyaan questionList =
        SearchPertanyaan.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: questionList.message,
        success: questionList.status,
        value: questionList.data?.questions?.data?.toList());
  }
}
