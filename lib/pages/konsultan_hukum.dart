part of 'page.dart';

class KonsultanHukum extends StatefulWidget {
  const KonsultanHukum({Key? key}) : super(key: key);

  @override
  State<KonsultanHukum> createState() => _KonsultanHukumState();
}

class _KonsultanHukumState extends State<KonsultanHukum> {
  final controller = ScrollController();
  List<DatumKonsultanHukum> listKonsultan = [];
  int page = 1;
  bool hasMore = true;
  bool loading = false;

  Future getListKonsultanHukum() async {
    if (loading) return;
    loading = true;
    const limit = 10;
    String apiUrl = baseUrl +
        'konsultan-hukum?page=' +
        page.toString() +
        '&limit=' +
        limit.toString();
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
    // var data = jsonDecode(apiResult.body);
    ListKonsultan list = ListKonsultan.fromJson(jsonDecode(apiResult.body));
    print(list.message);
    // print(data['auth_token']);
    setState(() {
      page++;
      print(page);
      loading = false;
      if (list.data!.konsultanHukum!.data!.length < limit) {
        hasMore = false;
      }
      listKonsultan.addAll(list.data!.konsultanHukum!.data!);
    });
  }

  @override
  void initState() {
    super.initState();
    getListKonsultanHukum();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getListKonsultanHukum();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                    width: MediaQuery.of(context).size.width / 5.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Konsultan Hukum",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26.4,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5.5,
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: controller,
                itemCount: listKonsultan.length + 1,
                itemBuilder: (context, index) {
                  if (index < listKonsultan.length) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailKonsultan());
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: 'C6B69D'.toColor(),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(7, 7), // changes position of shadow
                            ),
                          ],

                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //         "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                          //     fit: BoxFit.cover)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 70,
                                  width: 250,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, bottom: 5),
                                    child: Text(
                                      listKonsultan[index].khName.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "Pengalaman 10 tahun",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 15,
                                //     fontFamily: 'Raleway',
                                //   ),
                                // ),
                              ],
                            ),
                            listKonsultan[index].khImg != null
                                ? Image.network(
                                    listKonsultan[index].khImg.toString(),
                                    height: 250,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                      'assets/image/user_vector.png',
                                      height: 150,
                                    ),
                                  )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return hasMore
                        ? Center(
                            child: Loading(),
                          )
                        : Text("TIdak ada Data Lagi");
                  }
                },
              )),
        ],
      ),
    ));
  }
}
