part of 'page.dart';

class Answer extends StatefulWidget {
  final bool? visible;
  const Answer({Key? key, @required this.visible = false}) : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Template(
        page: '',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 10, right: 10, left: 10),
                child: Text(
                  "Lorem Ipsum dolor sit amet",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Container(
                    height: 100,
                    width: 490,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vitae facilisis velit. Sed nec velit efficitur urna consequat efficitur. ",
                      style: TextStyle(
                          color: '4D4D4D'.toColor(),
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  )),
              Visibility(
                visible: widget.visible!,
                child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  width: 500,
                  height: 400,
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
                              const EdgeInsets.only(top: 25, bottom: 10, left: 25),
                          child: Text(
                            "Jawab",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 10, left: 25),
                          width: 440,
                          height: 400,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer suscipit enim consequat eros bibendum, non eleifend erat molestie. Nulla a nunc id quam euismod finibus sit amet in purus. Duis lacinia neque tortor, eu viverra sem vulputate id. Etiam pharetra purus tellus. Vivamus consectetur volutpat tincidunt. Nam facilisis commodo ante, finibus eleifend neque congue non. Vestibulum vel commodo leo, eget vestibulum turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc luctus vitae lectus et dictum. Cras eu porta magna. Suspendisse mi ligula, viverra non condimentum at, pretium sit amet urna.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Raleway',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
