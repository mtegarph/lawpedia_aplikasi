part of 'page.dart';

class KamusHukum extends StatefulWidget {
  const KamusHukum({Key? key}) : super(key: key);

  @override
  State<KamusHukum> createState() => _KamusHukumState();
}

class _KamusHukumState extends State<KamusHukum> {
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();

  Future<KamusHukumData> getQuestionDetail(int? page) async {
    String apiUrl = baseUrl + 'kamus-hukum?page=' + page.toString();
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
    //Question? pertanyaan = QuestionList.fromJson(jsonDecode(apiResult.body)).data.questions;
    KamusHukumData kamusHukumList =
        KamusHukumData.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return kamusHukumList;
  }

//fungsi untuk membuat list widget nya
  Widget listItemBuilder(dynamic item, int index) {
    DatumKamusHukum dataKamusHukum = item as DatumKamusHukum;
    return InkWell(
      onTap: () async {
        final url = dataKamusHukum.kahuFile;
        if (await canLaunch(url.toString())) {
          await launch(url.toString(),
              forceSafariVC: false,
              forceWebView: false,
              enableJavaScript: true);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              color: 'FF0000'.toColor(),
              width: 5,
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 10, top: 20, bottom: 10),
                //   child: Text(
                //     "Lorem ipsum dolor sit amet, consectetur ?",
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 22,
                //         fontFamily: 'Raleway',
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    height: 150,
                    width: 500,
                    child: DescriptionTextWidget(
                      text: "[PDF] " + dataKamusHukum.kahuTitle.toString(),
                      length: 150,
                      size: 22,
                      color: '000000',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget errorWidgetMaker(KamusHukumData dataproduk, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("error"),
        ),
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  //mengambil berapa banyak data total yang bisa ditampilkan
  int totalPagesGetter(KamusHukumData dataProduk) {
    //int? total = dataProduk.data!.questions!.to!.toInt();

    return dataProduk.data!.kamusHukum!.total?.toInt() ?? 0;
  }

  List<dynamic> listItemsGetterPages(KamusHukumData produk) {
    List<DatumKamusHukum> list = [];
    produk.data?.kamusHukum?.data?.forEach((value) {
      list.add(value);
    });
    print("data : ${list.length}");
    return list;
  }
    TextEditingController _searchQuery = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: paginatorGlobalKey,
      body: ListView(
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  //margin: EdgeInsets.only(bottom: defaultMargin),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                  child: Row(
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
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/Left.png'))),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Kamus Hukum",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26.4,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Tap");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: "e3e3e3".toColor(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextField(
                                controller: _searchQuery,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'cari Pertanyaan',
                                  border: InputBorder.none,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                ),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                                // onChanged: updateSearchQuery,
                                onSubmitted: (data) {
                                  Get.to(HasilSearch(cari: data));
                                },
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Paginator.listView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                totalItemsGetter: totalPagesGetter,
                emptyListWidgetBuilder: (pageData) {
                  return Container();
                },
                listItemBuilder: listItemBuilder,
                pageLoadFuture: getQuestionDetail,
                scrollPhysics: BouncingScrollPhysics(),
                loadingWidgetBuilder: () {
                  return Center(
                    child: Loading(),
                  );
                },
                errorWidgetBuilder: errorWidgetMaker,
                pageErrorChecker: (KamusHukumData pageData) {
                  return false;
                },
                pageItemsGetter: listItemsGetterPages,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
