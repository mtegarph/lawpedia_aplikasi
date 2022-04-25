part of 'service.dart';

class Artikel {
  static Future<ApiReturnValue<BannerArtikel>> getBannerArtikel() async {
    String apiUrl = baseUrl + 'home/articles';
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
    BannerArtikel bannerArtikel =
        BannerArtikel.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: bannerArtikel.message,
        success: bannerArtikel.status,
        value: bannerArtikel);
  }

  static Future<ApiReturnValue<ArtikelDetail>> getDetailArtikel(int id) async {
    String apiUrl = baseUrl + 'articles/' + id.toString();
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
    ArtikelDetail bannerArtikel =
        ArtikelDetail.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: bannerArtikel.message,
        success: bannerArtikel.status,
        value: bannerArtikel);
  }
}
