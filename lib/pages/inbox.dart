part of 'page.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.0),
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
                tabs: [
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
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
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
          body: TabBarView(children: [
            ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Answer(visible: false));
                    print("Ola");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                            DescriptionTextWidget(
                              text: deskripsi,
                              color: '4F4F4F',
                              size: 20,
                              length: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "16/09/2021",
                                style: TextStyle(
                                    color: 'A1A1A1'.toColor(),
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "13:30",
                            style: TextStyle(
                                color: 'A1A1A1'.toColor(),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    print("Ola");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                            DescriptionTextWidget(
                              text: deskripsi,
                              color: '4F4F4F',
                              size: 20,
                              length: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "16/09/2021",
                                style: TextStyle(
                                    color: 'A1A1A1'.toColor(),
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "13:30",
                            style: TextStyle(
                                color: 'A1A1A1'.toColor(),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    print("Ola");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                            DescriptionTextWidget(
                              text: deskripsi,
                              color: '4F4F4F',
                              size: 20,
                              length: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "16/09/2021",
                                style: TextStyle(
                                    color: 'A1A1A1'.toColor(),
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "13:30",
                            style: TextStyle(
                                color: 'A1A1A1'.toColor(),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Answer(visible: true));
                    print("Ola 1");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                            DescriptionTextWidget(
                              text: deskripsi,
                              color: '4F4F4F',
                              size: 20,
                              length: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "16/09/2021",
                                style: TextStyle(
                                    color: 'A1A1A1'.toColor(),
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "13:30",
                            style: TextStyle(
                                color: 'A1A1A1'.toColor(),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    print("Ola");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                            DescriptionTextWidget(
                              text: deskripsi,
                              color: '4F4F4F',
                              size: 20,
                              length: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "16/09/2021",
                                style: TextStyle(
                                    color: 'A1A1A1'.toColor(),
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "13:30",
                            style: TextStyle(
                                color: 'A1A1A1'.toColor(),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    print("Ola");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                            DescriptionTextWidget(
                              text: deskripsi,
                              color: '4F4F4F',
                              size: 20,
                              length: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "16/09/2021",
                                style: TextStyle(
                                    color: 'A1A1A1'.toColor(),
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "13:30",
                            style: TextStyle(
                                color: 'A1A1A1'.toColor(),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ])),
    );
  }
}
