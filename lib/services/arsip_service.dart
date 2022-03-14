part of 'service.dart';

class ArsipApi {
  static Future<List<Cari>> getData(String query) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final respone = await http.get(url);

    if (respone.statusCode == 200) {
      final List cari = jsonDecode(respone.body);
      return cari.map((json) => Cari.fromJson(json)).where((element) {
        final title = element.title.toLowerCase();
        final query_title = query.toLowerCase();
        return title.contains(query_title);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
