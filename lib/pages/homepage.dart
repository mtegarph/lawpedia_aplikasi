part of 'page.dart';

class HomePage extends StatefulWidget {
  final GoogleSignInAccount? user;
  final Map? facebook;

  const HomePage({Key? key, @required this.user, @required this.facebook})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue = false;
  bool loading_home = true;
  String? token;
  TextEditingController judulController = new TextEditingController();
  TextEditingController pertanyaanController = new TextEditingController();
  bool loading = false;
  Widget makeDismissable({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data();
    context.read<KonsultanhukumCubit>().getBannerKonsultan().then((value) {
      setState(() {
        loading_home = false;
      });
    });
  }

  void _data() async {
    SharedPreferences logindata = await SharedPreferences.getInstance();
    token = logindata.getString('token').toString();
    print("Token: $token");
  }

  alertDialog(
      String desc, String title, String img, String yes, VoidCallback goTo) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            descriptions: desc,
            yes: yes,
            img: img,
            title: title,
            goTo: goTo,
          );
        });
  }

  Widget buildSheet() => makeDismissable(
        child: DraggableScrollableSheet(
            initialChildSize: 0.90,
            minChildSize: 0.5,
            maxChildSize: 0.90,
            builder: (_, controller) => loading
                ? Loading()
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    padding: EdgeInsets.all(16),
                    child: ListView(
                      controller: controller,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                                indent: 150,
                                endIndent: 150,
                                height: 20,
                                thickness: 5,
                                color: Colors.black),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Text('Kirim Pertanyaan',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: 'D7D7D7'.toColor(),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                style: TextStyle(fontSize: 18),
                                controller: judulController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(fontSize: 18),
                                    hintText: "Judul Pertanyaan"),
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                height: 550,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 30),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: 'D7D7D7'.toColor(),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  style: TextStyle(fontSize: 18),
                                  controller: pertanyaanController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 500,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 18),
                                      hintText: "Pertanyaan Anda"),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  BottomSheetSwitch(
                                      switchValue: _switchValue,
                                      valueChanged: (value) {
                                        _switchValue = value;
                                        print(_switchValue);
                                      }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Kirim Sebagai Anonim",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Raleway'),
                                  )
                                ],
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      primary: "FF3232".toColor(),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPrimary: Colors.black,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width /
                                              1.3,
                                          100),
                                      maximumSize: Size(
                                          MediaQuery.of(context).size.width /
                                              1.3,
                                          100),
                                      alignment: Alignment.centerLeft),
                                  onPressed: () async {
                                    print(judulController.text);
                                    print(pertanyaanController.text);
                                    await context
                                        .read<BertanyaCubit>()
                                        .bertanya(
                                            judulController.text,
                                            pertanyaanController.text,
                                            _switchValue == true ? 1 : 0)
                                        .then((value) {
                                      setState(() {
                                        loading = true;
                                      });
                                    });

                                    BertanyaState state =
                                        context.read<BertanyaCubit>().state;
                                    if (state is BerhasilBertanya) {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        loading = false;
                                      });
                                      alertDialog(
                                          'Pertanyaan Anda Berhasil Terkirim',
                                          "Berhasil",
                                          'assets/image/checklist.png',
                                          "Ok", () {
                                        // Navigator.of(context).pop();
                                      });
                                    } else if (state is BertanyaGagal) {
                                      setState(() {
                                        loading = false;
                                      });
                                      final snackBar = SnackBar(
                                        content: Text(state.message.toString()),
                                        action: SnackBarAction(
                                          label: 'ok',
                                          onPressed: () {
                                            //  Navigator.of(context).pop();
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      print(state.message);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Kirim Pertanyaan",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: 'F2F2F2'.toColor(),
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: 'F2F2F2'.toColor(),
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    color: Colors.white,
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: SizedBox(
                                  width: 160,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/image/logo.png",
                                    scale: 0.8,
                                  )),
                            ),
                            SizedBox(
                              width: 130,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 6),
                              width: 100,
                              height: 30,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Free',
                                  style: TextStyle(
                                      color: 'FFFFFF'.toColor(),
                                      fontSize: 20,
                                      fontFamily: 'Tms',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: '4AFC7C'.toColor(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                                right: 20,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(Notif());
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.solidBell,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: GestureDetector(
                                onTap: () => Get.to(Setting(
                                  user: widget.user,
                                  facebook: widget.facebook,
                                )),
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        widget.user?.photoUrl.toString() ??
                                            widget.facebook?["picture"]["data"]
                                                ["url"])),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SearchPage());
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
                                  child: Text(
                                    "Cari Pertanyaan",
                                    style: TextStyle(
                                        color: 'A1A1A1'.toColor(),
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.search),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                TitleWithMoreBtn(
                  title: "Konsultan Hukum",
                  press: () {
                    Get.to(KonsultanHukum());
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<KonsultanhukumCubit, KonsultanhukumState>(
                    builder: (context, state) => (state is KonsultanHukumSukses)
                        ? CarouselSlider.builder(
                            itemCount: state
                                .bannerKonsultan.data?.konsultanHukum?.length,
                            options: CarouselOptions(
                              //  autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              height: 190.0,
                              aspectRatio: 16 / 9,
                              //autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: false,
                              //autoPlayAnimationDuration: Duration(milliseconds: 3000)
                            ),
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: 'C6B69D'.toColor(),
                                  borderRadius: BorderRadius.circular(10.0),

                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                  //     fit: BoxFit.cover)
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 250,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, bottom: 5),
                                            child: Text(
                                              state
                                                  .bannerKonsultan
                                                  .data!
                                                  .konsultanHukum![index]
                                                  .khName!
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 27,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        //   Text(
                                        //   state.bannerKonsultan.data!
                                        //       .konsultanHukum![index].khDesc!
                                        //       .toString(),
                                        //   style: TextStyle(
                                        //     color: Colors.black,
                                        //     fontSize: 15,
                                        //     fontFamily: 'Raleway',
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    state
                                                .bannerKonsultan
                                                .data
                                                ?.konsultanHukum?[index]
                                                .khImg !=
                                            null
                                        ? Image.network(
                                            state.bannerKonsultan.data
                                                ?.konsultanHukum?[index].khImg,
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
                              );
                            },
                          )
                        : Loading()),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: "FF3232".toColor(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPrimary: Colors.black,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 1.1, 100),
                      alignment: Alignment.centerLeft),
                  onPressed: () => showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => buildSheet()),
                  icon: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.centerLeft,
                    children: [
                      Image(
                        image: AssetImage("assets/image/Rectangle.png"),
                        height: 100,
                        width: MediaQuery.of(context).size.width / 3,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10, left: 50),
                          child: Image(
                            image: AssetImage("assets/image/communication.png"),
                            height: 75,
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Mulai Bertanya",
                      style: TextStyle(
                          fontSize: 35,
                          color: 'F2F2F2'.toColor(),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TitleWithMoreBtn(
                  title: "Arsip Konsultasi",
                  press: () {
                    Get.to(ArsipKonsultasi());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    shrinkWrap: true,
                    children: List.generate(
                      8,
                      (index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ListArsip());
                              },
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: 'E2E2E2'.toColor(),
                                          blurRadius: 5)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/image/bus-solid.png"),
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                'Transportasi',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPrimary: Colors.black,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 1.1, 100),
                      alignment: Alignment.centerLeft),
                  onPressed: () {
                    Get.to(KamusHukum());
                  },
                  icon: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.centerLeft,
                    children: [
                      Image(
                        image: AssetImage("assets/image/Rectangle2.png"),
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.85,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10, left: 50),
                          child: Image(
                            image: AssetImage("assets/image/kamus.png"),
                            height: 75,
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Kamus Hukum',
                      style: TextStyle(
                          fontSize: 35,
                          color: 'FF3F3F'.toColor(),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TitleWithMoreBtn(
                  title: "Artikel",
                  press: () {
                    Get.to(Artikel());
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                CarouselSlider(
                  options: CarouselOptions(

                      // autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 0.95,
                      height: 300.0,
                      //aspectRatio: 16 / 9,
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
                                      fit: BoxFit.cover)),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 1.11,
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
                                              fontSize: 27),
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                      fit: BoxFit.cover)),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 1.11,
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
                                              fontSize: 27),
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                      fit: BoxFit.cover)),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 1.11,
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
                                              fontSize: 27),
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}