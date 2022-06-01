part of 'page.dart';

class HasilSearchKamusHukum extends StatefulWidget {
  final String? cari;
  final String? filter;
  final String? kat;
  // final Cari? cari;
  const HasilSearchKamusHukum({Key? key, this.cari, this.filter, this.kat})
      : super(key: key);

  @override
  State<HasilSearchKamusHukum> createState() => _HasilSearchKamusHukumState();
}

class _HasilSearchKamusHukumState extends State<HasilSearchKamusHukum> {
  TextEditingController _searchQuery = new TextEditingController();
  int page = 1;
  String _chosenValue = 'title';
  bool hasMore = true;
  bool loading = false;
  bool kosong = false;
  String message = "";
  final controller = ScrollController();
  final controller2 = ScrollController();
  List<DatumKamusHukum> dataKamusHukum = [];
  Future getListArsip() async {
    if (loading) return;
    loading = true;
    String apiUrl = baseUrl +
        'kamus-hukum?keyword=${widget.cari}&page=' +
        page.toString() +
        '&filter=${widget.filter}&cat=${widget.kat}';
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
    KamusHukumData list = KamusHukumData.fromJson(jsonDecode(apiResult.body));

    setState(() {
      message = list.message.toString();
      page++;
      print(page);
      loading = false;
      if (list.data!.kamusHukum?.to == null) {
        kosong = true;
      } else if (list.data!.kamusHukum!.to! <=
          list.data!.kamusHukum!.data!.length) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      dataKamusHukum.addAll(list.data!.kamusHukum!.data!);
    });
  }

  @override
  void initState() {
    super.initState();
    getListArsip();
    print('filter : ${widget.filter}');
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 1.4,
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
                                width: MediaQuery.of(context).size.width / 2,
                                child: TextField(
                                  controller: _searchQuery,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    hintText: 'cari Kamus Hukum',
                                    border: InputBorder.none,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                  ),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                  // onChanged: updateSearchQuery,
                                  onSubmitted: (data) {
                                    Get.offUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HasilSearchKamusHukum(
                                                  cari: data,
                                                  filter: _chosenValue,
                                                  kat: widget.kat,
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
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _chosenValue = newValue!;
                        });
                        print(_chosenValue);
                      },
                      items: <String>['title', 'date-entry', 'keyword']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: controller2,
                  itemCount: dataKamusHukum.length + 1,
                  itemBuilder: (context, i) {
                    if (i < dataKamusHukum.length) {
                      return InkWell(
                        onTap: () async {
                          final url = dataKamusHukum[i].kahuFile;
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
                                        text: "[PDF] " +
                                            dataKamusHukum[i]
                                                .kahuTitle
                                                .toString(),
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
                      ;
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
