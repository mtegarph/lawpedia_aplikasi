part of 'page.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
            child: Image.asset(
              "assets/image/maintenance.png",
              height: size.height * 0.35,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                child: Text(
                  "Fitur ini masih dalam tahap maintenance",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: '354259'.toColor(),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
              )),
        ],
      ),
    );
  }
}
