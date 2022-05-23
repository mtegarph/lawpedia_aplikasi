part of 'page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchQuery = new TextEditingController();
  @override
  void initState() {
    super.initState();

    _searchQuery = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController search = new TextEditingController();
    bool show = false;
    var data = {};
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Column(
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
                        "Cari Pertanyaan",
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
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                              // onChanged: updateSearchQuery,
                              onSubmitted: (data) {
                                Get.to(HasilSearch(cari: data));
                              },
                            )
                            // TypeAheadField<Cari?>(
                            //   itemBuilder: (context, Cari? sugesti) {
                            //     final cari = sugesti!;
                            //     return ListTile(
                            //       title: Text(cari.title),
                            //     );
                            //   },
                            //   noItemsFoundBuilder: (context) => Container(
                            //     height: 100,
                            //     child: Center(
                            //         child: Text(
                            //       "Tidak ada pertanyaan",
                            //       style: TextStyle(fontSize: 24),
                            //     )),
                            //   ),
                            //   onSuggestionSelected: (Cari? sugesti) async {
                            //     final cari = sugesti!;
                            //     Get.to(HasilSearch(
                            //       cari: cari,
                            //     ));
                            //     // setState(() {
                            //     //   data = cari.toJson();
                            //     //   show = true;
                            //     // });
                            //     print(show);
                            //     // ScaffoldMessenger.of(context)
                            //     //   ..removeCurrentSnackBar()
                            //     //   ..showSnackBar(SnackBar(
                            //     //       content:
                            //     //           Text("Terpiliih: ${cari.title}")));
                            //   },
                            //   suggestionsCallback: ArsipApi.getData,
                            //   debounceDuration: Duration(milliseconds: 500),
                            //   textFieldConfiguration: TextFieldConfiguration(
                            //     decoration: InputDecoration(
                            //       hintText: "cari Pertanyaan",
                            //       border: InputBorder.none,
                            //     ),
                            //   ),
                            // ),
                            )),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
            // show == false
            //     ? Container()
            //     : Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 30, vertical: 30),
            //             child: Text(
            //               "Hasil Pencarian ",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 25,
            //                   fontFamily: 'Raleway',
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           Container(
            //             width: double.infinity,
            //             height: 150,
            //             color: Colors.black,
            //             child: HasilSearch(),
            //           )
            //         ],
            //       )
          ]),
    );
  }
}
