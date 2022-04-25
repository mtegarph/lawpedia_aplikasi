part of 'page.dart';

class ListArsip extends StatefulWidget {
  const ListArsip({Key? key}) : super(key: key);

  @override
  _ListArsipState createState() => _ListArsipState();
}

class _ListArsipState extends State<ListArsip> {
  final String deskripsi =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
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
                        width: 130,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Notaris & PPAT",
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
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Answer(visible: true,));
                  print("Halo");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 30),
                      color: 'FF0000'.toColor(),
                      width: 5,
                      height: 110,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DescriptionTextWidget(
                          text: deskripsi,
                          length: 60,
                          size: 16,
                        ),
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
                                "12/05/2020",
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
              GestureDetector(
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
                      height: 110,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DescriptionTextWidget(
                          text: deskripsi,
                          length: 60,
                          size: 16,
                        ),
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
                                "12/05/2020",
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
              GestureDetector(
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
                      height: 110,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DescriptionTextWidget(
                          text: deskripsi,
                          length: 60,
                          size: 16,
                        ),
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
                                "12/05/2020",
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
              GestureDetector(
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
                      height: 110,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DescriptionTextWidget(
                          text: deskripsi,
                          length: 60,
                          size: 16,
                        ),
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
                                "12/05/2020",
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
              GestureDetector(
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
                      height: 110,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DescriptionTextWidget(
                          text: deskripsi,
                          length: 60,
                          size: 16,
                        ),
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
                                "12/05/2020",
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
            ]),
      ]),
    );
  }
}
