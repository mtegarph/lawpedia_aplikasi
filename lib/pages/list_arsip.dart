part of 'page.dart';

class ListArsip extends StatefulWidget {
  final int? id;
  final String? title;
  const ListArsip({Key? key, @required this.id, @required this.title})
      : super(key: key);

  @override
  _ListArsipState createState() => _ListArsipState();
}

class _ListArsipState extends State<ListArsip> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
  int page = 1;
  bool hasMore = true;
  bool loading = false;
  bool kosong = false;
  String message = "";
  final controller = ScrollController();
  final controller2 = ScrollController();
  List<DatumKategoriDetail> listArsip = [];
  final TextEditingController _searchQuery = TextEditingController();
  Future getListArsip() async {
    if (loading) return;
    loading = true;
    String apiUrl = baseUrl +
        'consulting-archive?category=${widget.id}&page=' +
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
    ArsipKonsultasiDetail list =
        ArsipKonsultasiDetail.fromJson(jsonDecode(apiResult.body));

    setState(() {
      message = list.message.toString();
      page++;
      print(page);
      loading = false;
      if (list.data!.questions?.to == null) {
        kosong = true;
      } else if (list.data!.questions!.to! ==
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
    print(widget.id);
    print(message);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getListArsip();
      }
    });
  }

  Future refresh() async {
    await getListArsip();
    print(widget.id);
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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(controller: controller, children: [
          Column(mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Container(
                    //margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: 150,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                          image: AssetImage(
                                              'assets/image/Left.png'))),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 70, right: 70),
                                child: Text(
                                  '${widget.title}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 26.4,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Tap");
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
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
                                              color: Colors.black,
                                              fontSize: 16.0),
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                                margin:
                                    const EdgeInsets.only(top: 20, left: 30),
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
                                      style: const TextStyle(
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
                                        const SizedBox(
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
                                  child: const CircularProgressIndicator(),
                                )
                              : Container(),
                )
              ]),
        ]),
      ),
    );
  }
}
