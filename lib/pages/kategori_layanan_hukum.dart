part of 'page.dart';

class KategoriLayananHukum extends StatefulWidget {
  const KategoriLayananHukum({Key? key}) : super(key: key);

  @override
  State<KategoriLayananHukum> createState() => _KategoriLayananHukumState();
}

class _KategoriLayananHukumState extends State<KategoriLayananHukum> {
  int page = 1;
  bool hasMore = true;
  bool loading = false;
  String message = "";
  final controller = ScrollController();
  final controller2 = ScrollController();
  List<DatumLayananHukum> listArsip = [];
  Future getListLayananHukum() async {
    if (loading) return;
    loading = true;

    String apiUrl = baseUrl + 'layanan-hukum?page=' + page.toString();
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
    print(data['data']);
    LayananHukum list = LayananHukum.fromJson(jsonDecode(apiResult.body));

    setState(() {
      message = list.message.toString();
      page++;
      print(page);
      loading = false;
      if (list.data!.layananHukum!.data!.length <
          list.data!.layananHukum!.to!) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      listArsip.addAll(list.data!.layananHukum!.data!);
    });
  }

  @override
  void initState() {
    super.initState();
    getListLayananHukum();
    print(listArsip.length);
    print(message);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getListLayananHukum();
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
                          "Layanan Hukum",
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
              Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller2,
                    itemBuilder: (context, index) {
                      if (index < listArsip.length) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(LayananHukumSub(
                              id: listArsip[index].idLayananHukum,
                              judul: listArsip[index].layananHukum,
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
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Text(
                                        listArsip[index].layananHukum!,
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
