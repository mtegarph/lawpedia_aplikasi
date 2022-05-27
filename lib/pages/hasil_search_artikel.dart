part of 'page.dart';

class HasilSearchArtikel extends StatefulWidget {
  final String? cari;
  // final Cari? cari;
  const HasilSearchArtikel({Key? key, this.cari}) : super(key: key);

  @override
  State<HasilSearchArtikel> createState() => _HasilSearchArtikelState();
}

class _HasilSearchArtikelState extends State<HasilSearchArtikel> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
  TextEditingController _searchQuery = new TextEditingController();
  int page = 1;
  bool hasMore = true;
  bool loading = false;
  bool kosong = false;
  String message = "";
  final controller = ScrollController();
  final controller2 = ScrollController();
  List<PopularArticleSearch> listArtikel = [];
  Future getListArsip() async {
    if (loading) return;
    loading = true;
    String apiUrl =
        baseUrl + 'articles?search=${widget.cari}&page=' + page.toString();
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
    print(data['message']);
    SearchArtikel list = SearchArtikel.fromJson(jsonDecode(apiResult.body));

    setState(() {
      message = list.message.toString();
      page++;
      print(page);
      loading = false;
      if (list.data!.articles?.to == null) {
        kosong = true;
      } else if (list.data!.articles!.to! <=
          list.data!.articles!.data!.length) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      listArtikel.addAll(list.data!.articles!.data!);
    });
  }

  @override
  void initState() {
    super.initState();
    getListArsip();
    print(widget.cari);
    print(message);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getListArsip();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: controller,
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
                          "Hasil Pencarian",
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                              // onChanged: updateSearchQuery,
                              onSubmitted: (data) {
                                Get.offUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HasilSearchArtikel(
                                              cari: data,
                                            )),
                                    (route) => true);
                              },
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: controller2,
                  itemCount: listArtikel.length + 1,
                  itemBuilder: (context, i) {
                    if (i < listArtikel.length) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailArtikel(id: listArtikel[i].articleId));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 160,
                                margin: EdgeInsets.only(left: 30),
                                decoration: BoxDecoration(
                                    color: 'C6B69D'.toColor(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(
                                            5, 3), // changes position of shadow
                                      ),
                                    ],
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: DescriptionTextWidget(
                                            text: listArtikel[i]
                                                .articleTitle
                                                .toString(),
                                            size: 22,
                                            length: 28,
                                            color: '383838',
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          listArtikel[i]
                                              .authorFirstName
                                              .toString(),
                                          style: TextStyle(
                                              color: 'A1A1A1'.toColor(),
                                              fontSize: 18,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "12 min",
                                          style: TextStyle(
                                              color: 'A1A1A1'.toColor(),
                                              fontSize: 18,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return kosong == true
                        ? Container()
                        : hasMore == true
                            ? Container(
                                alignment: Alignment.center,
                                height: 160.0,
                                child: CircularProgressIndicator(),
                              )
                            : Container();
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
