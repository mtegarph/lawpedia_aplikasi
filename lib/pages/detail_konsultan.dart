part of 'page.dart';

class DetailKonsultan extends StatefulWidget {
  const DetailKonsultan({Key? key}) : super(key: key);

  @override
  State<DetailKonsultan> createState() => _DetailKonsultanState();
}

class _DetailKonsultanState extends State<DetailKonsultan> {
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/image/warren.png')),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Warren Buffet & Association',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 50),
              child: Text(
                'Lawyer yang tersedia',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 60, right: 60),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          //color: 'C6B69D'.toColor(),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('assets/image/warren.png'),
                              fit: BoxFit.contain)),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Warren Buffet',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 60, right: 60),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          //color: 'C6B69D'.toColor(),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('assets/image/elon.png'),
                              fit: BoxFit.contain)),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Elon Musk',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 60, right: 60),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: 'C2C3D2'.toColor(),
                          //color: 'C6B69D'.toColor(),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('assets/image/charles.png'),
                              fit: BoxFit.contain)),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Charles Hoskinson',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 50),
              child: Text(
                'Data Diri',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 450,
            height: 230,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer suscipit enim consequat eros bibendum, non eleifend erat molestie. Nulla a nunc id quam euismod finibus sit amet in purus. Duis lacinia neque tortor, eu viverra sem vulputate id. Etiam pharetra purus tellus. Vivamus consectetur volutpat tincidunt. Nam facilisis commodo ante, finibus eleifend neque congue non. Vestibulum vel commodo leo, eget vestibulum turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          TitleWithMoreBtn(title: 'Konsultan Hukum Lainnya', press: () {}),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        //color: 'C6B69D'.toColor(),
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/image/warren.png'),
                            fit: BoxFit.contain)),
                    height: 110,
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Warren Buffet',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: 'C6B69D'.toColor(),
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/image/elon.png'),
                            fit: BoxFit.contain)),
                    height: 110,
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Elon Musk',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: 'C2C3D2'.toColor(),
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/image/charles.png'),
                            fit: BoxFit.contain)),
                    height: 110,
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Charles Hoskinson',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      page: 'Konstultan Hukum',
    );
  }
}
