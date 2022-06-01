part of 'page.dart';

class WebArtikel extends StatefulWidget {
  final String web;
  const WebArtikel({Key? key, required this.web}) : super(key: key);

  @override
  State<WebArtikel> createState() => _WebArtikelState();
}

class _WebArtikelState extends State<WebArtikel> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) async {
        this.controller = controller;
        void loadLocalHtml() async {
          final url = Uri.dataFromString(widget.web,
                  mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
              .toString();
          controller.loadUrl(url);
        }

        loadLocalHtml();
      },
    );
  }
}
