part of 'widget.dart';

class Template extends StatefulWidget {
  final String page;
  final num width;
  final Widget child;
  const Template(
      {Key? key, required this.width, required this.page, required this.child})
      : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  //num panjang = 0;
  @override
  void initState() {
    super.initState();
  }

  panjangJudul() {
    if (widget.width != 0) {
      return widget.width;
    } else {
      return 5.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          
          children: [
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
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/image/Left.png'))),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /
                                panjangJudul(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.page,
                              style: const TextStyle(
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
                ]),
            widget.child
          ],
        ),
      ),
    );
  }
}
