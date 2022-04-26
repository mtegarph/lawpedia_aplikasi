part of 'page.dart';

class ArsipKonsultasi extends StatefulWidget {
  const ArsipKonsultasi({Key? key}) : super(key: key);

  @override
  _ArsipKonsultasiState createState() => _ArsipKonsultasiState();
}

class _ArsipKonsultasiState extends State<ArsipKonsultasi> {
  int page = 1;
  bool hasMore = true;
  bool loading = false;
  String message = "";
  final controller = ScrollController();
  final controller2 = ScrollController();
  List<DatumKategori> listArsip = [];
  List<String> itemsPhoto = [
    'assets/image/book-solid.svg',
    'assets/image/building-solid.svg',
    'assets/image/copyright-solid.svg',
    'assets/image/book-open-solid.svg',
    'assets/image/ring-solid.svg',
    'assets/image/file-contract-solid.svg',
    'assets/image/book-solid.svg',
    'assets/image/building-solid.svg',
    'assets/image/copyright-solid.svg',
    'assets/image/book-open-solid.svg',
    'assets/image/ring-solid.svg',
    'assets/image/file-contract-solid.svg',
  ];
  List<String> nama = [
    'Notaris & PPAT',
    'Pendirian & Perubaran',
    'Hak Kekayaan Intelektual',
    'Legal Drafting',
    'Percerairan',
    'LDD Legal Due Dilligent',
  ];

  Future getListArsip() async {
    if (loading) return;
    loading = true;
    String apiUrl =
        'http://lawpedia.farzcentrix.com/api/consulting-archive/categories?page=' +
            page.toString();
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
    ArsipKonsultasiKategori list =
        ArsipKonsultasiKategori.fromJson(jsonDecode(apiResult.body));

    setState(() {
      message = list.message.toString();
      page++;
      print(page);
      loading = false;
      if (list.data!.archiveCategories!.data!.length <
          list.data!.archiveCategories!.to!) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      listArsip.addAll(list.data!.archiveCategories!.data!);
    });
  }

  @override
  void initState() {
    super.initState();
    getListArsip();
    print(listArsip.length);
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
      backgroundColor: Colors.white,
      body: ListView(children: [
        Column(mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Arsip Konsultasi",
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
                        child: Text(
                          "Cari Pertanyaan",
                          style: TextStyle(
                              color: 'A1A1A1'.toColor(),
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    controller: controller2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemBuilder: (context, index) {
                      if (index < listArsip.length) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ListArsip(
                                  id: listArsip[index].acId,
                                  title: listArsip[index].acCategory,
                                ));
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: 'E2E2E2'.toColor(),
                                          blurRadius: 5)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    itemsPhoto[index],
                                    color: Colors.red,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  listArsip[index].acCategory.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                    itemCount: listArsip.length + 1,
                  )),
            ]),
      ]),
    );
  }
}
