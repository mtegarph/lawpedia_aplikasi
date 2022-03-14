part of 'page.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  //margin: EdgeInsets.only(bottom: defaultMargin),
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/Left.png'))),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 70, right: 70),
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
                            child: TypeAheadField<Cari?>(
                              itemBuilder: (context, Cari? sugesti) {
                                final cari = sugesti!;
                                return ListTile(
                                  title: Text(cari.title),
                                );
                              },
                              noItemsFoundBuilder: (context) => Container(
                                height: 100,
                                child: Center(
                                    child: Text(
                                  "Tidak ada Artikel",
                                  style: TextStyle(fontSize: 24),
                                )),
                              ),
                              onSuggestionSelected: (Cari? sugesti) async {
                                final cari = sugesti!;
                                // Get.to(HasilSearch(
                                //   cari: cari,
                                // ));
                                Get.offUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HasilSearch(
                                              cari: cari,
                                            )),
                                    (route) => true);
                                // setState(() {
                                //   data = cari.toJson();
                                //   show = true;
                                // });
                                // print(show);
                                // ScaffoldMessenger.of(context)
                                //   ..removeCurrentSnackBar()
                                //   ..showSnackBar(SnackBar(
                                //       content:
                                //           Text("Terpiliih: ${cari.title}")));
                              },
                              suggestionsCallback: ArsipApi.getData,
                              debounceDuration: Duration(milliseconds: 500),
                              textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                  hintText: "cari Artikel",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, bottom: 5),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(

                    // autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 0.85,
                    height: 300.0,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 3000)),
                items: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    scale: 20,
                                    image: NetworkImage(
                                        "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 1.11,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10,
                                          spreadRadius: 4)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hukum Pemberian Warisan",
                                        style: TextStyle(
                                            fontFamily: "Raleway",
                                            color: "DA2323".toColor(),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/image/user.png"),
                                                fit: BoxFit.fitWidth,
                                                height: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Brad Culp",
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    color: "373737".toColor(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/image/eye.png"),
                                                fit: BoxFit.fitWidth,
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.000",
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    color: "373737".toColor(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    scale: 20,
                                    image: NetworkImage(
                                        "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 1.11,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10,
                                          spreadRadius: 4)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hukum Pemberian Warisan",
                                        style: TextStyle(
                                            fontFamily: "Raleway",
                                            color: "DA2323".toColor(),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/image/user.png"),
                                                fit: BoxFit.fitWidth,
                                                height: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Brad Culp",
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    color: "373737".toColor(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/image/eye.png"),
                                                fit: BoxFit.fitWidth,
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.000",
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    color: "373737".toColor(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    scale: 20,
                                    image: NetworkImage(
                                        "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 1.11,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10,
                                          spreadRadius: 4)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hukum Pemberian Warisan",
                                        style: TextStyle(
                                            fontFamily: "Raleway",
                                            color: "DA2323".toColor(),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/image/user.png"),
                                                fit: BoxFit.fitWidth,
                                                height: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Brad Culp",
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    color: "373737".toColor(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/image/eye.png"),
                                                fit: BoxFit.fitWidth,
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "5.000",
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    color: "373737".toColor(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, bottom: 5),
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
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailArtikel());
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
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height / 17,
                                      width:
                                          MediaQuery.of(context).size.width / 1.6,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur ?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
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
                  })
            ]),
      ),
    );
  }
}
