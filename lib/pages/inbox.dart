part of 'page.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  int index = 0;
  final controller = ScrollController();
  List<Datum>? items;
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();
  GlobalKey<PaginatorState> paginatorGlobalKey2 = GlobalKey();
  //api get list pertanyaan
  Future<QuestionList> getQuestionDetail(int? page) async {
    String apiUrl = baseUrl + 'questions?page=' + page.toString();
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
    //Question? pertanyaan = QuestionList.fromJson(jsonDecode(apiResult.body)).data.questions;
    QuestionList questionList =
        QuestionList.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return questionList;
  }

  Future<QuestionList> getQuestionDetailAnswered(int? page) async {
    String apiUrl =
        baseUrl + 'questions?page=' + page.toString() + '&status=answered';
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
    //Question? pertanyaan = QuestionList.fromJson(jsonDecode(apiResult.body)).data.questions;
    QuestionList questionList =
        QuestionList.fromJson(jsonDecode(apiResult.body));

    // print(data['auth_token']);
    return questionList;
  }

  //fungsi untuk membuat list widget nya
  Widget listItemBuilder(dynamic item, int index) {
    Datum questionList = item as Datum;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {
          context
              .read<QuestiondetailCubit>()
              .getQuestionDetail(questionList.questionId.toString())
              .then((value) {
            Get.to(Answer(
              visible: true,
              id: questionList.questionId.toString(),
              jawab: (context.bloc<QuestiondetailCubit>().state
                      as QuestionDetailSuccess)
                  .questionDetail
                  .data!
                  .questions!
                  .answer
                  .isBlank
                  .toString(),
            ));
          });
          print("date utc : " + questionList.createdAt!.toString());
          print("date local : " + questionList.createdAt!.toLocal().toString());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Text(questionList.qTitle.toString(),
                        style: TextStyle(
                            color: '4F4F4F'.toColor(),
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.normal)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      convertDateTime(questionList.createdAt!.toLocal()),
                      style: TextStyle(
                          color: 'A1A1A1'.toColor(),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //fungsi untuk membuat list widget nya
  Widget listItemBuilder2(dynamic item, int index) {
    Datum questionList = item as Datum;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {
          context
              .read<QuestiondetailCubit>()
              .getQuestionDetail(questionList.questionId.toString())
              .then((value) {
            Get.to(Answer(
              visible: true,
              id: questionList.questionId.toString(),
              jawab: (context.bloc<QuestiondetailCubit>().state
                      as QuestionDetailSuccess)
                  .questionDetail
                  .data!
                  .questions!
                  .answer!
                  .answer!,
            ));
          });
          print("date utc : " + questionList.createdAt!.toString());
          print("date local : " + questionList.createdAt!.toLocal().toString());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Text(questionList.qTitle.toString(),
                        style: TextStyle(
                            color: '4F4F4F'.toColor(),
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.normal)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      convertDateTime(questionList.createdAt!.toLocal()),
                      style: TextStyle(
                          color: 'A1A1A1'.toColor(),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//loading indicator
  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: const CircularProgressIndicator(),
    );
  }

  Future refresh() async {
    if (index == 0) {
      await getQuestionDetail;
    } else {
      await getQuestionDetailAnswered;
    }
  }

  //jika ada error
  Widget errorWidgetMaker(QuestionList dataproduk, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("error"),
        ),
        FlatButton(
          onPressed: retryListener,
          child: const Text('Retry'),
        )
      ],
    );
  }

  //mengambil berapa banyak data total yang bisa ditampilkan
  int totalPagesGetter(QuestionList dataProduk) {
    //int? total = dataProduk.data!.questions!.to!.toInt();

    return dataProduk.data!.questions!.total?.toInt() ?? 0;
  }

//untuk menaruh data data list dari api ke dalam data list lokal
  List<dynamic> listItemsGetterPages(QuestionList produk) {
    List<Datum> list = [];
    produk.data?.questions?.data?.forEach((value) {
      list.add(value);
    });
    print("data : ${list.length}");
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130.0),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              bottom: TabBar(
                onTap: (page) {
                  setState(() {
                    index = page;
                  });
                  print(index);
                },
                indicatorColor: 'FF5E5E'.toColor(),
                tabs: const [
                  Tab(
                    child: Text(
                      "Terkirim",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.4,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Terjawab",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.4,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              title: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Pertanyaan Kamu",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.4,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: 'F2F2F2'.toColor(),
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: refresh,
            child: TabBarView(children: [
              Paginator.listView(
                key: paginatorGlobalKey,
                totalItemsGetter: totalPagesGetter,
                emptyListWidgetBuilder: (pageData) {
                  return Container();
                },
                listItemBuilder: listItemBuilder,
                pageLoadFuture: getQuestionDetail,
                scrollPhysics: const BouncingScrollPhysics(),
                loadingWidgetBuilder: loadingWidgetMaker,
                errorWidgetBuilder: errorWidgetMaker,
                pageErrorChecker: (QuestionList pageData) {
                  return false;
                },
                pageItemsGetter: listItemsGetterPages,
              ),
              Paginator.listView(
                key: paginatorGlobalKey2,
                totalItemsGetter: totalPagesGetter,
                emptyListWidgetBuilder: (pageData) {
                  return Container();
                },
                listItemBuilder: listItemBuilder2,
                pageLoadFuture: getQuestionDetailAnswered,
                scrollPhysics: const BouncingScrollPhysics(),
                loadingWidgetBuilder: loadingWidgetMaker,
                errorWidgetBuilder: errorWidgetMaker,
                pageErrorChecker: (QuestionList pageData) {
                  return false;
                },
                pageItemsGetter: listItemsGetterPages,
              ),
            ]),
          )),
    );
  }
}
