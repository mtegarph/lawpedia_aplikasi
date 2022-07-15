part of 'page.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  final controller = ScrollController();
  final controller2 = ScrollController();
  List<PopularArticle> listArtikel = [];
  List<PopularArticle> listArtikelPopular = [];
  int page = 1;
  bool hasMore = true;
  bool loading = false;

  Future getListArtikel() async {
    if (loading) return;
    loading = true;
    String apiUrl = baseUrl + 'articles?page=' + page.toString();
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
    // var data = jsonDecode(apiResult.body);
    ArtikelList list = ArtikelList.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    setState(() {
      page++;
      print(page);
      loading = false;
      if (list.data!.articles!.to! <= list.data!.articles!.data!.length) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      listArtikel.addAll(list.data!.articles!.data!);
      listArtikelPopular.addAll(list.data!.popularArticles!);
    });
  }

  @override
  void initState() {
    super.initState();
    getListArtikel();
    controller.addListener(() {
      print(listArtikel.length);
      if (controller.position.maxScrollExtent == controller.offset) {
        getListArtikel();
      }
    });
  }

  final TextEditingController _searchQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 70, right: 70),
                              child: Text(
                                'Artikel',
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
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: TextField(
                                        controller: _searchQuery,
                                        autofocus: true,
                                        decoration: const InputDecoration(
                                          hintText: 'cari Artikel',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                        // onChanged: updateSearchQuery,
                                        onSubmitted: (data) {
                                          Get.to(
                                              HasilSearchArtikel(cari: data));
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
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 30, bottom: 5),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              (loading == true)
                  ? Container(
                      alignment: Alignment.center,
                      height: 160.0,
                      child: const CircularProgressIndicator(),
                    )
                  : CarouselSlider.builder(
                      itemCount: listArtikelPopular.length,
                      options: CarouselOptions(
                          //  autoPlay: true,
                          enlargeCenterPage: false,
                          viewportFraction: 0.95,
                          height: 270.0,
                          //aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: false,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 3000)),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(DetailArtikel(
                                id: listArtikelPopular[index].articleId));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: const DecorationImage(
                                            scale: 20,
                                            image: NetworkImage(
                                                "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                9.0,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.11,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 10,
                                                  spreadRadius: 4)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: DescriptionTextWidget(
                                                  color: "DA2323",
                                                  size: 23,
                                                  length: 28,
                                                  text: listArtikelPopular[
                                                              index] !=
                                                          null
                                                      ? listArtikelPopular[
                                                              index]
                                                          .articleTitle
                                                          .toString()
                                                      : "Judul",
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Image(
                                                          image: AssetImage(
                                                              "assets/image/user.png"),
                                                          fit: BoxFit.fitWidth,
                                                          height: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          listArtikelPopular[
                                                                      index] !=
                                                                  null
                                                              ? listArtikelPopular[
                                                                      index]
                                                                  .authorFirstName
                                                                  .toString()
                                                              : "Brad Culp",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Raleway",
                                                              color: "373737"
                                                                  .toColor(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Image(
                                                          image: AssetImage(
                                                              "assets/image/eye.png"),
                                                          fit: BoxFit.fitWidth,
                                                          height: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "5.000",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Raleway",
                                                              color: "373737"
                                                                  .toColor(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 30, bottom: 5),
                child: Text(
                  "Lainnya",
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
                                margin: const EdgeInsets.only(left: 30),
                                decoration: BoxDecoration(
                                    color: 'C6B69D'.toColor(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            5, 3), // changes position of shadow
                                      ),
                                    ],
                                    image: const DecorationImage(
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
                                      child: SizedBox(
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
                                            length: 24,
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
                                        const SizedBox(
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
                      return hasMore == true
                          ? const Center(
                              child: Loading(),
                            )
                          : const Text("TIdak ada Data Lagi");
                    }
                  })
            ]),
      ),
    );
  }
}
