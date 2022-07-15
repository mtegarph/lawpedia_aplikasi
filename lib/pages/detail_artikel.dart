part of 'page.dart';

class DetailArtikel extends StatefulWidget {
  final int? id;
  const DetailArtikel({Key? key, @required this.id}) : super(key: key);

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  bool loading_artikel = true;
  //late WebViewPlusController controller;
  String? _web;
  String? desc;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController? _con;
  // Completer<WebViewPlusController> controller =
  //     Completer<WebViewPlusController>();
  String setHTML(String uri) {
    return ('''
    <html>
      <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.quilljs.com/1.3.6/quill.snow.css" >
      </head>
    
        <body style="background-color:#fff;height:100vh ">
          $uri
        </body>
      </html>
    ''');
  }

  _printz() => print("Hello");

  _loadHTML(String data) async {
    _con!.loadUrl(Uri.dataFromString(setHTML(data),
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    super.initState();
    context
        .read<ArtikelCubit>()
        .getDetailArtikel(widget.id!.toInt())
        .then((value) {
      setState(() {
        desc = (context.bloc<ArtikelCubit>().state as DetailArtikelSukses)
            .artikelDetail
            .data!
            .detailArtikel!
            .articleBody;
      });

      final document = parse(desc);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;
      setState(() {
        loading_artikel = false;
        desc = parsedString;
      });
    });
  }

  // void loadLocalHtml(String uri) async {
  //   final url = Uri.dataFromString('''<!DOCTYPE html>
  //                                                    <html lang="en">
  //                                                    <head>
  //                                                    <link rel="stylesheet" href="https://cdn.quilljs.com/1.3.6/quill.snow.css">

  //                                                    </head>
  //                                                    <body>

  //                                                    $uri
  //                                                    </body>
  //                                                    </html>
  //                                                    ''',
  //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
  //       .toString();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      //margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //inisialisasi back button
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              // margin: EdgeInsets.only(right: 26),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/image/Left.png'))),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5.5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26.4,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            BlocBuilder<ArtikelCubit, ArtikelState>(builder: (context, state) {
              if (state is DetailArtikelSukses) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 18, top: 5),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Text(
                              convertDateTime(state.artikelDetail.data!
                                  .detailArtikel!.publishedAt!),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        width: 500,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: "FF4A4A".toColor(),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16, top: 15),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              state.artikelDetail.data!.detailArtikel!
                                  .articleTitle
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontFamily: 'Courier',
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                        width: 230,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: "F6F6F6".toColor(),
                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //         "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                          //     fit: BoxFit.fill)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/image/user_vector.png')),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 46, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.artikelDetail.data!.detailArtikel!
                                          .authorFirstName
                                          .toString(),
                                      style: TextStyle(
                                        color: 'FF5252'.toColor(),
                                        fontSize: 18,
                                        fontFamily: 'Raleway',
                                      ),
                                    ),
                                    Text(
                                      'Admin',
                                      style: TextStyle(
                                        color: 'FF5252'.toColor(),
                                        fontSize: 14,
                                        fontFamily: 'Raleway',
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16, top: 15),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 1.16,
                              child: WebView(
                                initialUrl: 'https://flutter.dev',
                                javascriptMode: JavascriptMode.unrestricted,
                                onWebViewCreated: (WebViewController
                                    webViewController) async {
                                  setState(() {
                                    _web = state.artikelDetail.data!
                                        .detailArtikel!.articleBody!;
                                  });
                                  print("Data: $_web");
                                  // _controller.complete(webViewController);
                                  _con = webViewController;
                                  _loadHTML(_web.toString());
                                },
                                onProgress: (int progress) {
                                  print(
                                      "WebView is loading (progress : $progress%)");
                                },
                                navigationDelegate:
                                    (NavigationRequest request) {
                                  if (request.url
                                      .startsWith('https://www.youtube.com/')) {
                                    print('blocking navigation to $request}');
                                    return NavigationDecision.prevent;
                                  }
                                  print('allowing navigation to $request');
                                  return NavigationDecision.navigate;
                                },
                                onPageStarted: (String url) {
                                  print('Page started loading: $url');
                                },
                                onPageFinished: (String url) {
                                  print('Page finished loading: $url');
                                },
                                gestureNavigationEnabled: true,
                              )

                              //     Html(
                              //   data: '''<!DOCTYPE html>
                              //                 <html lang="en">
                              //                 <head>
                              //                 <title>Load file or HTML string example</title>

                              //                 </head>
                              //                 <body>
                              //                 <link rel="stylesheet" href="https://cdn.quilljs.com/1.3.6/quill.snow.css">
                              //                 ${state.artikelDetail.data!.detailArtikel!.articleBody!}
                              //                 </body>
                              //                 </html>
                              //                 ''',
                              //   onLinkTap:
                              //       (url, context, attributes, element) {
                              //     print('Open the url $url......');
                              //   },
                              //   onImageTap:
                              //       (url, context, attributes, element) {
                              //     print('Image $url');
                              //   },
                              //   onImageError: (exception, stacktrace) {
                              //     print(exception);
                              //   },
                              // )
                              //     Text(
                              //   "$desc",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 20,
                              //       fontFamily: 'Courier',
                              //       fontWeight: FontWeight.normal),
                              //   textAlign: TextAlign.justify,
                              // ),
                              )),
                    ],
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: 160.0,
                  child: const CircularProgressIndicator(),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}

String convertDateTime(DateTime dateTime) {
  String month;

  switch (dateTime.month) {
    case 1:
      month = 'Januari';
      break;
    case 2:
      month = 'Febuari';
      break;
    case 3:
      month = 'Maret';
      break;
    case 4:
      month = 'April';
      break;
    case 5:
      month = 'Mei';
      break;
    case 6:
      month = 'Juni';
      break;
    case 7:
      month = 'Juli';
      break;
    case 8:
      month = 'Agustus';
      break;
    case 9:
      month = 'September';
      break;
    case 10:
      month = 'Oktober';
      break;
    case 11:
      month = 'November';
      break;
    default:
      month = 'Desember';
  }

  return ' ${dateTime.day} $month ${dateTime.year}';
}
