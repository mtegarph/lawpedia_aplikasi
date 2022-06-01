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
      headers: {"auth-token": token},
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

  final TextEditingController _searchQuery = TextEditingController();
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/Left.png'))),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 15),
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
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
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
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextField(
                                controller: _searchQuery,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'cari Pertanyaan',
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Colors.grey),
                                ),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                                // onChanged: updateSearchQuery,
                                onSubmitted: (data) {
                                  Get.to(HasilSearch(cari: data));
                                },
                              ))),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller2,
                    itemBuilder: (context, index) {
                      if (index < listArsip.length) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ListArsip(
                              id: listArsip[index].acId,
                              title: listArsip[index].acCategory,
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: "FFFFFF".toColor(),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 5), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        listArsip[index].acCategory!,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: '354259'.toColor(),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(right: 35.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/image/chevron.png')),
                                )
                              ],
                            ),
                          ),
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
