part of 'page.dart';

class HasilSearch extends StatefulWidget {
  final String? cari;
  // final Cari? cari;
  const HasilSearch({Key? key, this.cari}) : super(key: key);

  @override
  State<HasilSearch> createState() => _HasilSearchState();
}

class _HasilSearchState extends State<HasilSearch> {
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
  List<DatumSearch> listArsip = [];
  Future getListArsip() async {
    if (loading) return;
    loading = true;
    String apiUrl =
        baseUrl + 'consulting-archive?q=${widget.cari}&page=' + page.toString();
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
    SearchPertanyaan list =
        SearchPertanyaan.fromJson(jsonDecode(apiResult.body));

    setState(() {
      message = list.message.toString();
      page++;
      print(page);
      loading = false;
      if (list.data!.questions?.to == null) {
        kosong = true;
      } else if (list.data!.questions!.to! <=
          list.data!.questions!.data!.length) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      listArsip.addAll(list.data!.questions!.data!);
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
                                        builder: (context) => HasilSearch(
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
                itemCount: listArsip.length + 1,
                itemBuilder: (context, index) => (index < listArsip.length)
                    ? GestureDetector(
                        onTap: () {
                          Get.to(Answer(
                            id: listArsip[index].questionId.toString(),
                          ));
                          print("Halo");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 30),
                              color: 'FF0000'.toColor(),
                              width: 5,
                              height: 110,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 20, bottom: 10),
                                  child: Text(
                                    listArsip[index].qTitle.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DescriptionTextWidget(
                                  text: deskripsi,
                                  length: 60,
                                  size: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 9, bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Fachruozi",
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
                                        convertDateTime(
                                            listArsip[index].questionedAt!),
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
                      )
                    : kosong == true
                        ? Container()
                        : hasMore == true
                            ? Container(
                                alignment: Alignment.center,
                                height: 160.0,
                                child: CircularProgressIndicator(),
                              )
                            : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
