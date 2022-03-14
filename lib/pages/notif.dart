part of 'page.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: "FF4A4A".toColor(),
            ),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 10, left: 25),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Answer(visible: true));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20, top: 6),
                        width: 100,
                        height: 30,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Terjawab',
                            style: TextStyle(
                                color: 'FFFFFF'.toColor(),
                                fontSize: 17,
                                fontFamily: 'Tms',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: '4AFC7C'.toColor(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 27),
                    width: 440,
                    //height: 100,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                      //textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 27),
                    width: 440,
                    // height: 100,
                    child: Text(
                      "1 hour ago",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Raleway',
                      ),
                      //textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: "FF4A4A".toColor(),
            ),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 10, left: 25),
                    child: Container(
                      margin: EdgeInsets.only(right: 20, top: 6),
                      width: 100,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Terjawab',
                          style: TextStyle(
                              color: 'FFFFFF'.toColor(),
                              fontSize: 17,
                              fontFamily: 'Tms',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: '4AFC7C'.toColor(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 27),
                    width: 440,
                    //height: 100,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                      //textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 27),
                    width: 440,
                    // height: 100,
                    child: Text(
                      "1 hour ago",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Raleway',
                      ),
                      //textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: "FF4A4A".toColor(),
            ),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 10, left: 25),
                    child: Container(
                      margin: EdgeInsets.only(right: 20, top: 6),
                      width: 100,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Terjawab',
                          style: TextStyle(
                              color: 'FFFFFF'.toColor(),
                              fontSize: 17,
                              fontFamily: 'Tms',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: '4AFC7C'.toColor(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 27),
                    width: 440,
                    //height: 100,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                      //textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 27),
                    width: 440,
                    // height: 100,
                    child: Text(
                      "1 hour ago",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Raleway',
                      ),
                      //textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      page: "Notifikasi",
    );
  }
}
