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
      headers: {"auth-token": token},
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

  static Future<ApiReturnValue<KonsultanHukumDetail>> getKonsultanDetail(
      int id) async {
    String apiUrl = baseUrl + 'konsultan-hukum/$id';
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
    KonsultanHukumDetail konsultan =
        KonsultanHukumDetail.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: konsultan.message,
        success: konsultan.status,
        value: konsultan);
  }

  static Future<ApiReturnValue<RekomendasiKonsultan>>
      getKonsultanRekomendasi() async {
    String apiUrl = baseUrl + 'konsultan-hukum/recommendation';
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
    RekomendasiKonsultan konsultan =
        RekomendasiKonsultan.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: konsultan.message,
        success: konsultan.status,
        value: konsultan);
  }

  static Future<ApiReturnValue<KamusHukumKategori>>
      getKategoriKamusHukum() async {
    String apiUrl = baseUrl + 'kamus-hukum/category';
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
    KamusHukumKategori konsultan =
        KamusHukumKategori.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return ApiReturnValue(
        message: konsultan.message,
        success: konsultan.status,
        value: konsultan);
  }

  static Future<ApiReturnValue<LayananHukumSubKategori>> getListLayananHukumSub(
      int id) async {
    print("id : $id");
    String apiUrlsub =
        'https://development.lawpedia.id/api/layanan-hukum/detail-list?id=${id.toString()}';
    SharedPreferences logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token').toString();
    print(token);
    var client = http.Client();
    var apiResult = await http.get(
      Uri.parse(apiUrlsub),
      headers: {"auth-token": token},
    );
    if (apiResult.statusCode != 200) {
      print(apiResult.statusCode.toString());
    }
    // var data = jsonDecode(apiResult.body);
    LayananHukumSubKategori list =
        LayananHukumSubKategori.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    bool kosong = false;
    print(list.data!.layananHukum!.toJson());
    return ApiReturnValue(
        message: list.message, success: list.status, value: list);
    ;
  }
}
