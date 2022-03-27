part of 'page.dart';

class KamusHukum extends StatefulWidget {
  const KamusHukum({Key? key}) : super(key: key);

  @override
  State<KamusHukum> createState() => _KamusHukumState();
}

class _KamusHukumState extends State<KamusHukum> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  "Tidak ada karya tulis",
                                  style: TextStyle(fontSize: 24),
                                )),
                              ),
                              onSuggestionSelected: (Cari? sugesti) async {
                                final cari = sugesti!;
                                Get.to(HasilSearch(
                                  cari: cari,
                                ));
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
                                //   Text("Terpiliih: ${cari.title}")));
                              },
                              suggestionsCallback: ArsipApi.getData,
                              debounceDuration: Duration(milliseconds: 500),
                              textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                  hintText: "cari karya tulis",
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
              SizedBox(
                height: 25,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 16,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          print("Halo");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 30),
                              color: 'FF0000'.toColor(),
                              width: 5,
                              height: 100,
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
                                  padding: const EdgeInsets.only(
                                      top: 25),
                                  child: Container(
                                    height: 100,
                                    width: 500,
                                    child: DescriptionTextWidget(
                                      text: "[PDF] " + deskripsi,
                                      length: 130,
                                      size: 22,
                                      color: '000000',
                                    ),
                                  ),
                                )
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       left: 10, top: 9, bottom: 10),
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         "Fachruozi",
                                //         style: TextStyle(
                                //             color: 'A1A1A1'.toColor(),
                                //             fontSize: 18,
                                //             fontFamily: 'Raleway',
                                //             fontWeight: FontWeight.w500),
                                //       ),
                                //       SizedBox(
                                //         width: 30,
                                //       ),
                                //       Text(
                                //         "12/05/2020",
                                //         style: TextStyle(
                                //             color: 'A1A1A1'.toColor(),
                                //             fontSize: 18,
                                //             fontFamily: 'Raleway',
                                //             fontWeight: FontWeight.w500),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}