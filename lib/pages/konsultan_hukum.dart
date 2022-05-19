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
    String apiUrl = baseUrl + 'konsultan-hukum?page=' + page.toString();
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

    // print(data['auth_token']);
    setState(() {
      page++;
      print(page);
      loading = false;
      if (list.data!.konsultanHukum!.data!.length <
          list.data!.konsultanHukum!.to!) {
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
      print(listKonsultan.length);
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(
                  top: 20,
                  left: 16,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/Left.png'))),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            //  iconTheme: IconThemeData(color: Colors.black),
            title: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Text(
                "Konsultan Hukum",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.4,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: Padding(
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
                      print("ID KONSULTAN: "+listKonsultan[index].khId!.toString());
                      Get.to(DetailKonsultan(
                        id: listKonsultan[index].khId!.toInt(),
                      ));
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
                            offset: Offset(7, 7), // changes position of shadow
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
                                  padding: EdgeInsets.only(left: 15, bottom: 5),
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
                              // DescriptionTextWidget(
                              //     text: listKonsultan[index].khDesc!.toString(),
                              //     size: 15,
                              //     length: 35,
                              //     color: Colors.black.toString())
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
                                  height: 150,
                                )
                              : 
                              Padding(
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
                  return hasMore == true
                      ? Container()
                      : Center(
                          child: Loading(),
                        );
                }
              },
            )));
  }
}
