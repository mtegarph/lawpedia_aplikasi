part of 'page.dart';

class KonsultanHukum extends StatefulWidget {
  const KonsultanHukum({Key? key}) : super(key: key);

  @override
  State<KonsultanHukum> createState() => _KonsultanHukumState();
}

class _KonsultanHukumState extends State<KonsultanHukum> {
  @override
  Widget build(BuildContext context) {
    return Template(
        page: "Konsultan Hukum",
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
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
                          Padding(
                            padding: EdgeInsets.only(left: 15, bottom: 5),
                            child: Text(
                              "Warren Buffet",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 27,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Pengalaman 10 tahun",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/image/warren.png')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: 'E8E8E8'.toColor(),
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
                        Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            "Elon Musk",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 5),
                          child: Text(
                            "Pengalaman 7 tahun",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/image/elon.png')
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: 'C2C3D2'.toColor(),
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
                        Padding(
                          padding: EdgeInsets.only(left: 13, bottom: 5),
                          child: Text(
                            "Charles Hoskinson",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5, right: 65),
                          child: Text(
                            "Pengalaman 11 tahun",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/image/charles.png')
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
